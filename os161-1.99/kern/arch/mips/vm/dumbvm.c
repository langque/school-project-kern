/*
 * Copyright (c) 2000, 2001, 2002, 2003, 2004, 2005, 2008, 2009
 *	The President and Fellows of Harvard College.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <types.h>
#include <kern/errno.h>
#include <lib.h>
#include <spl.h>
#include <spinlock.h>
#include <proc.h>
#include <current.h>
#include <mips/tlb.h>
#include <addrspace.h>
#include <vm.h>

#include "opt-A3.h"

/*
 * Dumb MIPS-only "VM system" that is intended to only be just barely
 * enough to struggle off the ground. You should replace all of this
 * code while doing the VM assignment. In fact, starting in that
 * assignment, this file is not included in your kernel!
 */

/* under dumbvm, always have 48k of user stack */
#define DUMBVM_STACKPAGES    12

/*
 * Wrap rma_stealmem in a spinlock.
 */
static struct spinlock stealmem_lock = SPINLOCK_INITIALIZER;

#if OPT_A3
struct core_entry core_map[500*sizeof(struct core_entry)];
int total_page_number = 0;
#endif

void
vm_bootstrap(void)
{
	#if OPT_A3
	
	paddr_t lo;
	paddr_t hi;
	ram_getsize(&lo,&hi);
	int p = (hi-lo)%4096;
  	lo += p;  
  	KASSERT((hi-lo)%4096 == 0);
	total_page_number = (hi-lo)/PAGE_SIZE;
	for (int i = 0; i < total_page_number; ++i)
	{
		core_map[i].valid = 0;
		core_map[i].paddr = lo + i * PAGE_SIZE;
	}
	#endif
}

static
paddr_t
getppages(unsigned long npages)
{
	//DEBUG(DB_THREADS,"getppages  get  [ %d  ] page total_page_number is %d\n",(int)npages,total_page_number);
	paddr_t addr;
	spinlock_acquire(&stealmem_lock);
	#if OPT_A3
	int cnt = 0;
	if (total_page_number != 0)
	{	
		for(int i = 0; i<total_page_number; ++i){
			if (core_map[i].valid == 0){
				for (int j = i; j < (int)npages+i; ++j){
					if(core_map[j].valid == 0){
						core_map[j].valid = 1;
						++cnt;
					}else{
						cnt = j;
						for(int p = j; p>=i; --p){
							core_map[p].valid = 0;
						}
						i = cnt;
						cnt = 0;
						break;
					}
				}
			}
			if (i == total_page_number-1){
				return ENOMEM;
			}
			if(cnt == (int)npages){
					cnt = i;
					break;
			}
		}
		addr = core_map[cnt].paddr;
		//DEBUG(DB_THREADS," the new addrs ======================= getppages return is %d and cnt is %d\n",addr,cnt);
	} else addr = ram_stealmem(npages);
	#else
		addr = ram_stealmem(npages);
	#endif
	spinlock_release(&stealmem_lock);
	return addr;
}


/* Allocate/free some kernel-space virtual pages */
vaddr_t 
alloc_kpages(int npages)
{
	paddr_t pa;
	pa = getppages(npages);
	if (pa==0) {
		return 0;
	}
	DEBUG(DB_THREADS,"alloc_kpages here is %p \n",(void*)PADDR_TO_KVADDR(pa));
	return PADDR_TO_KVADDR(pa);
}

void 
free_kpages(vaddr_t addr)
{
	#if OPT_A3
	DEBUG(DB_THREADS,"free_kpages the addr %d \n",(int)addr);
	for(int i = 0; i<total_page_number; ++i){
		if((paddr_t)addr == core_map[i].paddr)
			core_map[i].valid = 0;
	}
	#else
	(void)addr;
	#endif
}

void
vm_tlbshootdown_all(void)
{
	panic("dumbvm tried to do tlb shootdown?!\n");
}

void
vm_tlbshootdown(const struct tlbshootdown *ts)
{
	(void)ts;
	panic("dumbvm tried to do tlb shootdown?!\n");
}

