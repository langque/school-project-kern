#include <types.h>
#include <kern/errno.h>
#include <kern/unistd.h>
#include <kern/wait.h>
#include <lib.h>
#include <syscall.h>
#include <current.h>
#include <proc.h>
#include <thread.h>
#include <addrspace.h>
#include <copyinout.h>
#include "opt-A2.h"
#if OPT_A2
#include <kern/fcntl.h>
#include <vm.h>
#include <vfs.h>
#include <mips/trapframe.h>
#include <synchprobs.h>
#include <synch.h>
#include <kern/wait.h>
#endif
  /* this implementation of sys__exit does not do anything with the exit code */
  /* this needs to be fixed to get exit() and waitpid() working properly */
#if OPT_A2
extern struct p_table *pid_array;
#define max_child 50
#endif

#if OPT_A2
pid_t 
sys_fork(pid_t *retval,struct trapframe *tf){
	struct proc *proc;
	proc = proc_create_runprogram("[child]");
	proc->come_from_fork = 1;
	for (int i = 0;i<max_child;i++){
		if(curproc->children[i]==0)
			curproc->children[i] = proc->pid;
	}	
	int err = as_copy(curproc->p_addrspace,&proc->p_addrspace);
	if (err){
		 DEBUG(DB_SYSCALL,"Syscall: _fork as copy fail \n");
		 return err;
		} 
	struct trapframe *c_tf=NULL;
	c_tf = kmalloc(sizeof(struct trapframe));
	memcpy(c_tf,tf,sizeof(struct trapframe));	
	int err2 = thread_fork("child", proc, enter_forked_process,c_tf, 0);
	if (err2){
		DEBUG(DB_SYSCALL," the thread fork in sys_fork is fail \n");
		return err2;
		} 
	*retval = proc->pid;
	return (0);
}

int 
sys_execv(pid_t *retval, char *progname, char **args)
{
	//(void) args;

	struct addrspace *as;
	struct vnode *v;
	vaddr_t entrypoint, stackptr;
	int result;
	result = vfs_open(progname, O_RDONLY, 0, &v);
	if (result) {
		return result;
	}
  int n = 0;
  while(args[n]) n++;
  char ** k_stack_arg = kmalloc((n+1)*sizeof(char *));
  k_stack_arg[0] = kmalloc((strlen(progname)+1)*sizeof(char));
  memcpy((void *)k_stack_arg[0],(const void*)progname,(size_t)strlen(progname)+1);
  int i = 0;
  if(!args[i])
    k_stack_arg[i+1] = NULL;
  else
  {
    while(args[i])
    {
      char *save_args = kmalloc((strlen(args[i])+1)*sizeof(char *));
      memcpy((void *)save_args,(const void *)args[i],strlen(args[i])+1);
      k_stack_arg[i+1] = save_args;
      i++;
    }
  }
	as_destroy(curproc->p_addrspace);	
	curproc_setas(NULL);
	/* We should be a new process. */
	KASSERT(curproc_getas() == NULL);
	as = as_create();
	if (as ==NULL) {
		vfs_close(v);
		return ENOMEM;
	}
	/* Switch to it and activate it. */
	curproc_setas(as);
	as_activate();
	/* Load the executable. */
	result = load_elf(v, &entrypoint);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		vfs_close(v);
		return result;
	}
	/* Done with the file now. */
	vfs_close(v);
	/* Define the user stack in the address space */
	result = as_define_stack(as, &stackptr);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		return result;
	}
//copy saved argument form kern to user stack
  stackptr -= (n+1)*sizeof(char *);
  char ** u_stack_arg = (char **)stackptr;
  int r = 0;
  while(r< n){
    int j = 0;
    while(k_stack_arg[r][j]!='\0'){
      j++;
    }
    j++;
    stackptr -= j;
    u_stack_arg[r] = (char *)stackptr;
    int err = copyoutstr((const char *)k_stack_arg[r], (userptr_t)u_stack_arg[r], j, 0);
    kfree(k_stack_arg[r]);
    if(err){
      return err;
    }
    r++;
  }
  kfree(k_stack_arg);

  int p = stackptr%8;
  stackptr -= p;  
  KASSERT(stackptr%8 == 0);
	enter_new_process(n,(userptr_t)u_stack_arg, stackptr, entrypoint);
  *retval = -1;
	panic("enter_new_process returned\n");
	return EINVAL;
}



#endif

void sys__exit(int exitcode) {

  struct addrspace *as;
  struct proc *p = curproc;
  #if OPT_A2
  if(p->come_from_fork){
  	pid_array[p->pid].ex_code = _MKWAIT_EXIT(exitcode);
  	V(pid_array[p->pid].wait_sem);
  	pid_array[p->pid].p = NULL;
  }else{
  	V(pid_array[p->pid].wait_sem);
  	pid_array[p->pid].p = NULL;
  }
  #endif
  /* for now, just include this to keep the compiler from complaining about
     an unused variable */
 // (void)exitcode;
  DEBUG(DB_SYSCALL,"Syscall: _exit(%d)\n",exitcode);

  KASSERT(curproc->p_addrspace != NULL);
  as_deactivate();
  /*
   * clear p_addrspace before calling as_destroy. Otherwise if
   * as_destroy sleeps (which is quite possible) when we
   * come back we'll be calling as_activate on a
   * half-destroyed address space. This tends to be
   * messily fatal.
   */
  as = curproc_setas(NULL);
  as_destroy(as);
  
  /* detach this thread from its process */
  /* note: curproc cannot be used after this call */
  proc_remthread(curthread);

  /* if this is the last user process in the system, proc_destroy()
     will wake up the kernel menu thread */
  proc_destroy(p);
  
  thread_exit();
  /* thread_exit() does not return, so we should never get here */
  panic("return from thread_exit in sys_exit\n");
}


/* stub handler for getpid() system call                */
int
sys_getpid(pid_t *retval)
{
  #if OPT_A2
  *retval = curproc->pid;
  return(0);
  #else
  *retval = 1;
  return(0);
  #endif /* OPT_A2 */
}

/* stub handler for waitpid() system call                */
int
sys_waitpid(pid_t pid,
	    userptr_t status,
	    int options,
	    pid_t *retval)
{
  int exitstatus;
  int result;
  #if OPT_A2
  if(pid_array[pid].p == NULL && pid_array[pid].ex_code == -1){
  	DEBUG(DB_SYSCALL," in sys_waitpid the pid %d does not exits \n", pid);
  	return(ESRCH);
  }
  P(pid_array[pid].wait_sem);
  if(pid_array[pid].p == NULL&& pid_array[pid].ex_code != -1){ 
  	exitstatus = pid_array[pid].ex_code;
  	pid_array[pid].ex_code = -1;  	
  	DEBUG(DB_SYSCALL," in sys_waitpid on pid %d is returned\n", pid);
  }
  else{
  	exitstatus = 0;
  } 
  #endif
  /* this is just a stub implementation that always reports an
     exit status of 0, regardless of the actual exit status of
     the specified process.   
     In fact, this will return 0 even if the specified process
     is still running, and even if it never existed in the first place.

     Fix this!
  */
  if (options != 0) {
    return(EINVAL);
  }
  /* for now, just pretend the exitstatus is 0 */
  #if OPT_A2  
  #else
  exitstatus = 0;
  #endif
  *retval = pid;
  result = copyout((void *)&exitstatus,status,sizeof(int));
  if (result) {
    return(result);
  }  
  return(0);
}