int
vm_fault(int faulttype, vaddr_t faultaddress)
{
	vaddr_t vbase1, vtop1, vbase2, vtop2, stackbase, stacktop;
	paddr_t paddr;
	int i;
	uint32_t ehi, elo;
	struct addrspace *as;
	int spl;

	faultaddress &= PAGE_FRAME;

	DEBUG(DB_THREADS, "dumbvm: fault: 0x%x\n ", faultaddress);

	switch (faulttype) {
	    case VM_FAULT_READONLY:
	    	return EFAULT;
			/* We always create pages read-write, so we can't get this */
			panic("dumbvm: got VM_FAULT_READONLY\n");
			break;
	    case VM_FAULT_READ:
	    case VM_FAULT_WRITE:
		break;
	    default:
		return EINVAL;
	}

	if (curproc == NULL) {
		/*
		 * No process. This is probably a kernel fault early
		 * in boot. Return EFAULT so as to panic instead of
		 * getting into an infinite faulting loop.
		 */
		return EFAULT;
	}

	as = curproc_getas();
	if (as == NULL) {
		/*
		 * No address space set up. This is probably also a
		 * kernel fault early in boot.
		 */
		return EFAULT;
	}

	/* Assert that the address space has been set up properly. */
	#if OPT_A3
	//paddr = 0;
	KASSERT(as->as_vbase1 != NULL);
	KASSERT(as->as_pbase1 != NULL);
	KASSERT(as->as_npages1 != 0);
	KASSERT(as->as_vbase2 != NULL);
	KASSERT(as->as_pbase2 != NULL);
	KASSERT(as->as_npages2 != 0);
	KASSERT(as->as_stackpbase != NULL);
	KASSERT(as->as_pbase3 != NULL);

	stackbase = USERSTACK - DUMBVM_STACKPAGES * PAGE_SIZE;
	stacktop = USERSTACK;

	vbase1 = as->as_vbase1[0];
	//KASSERT((vbase1 & PAGE_FRAME) == vbase1);
	vtop1 = vbase1 + PAGE_SIZE*as->as_npages1;

	vbase2 = as->as_vbase2[0];
	//KASSERT((vbase1 & PAGE_FRAME) == vbase1);
	vtop2 = vbase2 + PAGE_SIZE*as->as_npages2;

	stackbase = USERSTACK - DUMBVM_STACKPAGES * PAGE_SIZE;
	stacktop = USERSTACK;
	//stackbase = as->as_stackpbase[DUMBVM_STACKPAGES];
	//KASSERT((vbase1 & PAGE_FRAME) == vbase1);
	//stacktop = 0x80000000;//stackbase + PAGE_SIZE*DUMBVM_STACKPAGES;

	if (faultaddress >= vbase1 && faultaddress < vtop1) {
		//paddr = (faultaddress - vbase1) + as->as_pbase1[(faultaddress - vbase1)/PAGE_SIZE];
		paddr = as->as_pbase1[(faultaddress - vbase1)/PAGE_SIZE];
	}
	else if (faultaddress >= vbase2 && faultaddress < vtop2) {
		//paddr = (faultaddress - vbase2) + as->as_pbase2[(faultaddress - vbase2)/PAGE_SIZE];
		paddr = as->as_pbase2[(faultaddress - vbase2)/PAGE_SIZE];
	}
	else if (faultaddress >= stackbase && faultaddress < stacktop) {
		//paddr = (faultaddress - stackbase) + as->as_pbase3[(faultaddress - stackbase)/PAGE_SIZE];
		paddr = as->as_pbase3[(faultaddress - stackbase)/PAGE_SIZE];
	}
	else {
		return EFAULT;
	}

/*


	for (int i = 0; i < (int)as->as_npages1; ++i)
	{
		vbase1 = as->as_vbase1[i];
		KASSERT((vbase1 & PAGE_FRAME) == vbase1);
		vtop1 = vbase1 + PAGE_SIZE;
		if (faultaddress >= vbase1 && faultaddress < vtop1){ 
			paddr = (faultaddress - vbase1) + as->as_pbase1[i];
			DEBUG(DB_THREADS, "dumbvm: vbase1 paddr: %d     %d\n ", (int)paddr,paddr&PAGE_FRAME);
			break;
		}	
	}
	for (int i = 0; i < (int)as->as_npages2; ++i)
	{
		vbase2 = as->as_vbase2[i];
		KASSERT((vbase2 & PAGE_FRAME) == vbase2);
		vtop2 = vbase2 + PAGE_SIZE;
		//DEBUG(DB_THREADS, "dumbvm: vbase2 vaddr: %p  %p  [%d]  %d\n",(void*)vbase2,(void*)vtop2,i,as->as_pbase2[i]);
		if (faultaddress >= vbase2 && faultaddress < vtop2){ 
			//DEBUG(DB_THREADS, "dumbvm: vbase2 vaddr: %p  %p  [%d]  %d\n",(void*)vbase2,(void*)vtop2,i,as->as_pbase2[i]);
			//DEBUG(DB_THREADS, "dumbvm: fault: %d\n ", faultaddress);
			paddr = (faultaddress - vbase2) + as->as_pbase2[i];
			DEBUG(DB_THREADS, "dumbvm: vbase2 paddr: %d    %d\n ", paddr,paddr&PAGE_FRAME);
			break;
		}
	}
	for (int i = 0; i < DUMBVM_STACKPAGES; ++i)
	{
		stackbase = as->as_stackpbase[i];
		KASSERT((stackbase & PAGE_FRAME) == stackbase);
		stacktop = stackbase + PAGE_SIZE;
		if (faultaddress >= stackbase && faultaddress < stacktop){ 
			paddr = (faultaddress - stackbase) + as->as_pbase3[i];
			DEBUG(DB_THREADS, "dumbvm: stackbase paddr: %d    %d\n", paddr,paddr&PAGE_FRAME);
			break;
		}
	}
	if(paddr == 0) {
		return EFAULT;
	}*/
	#else
/*	KASSERT(as->as_vbase1 != 0);
	KASSERT(as->as_pbase1 != 0);
	KASSERT(as->as_npages1 != 0);
	KASSERT(as->as_vbase2 != 0);
	KASSERT(as->as_pbase2 != 0);
	KASSERT(as->as_npages2 != 0);
	KASSERT(as->as_stackpbase != 0);
	KASSERT((as->as_vbase1 & PAGE_FRAME) == as->as_vbase1);
	KASSERT((as->as_pbase1 & PAGE_FRAME) == as->as_pbase1);
	KASSERT((as->as_vbase2 & PAGE_FRAME) == as->as_vbase2);
	KASSERT((as->as_pbase2 & PAGE_FRAME) == as->as_pbase2);
	KASSERT((as->as_stackpbase & PAGE_FRAME) == as->as_stackpbase);

	vbase1 = as->as_vbase1;
	vtop1 = vbase1 + as->as_npages1 * PAGE_SIZE;
	vbase2 = as->as_vbase2;
	vtop2 = vbase2 + as->as_npages2 * PAGE_SIZE;
	stackbase = USERSTACK - DUMBVM_STACKPAGES * PAGE_SIZE;
	stacktop = USERSTACK;

	if (faultaddress >= vbase1 && faultaddress < vtop1) {
		paddr = (faultaddress - vbase1) + as->as_pbase1;
	}
	else if (faultaddress >= vbase2 && faultaddress < vtop2) {
		paddr = (faultaddress - vbase2) + as->as_pbase2;
	}
	else if (faultaddress >= stackbase && faultaddress < stacktop) {
		paddr = (faultaddress - stackbase) + as->as_stackpbase;
	}
	else {
		return EFAULT;
	}*/
	#endif
	/* make sure it's page-aligned */
	KASSERT((paddr & PAGE_FRAME) == paddr);

	/* Disable interrupts on this CPU while frobbing the TLB. */
	spl = splhigh();
	for (i=0; i<NUM_TLB; i++) {
		//kprintf("here in load tlb %d\n",i);
		tlb_read(&ehi, &elo, i);
		if (elo & TLBLO_VALID) {
			continue;
		}
		ehi = faultaddress;
		elo = paddr | TLBLO_DIRTY | TLBLO_VALID;
		if (as->loaded && faultaddress >= vbase1 && faultaddress < vtop1){
			//kprintf("in set place \n");
			elo ^= TLBLO_DIRTY;//TLBLO_VALID;
		}
		KASSERT(elo & TLBLO_VALID);
		tlb_write(ehi, elo, i);
		splx(spl);
		return 0;		
	}
	#if OPT_A3
		elo = paddr | TLBLO_DIRTY | TLBLO_VALID;
		ehi = faultaddress;
		KASSERT(as->loaded == 1);
		if (as->loaded && faultaddress >= vbase1 && faultaddress < vtop1)
			elo ^= TLBLO_DIRTY;//TLBLO_VALID;
		KASSERT((elo & TLBLO_VALID) > 0);
		tlb_random(ehi, elo);
		splx(spl);
		return 0;
	#endif
	kprintf("dumbvm: Ran out of TLB entries - cannot handle page fault\n");
	splx(spl);
	return EFAULT;
	
}

struct addrspace *
as_create(void)
{
	DEBUG(DB_THREADS,"as_create been called \n");
	struct addrspace *as = kmalloc(sizeof(struct addrspace));
	if (as==NULL) {
		return NULL;
	}
	#if OPT_A3
		as->loaded = 0;
		as->as_vbase1 = NULL;
		as->as_pbase1 = NULL;
		as->as_npages1 = 0;
		as->as_vbase2 = NULL;
		as->as_pbase2 = NULL;
		as->as_npages2 = 0;
		as->as_stackpbase = NULL;
		as->as_pbase3 = NULL;
	#else
		/*as->as_vbase1 = 0;
		as->as_pbase1 = 0;
		as->as_npages1 = 0;
		as->as_vbase2 = 0;
		as->as_pbase2 = 0;
		as->as_npages2 = 0;
		as->as_stackpbase = 0;*/
	#endif
	return as;
}

void
as_destroy(struct addrspace *as)
{
	#if OPT_A3
	DEBUG(DB_THREADS,"as_destroy been called \n");
	for(int i = 0; i< (int)as->as_npages1; ++i){
		kfree((void*)as->as_vbase1[i]);
		kfree((void*)as->as_pbase1[i]);
	}
	for(int i = 0; i< (int)as->as_npages2; ++i){
		kfree((void*)as->as_vbase2[i]);
		kfree((void*)as->as_pbase2[i]);
	}
	for(int i = 0; i< DUMBVM_STACKPAGES; ++i){
		kfree((void*)as->as_stackpbase[i]);
		kfree((void*)as->as_pbase3[i]);
	}
	kfree(as->as_vbase1);
	kfree(as->as_vbase2);
	kfree(as->as_stackpbase);
	kfree(as->as_pbase1);
	kfree(as->as_pbase2);
	kfree(as->as_pbase3);
	
	kfree(as);
	#else
	kfree(as);
	#endif
}

void
as_activate(void)
{
	//DEBUG(DB_THREADS,"as_activate been called \n");
	int i, spl;
	struct addrspace *as;

	as = curproc_getas();
#ifdef UW
        /* Kernel threads don't have an address spaces to activate */
#endif
	if (as == NULL) {
		return;
	}

	/* Disable interrupts on this CPU while frobbing the TLB. */
	spl = splhigh();
	for (i=0; i<NUM_TLB; i++) {
		tlb_write(TLBHI_INVALID(i), TLBLO_INVALID(), i);
	}
	splx(spl);
}
void
as_deactivate(void)
{
	/* nothing */
}

int
as_define_region(struct addrspace *as, vaddr_t vaddr, size_t sz,
		 int readable, int writeable, int executable)
{
	
	size_t npages; 

	/* Align the region. First, the base... */
	sz += vaddr & ~(vaddr_t)PAGE_FRAME;
	vaddr &= PAGE_FRAME;

	/* ...and now the length. */
	sz = (sz + PAGE_SIZE - 1) & PAGE_FRAME;

	npages = sz / PAGE_SIZE;
	//kprintf("as_define_region been called npages is %d and vaddr is %p\n", (int)npages,(void*)vaddr);
	/* We don't use these - all pages are read-write */
	(void)readable;
	(void)writeable;
	(void)executable;

	#if OPT_A3
	if (as->as_stackpbase == NULL) {
		as->as_stackpbase = kmalloc(DUMBVM_STACKPAGES*sizeof(vaddr_t));
		for (int i = 0; i < (int)DUMBVM_STACKPAGES; ++i){
			as->as_stackpbase[i] = 0x7FFFF000-i*PAGE_SIZE;
			//DEBUG(DB_THREADS,"as_define_region vbase stack [%d] %p\n",i,(void*)as->as_stackpbase[i]);
		}
	}
	if (as->as_vbase1 == NULL) {
		as->as_vbase1 = kmalloc(npages*sizeof(vaddr_t));
		for (int i = 0; i < (int)npages; ++i){
			as->as_vbase1[i] = vaddr+i*PAGE_SIZE;
			//DEBUG(DB_THREADS,"as_define_region vbase111 [%d] %p\n",i,(void*)as->as_vbase1[i]);
		}
		as->as_npages1 = npages;
		return 0;
	}

	
	if (as->as_vbase2 == NULL) {
		as->as_vbase2 = kmalloc(npages*sizeof(vaddr_t));
		for (int i = 0; i < (int)npages; ++i){
			as->as_vbase2[i] = vaddr+i*PAGE_SIZE;
			//DEBUG(DB_THREADS,"as_define_region vbase222 [%d] %p\n",i,(void*)as->as_vbase2[i]);
		}
		as->as_npages2 = npages;
		return 0;
	}
	#endif
	/*
	 * Support for more than two regions is not available.
	 */
	kprintf("dumbvm: Warning: too many regions\n");
	return EUNIMP;
}

static
void
as_zero_region(paddr_t paddr, unsigned npages)
{
	bzero((void *)PADDR_TO_KVADDR(paddr), npages * PAGE_SIZE);
}

int
as_prepare_load(struct addrspace *as)
{
	DEBUG(DB_THREADS,"as_prepare_load been called \n");
	#if OPT_A3
	KASSERT(as->as_pbase1 == NULL);
	KASSERT(as->as_pbase2 == NULL);
	KASSERT(as->as_pbase3 == NULL);
	as->as_pbase1 = kmalloc(as->as_npages1*sizeof(paddr_t));
	as->as_pbase2 = kmalloc(as->as_npages2*sizeof(paddr_t));
	as->as_pbase3 = kmalloc(DUMBVM_STACKPAGES*sizeof(paddr_t));

	for (int i = 0; i < (int)as->as_npages1; ++i){
		as->as_pbase1[i] = getppages(1);
		if (as->as_pbase1[i] == ENOMEM)
			return ENOMEM;
		//DEBUG(DB_THREADS,"as_prepare_load vbase111 [%d] vbase %p   paddr %d \n",i,(void*)as->as_vbase1[i],as->as_pbase1[i]);
		as_zero_region(as->as_pbase1[i], 1);
	}
	for (int i = 0; i < (int)as->as_npages2; ++i){
		as->as_pbase2[i] = getppages(1);
		if (as->as_pbase2[i] == ENOMEM)
			return ENOMEM;
		//DEBUG(DB_THREADS,"as_prepare_load vbase222 [%d] vbase %p   paddr %d \n",i,(void*)as->as_vbase2[i],as->as_pbase2[i]);
		as_zero_region(as->as_pbase2[i], 1);
	}
	for (int i = 0; i < DUMBVM_STACKPAGES; ++i){
		as->as_pbase3[i] = getppages(1);
		if (as->as_pbase3[i] == ENOMEM)
			return ENOMEM;
		//DEBUG(DB_THREADS,"as_prepare_load stack [%d] vbase %p   paddr %d \n",i,(void*)as->as_stackpbase[i],as->as_pbase3[i]);
		as_zero_region(as->as_pbase3[i], 1);
	}
	

	#else
/*
		KASSERT(as->as_pbase1 == 0);
		KASSERT(as->as_pbase2 == 0);
		KASSERT(as->as_stackpbase == 0);

		as->as_pbase1 = getppages(as->as_npages1);
		if (as->as_pbase1 == 0) {
			return ENOMEM;
		}

		as->as_pbase2 = getppages(as->as_npages2);
		if (as->as_pbase2 == 0) {
			return ENOMEM;
		}

		as->as_stackpbase = getppages(DUMBVM_STACKPAGES);
		if (as->as_stackpbase == 0) {
			return ENOMEM;
		}

		as_zero_region(as->as_pbase1, as->as_npages1);
		as_zero_region(as->as_pbase2, as->as_npages2);
		as_zero_region(as->as_stackpbase, DUMBVM_STACKPAGES);*/
	#endif
	return 0;
}

int
as_complete_load(struct addrspace *as)
{
	as->loaded = 1;
	return 0;
}

int
as_define_stack(struct addrspace *as, vaddr_t *stackptr)
{
	KASSERT(as->as_stackpbase != 0);

	*stackptr = USERSTACK;
	return 0;
}

int
as_copy(struct addrspace *old, struct addrspace **ret)
{
	struct addrspace *new;
	//kprintf("as copy is been called\n");
	new = as_create();
	if (new==NULL) {
		return ENOMEM;
	}
	#if OPT_A3
	new->as_vbase1 = kmalloc(old->as_npages1*sizeof(vaddr_t));
	for (int i = 0; i < (int)old->as_npages1; ++i){
			new->as_vbase1[i] = old->as_vbase1[i];
			//DEBUG(DB_THREADS,"as_define_region vbase111 [%d] %p\n",i,(void*)as->as_vbase1);
		}
	new->as_vbase2 = kmalloc(old->as_npages1*sizeof(vaddr_t));
	for (int i = 0; i < (int)old->as_npages2; ++i){
			new->as_vbase2[i] = old->as_vbase2[i];
			//DEBUG(DB_THREADS,"as_define_region vbase111 [%d] %p\n",i,(void*)as->as_vbase1);
		}
	new->as_stackpbase = kmalloc(old->as_npages1*sizeof(vaddr_t));
	for (int i = 0; i < DUMBVM_STACKPAGES; ++i){
			new->as_stackpbase[i] = old->as_stackpbase[i];
			//DEBUG(DB_THREADS,"as_define_region vbase111 [%d] %p\n",i,(void*)as->as_vbase1);
		}
	#else
	new->as_vbase1 = old->as_vbase1;
	new->as_npages1 = old->as_npages1;
	new->as_vbase2 = old->as_vbase2;
	new->as_npages2 = old->as_npages2;
	#endif
	/* (Mis)use as_prepare_load to allocate some physical memory. */
	if (as_prepare_load(new)) {
		as_destroy(new);
		return ENOMEM;
	}

	KASSERT(new->as_pbase1 != NULL);
	KASSERT(new->as_pbase2 != NULL);
	KASSERT(new->as_stackpbase != NULL);

	#if OPT_A3
	for (int i = 0; i < (int)old->as_npages1; ++i){
		memmove((void *)PADDR_TO_KVADDR(new->as_pbase1[i]),
			(const void *)PADDR_TO_KVADDR(old->as_pbase1[i]),
			PAGE_SIZE);
	}
	for (int i = 0; i < (int)old->as_npages2; ++i){
		memmove((void *)PADDR_TO_KVADDR(new->as_pbase2[i]),
			(const void *)PADDR_TO_KVADDR(old->as_pbase2[i]),
			PAGE_SIZE);
	}
	for (int i = 0; i < DUMBVM_STACKPAGES; ++i){
		memmove((void *)PADDR_TO_KVADDR(new->as_pbase3[i]),
			(const void *)PADDR_TO_KVADDR(old->as_pbase3[i]),
			PAGE_SIZE);
	}
	#else
		memmove((void *)PADDR_TO_KVADDR(new->as_pbase1),
			(const void *)PADDR_TO_KVADDR(old->as_pbase1),
			old->as_npages1*PAGE_SIZE);

		memmove((void *)PADDR_TO_KVADDR(new->as_pbase2),
			(const void *)PADDR_TO_KVADDR(old->as_pbase2),
			old->as_npages2*PAGE_SIZE);

		memmove((void *)PADDR_TO_KVADDR(new->as_stackpbase),
			(const void *)PADDR_TO_KVADDR(old->as_stackpbase),
			DUMBVM_STACKPAGES*PAGE_SIZE);

	#endif

	*ret = new;
	return 0;
}
