
../../../build/user/testbin/add/add:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250014 	sw	a1,20(at)
  40001c:	0c100014 	jal	400050 <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c1000c1 	jal	400304 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1000ef 	jal	4003bc <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <main>:
  400050:	27bdffe0 	addiu	sp,sp,-32
  400054:	afb10014 	sw	s1,20(sp)
  400058:	24020003 	li	v0,3
  40005c:	00a08821 	move	s1,a1
  400060:	3c050040 	lui	a1,0x40
  400064:	afbf0018 	sw	ra,24(sp)
  400068:	afb00010 	sw	s0,16(sp)
  40006c:	10820003 	beq	a0,v0,40007c <main+0x2c>
  400070:	24a51a10 	addiu	a1,a1,6672
  400074:	0c1001e2 	jal	400788 <errx>
  400078:	24040001 	li	a0,1
  40007c:	8e240004 	lw	a0,4(s1)
  400080:	0c100070 	jal	4001c0 <atoi>
  400084:	00000000 	nop
  400088:	8e240008 	lw	a0,8(s1)
  40008c:	0c100070 	jal	4001c0 <atoi>
  400090:	00408021 	move	s0,v0
  400094:	3c040040 	lui	a0,0x40
  400098:	02022821 	addu	a1,s0,v0
  40009c:	0c10004b 	jal	40012c <printf>
  4000a0:	24841a28 	addiu	a0,a0,6696
  4000a4:	8fbf0018 	lw	ra,24(sp)
  4000a8:	8fb10014 	lw	s1,20(sp)
  4000ac:	8fb00010 	lw	s0,16(sp)
  4000b0:	00001021 	move	v0,zero
  4000b4:	03e00008 	jr	ra
  4000b8:	27bd0020 	addiu	sp,sp,32
  4000bc:	00000000 	nop

004000c0 <vprintf>:
  4000c0:	00803021 	move	a2,a0
  4000c4:	3c040040 	lui	a0,0x40
  4000c8:	00a03821 	move	a3,a1
  4000cc:	248400d8 	addiu	a0,a0,216
  4000d0:	081002e1 	j	400b84 <__vprintf>
  4000d4:	00002821 	move	a1,zero

004000d8 <__printf_send>:
  4000d8:	27bdffe0 	addiu	sp,sp,-32
  4000dc:	afb20018 	sw	s2,24(sp)
  4000e0:	afb10014 	sw	s1,20(sp)
  4000e4:	afbf001c 	sw	ra,28(sp)
  4000e8:	afb00010 	sw	s0,16(sp)
  4000ec:	00c09021 	move	s2,a2
  4000f0:	10c00008 	beqz	a2,400114 <__printf_send+0x3c>
  4000f4:	00a08821 	move	s1,a1
  4000f8:	00008021 	move	s0,zero
  4000fc:	02301021 	addu	v0,s1,s0
  400100:	80440000 	lb	a0,0(v0)
  400104:	0c100058 	jal	400160 <putchar>
  400108:	26100001 	addiu	s0,s0,1
  40010c:	1650fffc 	bne	s2,s0,400100 <__printf_send+0x28>
  400110:	02301021 	addu	v0,s1,s0
  400114:	8fbf001c 	lw	ra,28(sp)
  400118:	8fb20018 	lw	s2,24(sp)
  40011c:	8fb10014 	lw	s1,20(sp)
  400120:	8fb00010 	lw	s0,16(sp)
  400124:	03e00008 	jr	ra
  400128:	27bd0020 	addiu	sp,sp,32

0040012c <printf>:
  40012c:	27bdffe0 	addiu	sp,sp,-32
  400130:	27a20024 	addiu	v0,sp,36
  400134:	afa50024 	sw	a1,36(sp)
  400138:	00402821 	move	a1,v0
  40013c:	afbf0018 	sw	ra,24(sp)
  400140:	afa60028 	sw	a2,40(sp)
  400144:	afa7002c 	sw	a3,44(sp)
  400148:	0c100030 	jal	4000c0 <vprintf>
  40014c:	afa20010 	sw	v0,16(sp)
  400150:	8fbf0018 	lw	ra,24(sp)
  400154:	00000000 	nop
  400158:	03e00008 	jr	ra
  40015c:	27bd0020 	addiu	sp,sp,32

00400160 <putchar>:
  400160:	27bdffe0 	addiu	sp,sp,-32
  400164:	afb00018 	sw	s0,24(sp)
  400168:	27a50010 	addiu	a1,sp,16
  40016c:	00808021 	move	s0,a0
  400170:	24060001 	li	a2,1
  400174:	24040001 	li	a0,1
  400178:	afbf001c 	sw	ra,28(sp)
  40017c:	0c10012f 	jal	4004bc <write>
  400180:	a3b00010 	sb	s0,16(sp)
  400184:	18400005 	blez	v0,40019c <putchar+0x3c>
  400188:	02001021 	move	v0,s0
  40018c:	8fbf001c 	lw	ra,28(sp)
  400190:	8fb00018 	lw	s0,24(sp)
  400194:	03e00008 	jr	ra
  400198:	27bd0020 	addiu	sp,sp,32
  40019c:	2410ffff 	li	s0,-1
  4001a0:	02001021 	move	v0,s0
  4001a4:	8fbf001c 	lw	ra,28(sp)
  4001a8:	8fb00018 	lw	s0,24(sp)
  4001ac:	03e00008 	jr	ra
  4001b0:	27bd0020 	addiu	sp,sp,32
	...

004001c0 <atoi>:
  4001c0:	27bdffd8 	addiu	sp,sp,-40
  4001c4:	afb00010 	sw	s0,16(sp)
  4001c8:	afbf0024 	sw	ra,36(sp)
  4001cc:	afb40020 	sw	s4,32(sp)
  4001d0:	afb3001c 	sw	s3,28(sp)
  4001d4:	afb20018 	sw	s2,24(sp)
  4001d8:	afb10014 	sw	s1,20(sp)
  4001dc:	00808021 	move	s0,a0
  4001e0:	24020020 	li	v0,32
  4001e4:	24030009 	li	v1,9
  4001e8:	82050000 	lb	a1,0(s0)
  4001ec:	00000000 	nop
  4001f0:	10a20003 	beq	a1,v0,400200 <atoi+0x40>
  4001f4:	00000000 	nop
  4001f8:	14a30003 	bne	a1,v1,400208 <atoi+0x48>
  4001fc:	00000000 	nop
  400200:	0810007a 	j	4001e8 <atoi+0x28>
  400204:	26100001 	addiu	s0,s0,1
  400208:	2402002d 	li	v0,45
  40020c:	10a2002c 	beq	a1,v0,4002c0 <atoi+0x100>
  400210:	2402002b 	li	v0,43
  400214:	10a20026 	beq	a1,v0,4002b0 <atoi+0xf0>
  400218:	00000000 	nop
  40021c:	0000a021 	move	s4,zero
  400220:	10a0002b 	beqz	a1,4002d0 <atoi+0x110>
  400224:	3c130040 	lui	s3,0x40
  400228:	00008821 	move	s1,zero
  40022c:	08100091 	j	400244 <atoi+0x84>
  400230:	26721890 	addiu	s2,s3,6288
  400234:	82050000 	lb	a1,0(s0)
  400238:	00000000 	nop
  40023c:	10a00009 	beqz	a1,400264 <atoi+0xa4>
  400240:	00838821 	addu	s1,a0,v1
  400244:	0c1000c8 	jal	400320 <strchr>
  400248:	26641890 	addiu	a0,s3,6288
  40024c:	001120c0 	sll	a0,s1,0x3
  400250:	00111840 	sll	v1,s1,0x1
  400254:	00641821 	addu	v1,v1,a0
  400258:	26100001 	addiu	s0,s0,1
  40025c:	1440fff5 	bnez	v0,400234 <atoi+0x74>
  400260:	00522023 	subu	a0,v0,s2
  400264:	1280000a 	beqz	s4,400290 <atoi+0xd0>
  400268:	02201021 	move	v0,s1
  40026c:	00111023 	negu	v0,s1
  400270:	8fbf0024 	lw	ra,36(sp)
  400274:	8fb40020 	lw	s4,32(sp)
  400278:	8fb3001c 	lw	s3,28(sp)
  40027c:	8fb20018 	lw	s2,24(sp)
  400280:	8fb10014 	lw	s1,20(sp)
  400284:	8fb00010 	lw	s0,16(sp)
  400288:	03e00008 	jr	ra
  40028c:	27bd0028 	addiu	sp,sp,40
  400290:	8fbf0024 	lw	ra,36(sp)
  400294:	8fb40020 	lw	s4,32(sp)
  400298:	8fb3001c 	lw	s3,28(sp)
  40029c:	8fb20018 	lw	s2,24(sp)
  4002a0:	8fb10014 	lw	s1,20(sp)
  4002a4:	8fb00010 	lw	s0,16(sp)
  4002a8:	03e00008 	jr	ra
  4002ac:	27bd0028 	addiu	sp,sp,40
  4002b0:	26100001 	addiu	s0,s0,1
  4002b4:	82050000 	lb	a1,0(s0)
  4002b8:	08100088 	j	400220 <atoi+0x60>
  4002bc:	0000a021 	move	s4,zero
  4002c0:	26100001 	addiu	s0,s0,1
  4002c4:	82050000 	lb	a1,0(s0)
  4002c8:	08100088 	j	400220 <atoi+0x60>
  4002cc:	24140001 	li	s4,1
  4002d0:	08100099 	j	400264 <atoi+0xa4>
  4002d4:	00008821 	move	s1,zero
	...

004002e0 <__exit_hack>:
  4002e0:	27bdfff8 	addiu	sp,sp,-8
  4002e4:	24020001 	li	v0,1
  4002e8:	afa20000 	sw	v0,0(sp)
  4002ec:	8fa20000 	lw	v0,0(sp)
  4002f0:	00000000 	nop
  4002f4:	1440fffd 	bnez	v0,4002ec <__exit_hack+0xc>
  4002f8:	00000000 	nop
  4002fc:	03e00008 	jr	ra
  400300:	27bd0008 	addiu	sp,sp,8

00400304 <exit>:
  400304:	27bdffe8 	addiu	sp,sp,-24
  400308:	afbf0010 	sw	ra,16(sp)
  40030c:	0c1000ef 	jal	4003bc <_exit>
  400310:	00000000 	nop
	...

00400320 <strchr>:
  400320:	80830000 	lb	v1,0(a0)
  400324:	00052e00 	sll	a1,a1,0x18
  400328:	00801021 	move	v0,a0
  40032c:	1060000c 	beqz	v1,400360 <strchr+0x40>
  400330:	00052e03 	sra	a1,a1,0x18
  400334:	14a30006 	bne	a1,v1,400350 <strchr+0x30>
  400338:	24420001 	addiu	v0,v0,1
  40033c:	03e00008 	jr	ra
  400340:	2442ffff 	addiu	v0,v0,-1
  400344:	10a3000c 	beq	a1,v1,400378 <strchr+0x58>
  400348:	00000000 	nop
  40034c:	24420001 	addiu	v0,v0,1
  400350:	80430000 	lb	v1,0(v0)
  400354:	00000000 	nop
  400358:	1460fffa 	bnez	v1,400344 <strchr+0x24>
  40035c:	00000000 	nop
  400360:	14a00003 	bnez	a1,400370 <strchr+0x50>
  400364:	00000000 	nop
  400368:	03e00008 	jr	ra
  40036c:	00000000 	nop
  400370:	03e00008 	jr	ra
  400374:	00001021 	move	v0,zero
  400378:	03e00008 	jr	ra
  40037c:	00000000 	nop

00400380 <__syscall>:
  400380:	0000000c 	syscall
  400384:	10e00005 	beqz	a3,40039c <__syscall+0x1c>
  400388:	00000000 	nop
  40038c:	3c011000 	lui	at,0x1000
  400390:	ac220010 	sw	v0,16(at)
  400394:	2403ffff 	li	v1,-1
  400398:	2402ffff 	li	v0,-1
  40039c:	03e00008 	jr	ra
  4003a0:	00000000 	nop

004003a4 <fork>:
  4003a4:	081000e0 	j	400380 <__syscall>
  4003a8:	24020000 	li	v0,0

004003ac <vfork>:
  4003ac:	081000e0 	j	400380 <__syscall>
  4003b0:	24020001 	li	v0,1

004003b4 <execv>:
  4003b4:	081000e0 	j	400380 <__syscall>
  4003b8:	24020002 	li	v0,2

004003bc <_exit>:
  4003bc:	081000e0 	j	400380 <__syscall>
  4003c0:	24020003 	li	v0,3

004003c4 <waitpid>:
  4003c4:	081000e0 	j	400380 <__syscall>
  4003c8:	24020004 	li	v0,4

004003cc <getpid>:
  4003cc:	081000e0 	j	400380 <__syscall>
  4003d0:	24020005 	li	v0,5

004003d4 <getppid>:
  4003d4:	081000e0 	j	400380 <__syscall>
  4003d8:	24020006 	li	v0,6

004003dc <sbrk>:
  4003dc:	081000e0 	j	400380 <__syscall>
  4003e0:	24020007 	li	v0,7

004003e4 <mmap>:
  4003e4:	081000e0 	j	400380 <__syscall>
  4003e8:	24020008 	li	v0,8

004003ec <munmap>:
  4003ec:	081000e0 	j	400380 <__syscall>
  4003f0:	24020009 	li	v0,9

004003f4 <mprotect>:
  4003f4:	081000e0 	j	400380 <__syscall>
  4003f8:	2402000a 	li	v0,10

004003fc <umask>:
  4003fc:	081000e0 	j	400380 <__syscall>
  400400:	24020011 	li	v0,17

00400404 <issetugid>:
  400404:	081000e0 	j	400380 <__syscall>
  400408:	24020012 	li	v0,18

0040040c <getresuid>:
  40040c:	081000e0 	j	400380 <__syscall>
  400410:	24020013 	li	v0,19

00400414 <setresuid>:
  400414:	081000e0 	j	400380 <__syscall>
  400418:	24020014 	li	v0,20

0040041c <getresgid>:
  40041c:	081000e0 	j	400380 <__syscall>
  400420:	24020015 	li	v0,21

00400424 <setresgid>:
  400424:	081000e0 	j	400380 <__syscall>
  400428:	24020016 	li	v0,22

0040042c <getgroups>:
  40042c:	081000e0 	j	400380 <__syscall>
  400430:	24020017 	li	v0,23

00400434 <setgroups>:
  400434:	081000e0 	j	400380 <__syscall>
  400438:	24020018 	li	v0,24

0040043c <__getlogin>:
  40043c:	081000e0 	j	400380 <__syscall>
  400440:	24020019 	li	v0,25

00400444 <__setlogin>:
  400444:	081000e0 	j	400380 <__syscall>
  400448:	2402001a 	li	v0,26

0040044c <kill>:
  40044c:	081000e0 	j	400380 <__syscall>
  400450:	2402001b 	li	v0,27

00400454 <sigaction>:
  400454:	081000e0 	j	400380 <__syscall>
  400458:	2402001c 	li	v0,28

0040045c <sigpending>:
  40045c:	081000e0 	j	400380 <__syscall>
  400460:	2402001d 	li	v0,29

00400464 <sigprocmask>:
  400464:	081000e0 	j	400380 <__syscall>
  400468:	2402001e 	li	v0,30

0040046c <sigsuspend>:
  40046c:	081000e0 	j	400380 <__syscall>
  400470:	2402001f 	li	v0,31

00400474 <sigreturn>:
  400474:	081000e0 	j	400380 <__syscall>
  400478:	24020020 	li	v0,32

0040047c <open>:
  40047c:	081000e0 	j	400380 <__syscall>
  400480:	2402002d 	li	v0,45

00400484 <pipe>:
  400484:	081000e0 	j	400380 <__syscall>
  400488:	2402002e 	li	v0,46

0040048c <dup>:
  40048c:	081000e0 	j	400380 <__syscall>
  400490:	2402002f 	li	v0,47

00400494 <dup2>:
  400494:	081000e0 	j	400380 <__syscall>
  400498:	24020030 	li	v0,48

0040049c <close>:
  40049c:	081000e0 	j	400380 <__syscall>
  4004a0:	24020031 	li	v0,49

004004a4 <read>:
  4004a4:	081000e0 	j	400380 <__syscall>
  4004a8:	24020032 	li	v0,50

004004ac <pread>:
  4004ac:	081000e0 	j	400380 <__syscall>
  4004b0:	24020033 	li	v0,51

004004b4 <getdirentry>:
  4004b4:	081000e0 	j	400380 <__syscall>
  4004b8:	24020036 	li	v0,54

004004bc <write>:
  4004bc:	081000e0 	j	400380 <__syscall>
  4004c0:	24020037 	li	v0,55

004004c4 <pwrite>:
  4004c4:	081000e0 	j	400380 <__syscall>
  4004c8:	24020038 	li	v0,56

004004cc <lseek>:
  4004cc:	081000e0 	j	400380 <__syscall>
  4004d0:	2402003b 	li	v0,59

004004d4 <flock>:
  4004d4:	081000e0 	j	400380 <__syscall>
  4004d8:	2402003c 	li	v0,60

004004dc <ftruncate>:
  4004dc:	081000e0 	j	400380 <__syscall>
  4004e0:	2402003d 	li	v0,61

004004e4 <fsync>:
  4004e4:	081000e0 	j	400380 <__syscall>
  4004e8:	2402003e 	li	v0,62

004004ec <fcntl>:
  4004ec:	081000e0 	j	400380 <__syscall>
  4004f0:	2402003f 	li	v0,63

004004f4 <ioctl>:
  4004f4:	081000e0 	j	400380 <__syscall>
  4004f8:	24020040 	li	v0,64

004004fc <select>:
  4004fc:	081000e0 	j	400380 <__syscall>
  400500:	24020041 	li	v0,65

00400504 <poll>:
  400504:	081000e0 	j	400380 <__syscall>
  400508:	24020042 	li	v0,66

0040050c <link>:
  40050c:	081000e0 	j	400380 <__syscall>
  400510:	24020043 	li	v0,67

00400514 <remove>:
  400514:	081000e0 	j	400380 <__syscall>
  400518:	24020044 	li	v0,68

0040051c <mkdir>:
  40051c:	081000e0 	j	400380 <__syscall>
  400520:	24020045 	li	v0,69

00400524 <rmdir>:
  400524:	081000e0 	j	400380 <__syscall>
  400528:	24020046 	li	v0,70

0040052c <mkfifo>:
  40052c:	081000e0 	j	400380 <__syscall>
  400530:	24020047 	li	v0,71

00400534 <rename>:
  400534:	081000e0 	j	400380 <__syscall>
  400538:	24020048 	li	v0,72

0040053c <access>:
  40053c:	081000e0 	j	400380 <__syscall>
  400540:	24020049 	li	v0,73

00400544 <chdir>:
  400544:	081000e0 	j	400380 <__syscall>
  400548:	2402004a 	li	v0,74

0040054c <fchdir>:
  40054c:	081000e0 	j	400380 <__syscall>
  400550:	2402004b 	li	v0,75

00400554 <__getcwd>:
  400554:	081000e0 	j	400380 <__syscall>
  400558:	2402004c 	li	v0,76

0040055c <symlink>:
  40055c:	081000e0 	j	400380 <__syscall>
  400560:	2402004d 	li	v0,77

00400564 <readlink>:
  400564:	081000e0 	j	400380 <__syscall>
  400568:	2402004e 	li	v0,78

0040056c <mount>:
  40056c:	081000e0 	j	400380 <__syscall>
  400570:	2402004f 	li	v0,79

00400574 <unmount>:
  400574:	081000e0 	j	400380 <__syscall>
  400578:	24020050 	li	v0,80

0040057c <stat>:
  40057c:	081000e0 	j	400380 <__syscall>
  400580:	24020051 	li	v0,81

00400584 <fstat>:
  400584:	081000e0 	j	400380 <__syscall>
  400588:	24020052 	li	v0,82

0040058c <lstat>:
  40058c:	081000e0 	j	400380 <__syscall>
  400590:	24020053 	li	v0,83

00400594 <utimes>:
  400594:	081000e0 	j	400380 <__syscall>
  400598:	24020054 	li	v0,84

0040059c <futimes>:
  40059c:	081000e0 	j	400380 <__syscall>
  4005a0:	24020055 	li	v0,85

004005a4 <lutimes>:
  4005a4:	081000e0 	j	400380 <__syscall>
  4005a8:	24020056 	li	v0,86

004005ac <chmod>:
  4005ac:	081000e0 	j	400380 <__syscall>
  4005b0:	24020057 	li	v0,87

004005b4 <chown>:
  4005b4:	081000e0 	j	400380 <__syscall>
  4005b8:	24020058 	li	v0,88

004005bc <fchmod>:
  4005bc:	081000e0 	j	400380 <__syscall>
  4005c0:	24020059 	li	v0,89

004005c4 <fchown>:
  4005c4:	081000e0 	j	400380 <__syscall>
  4005c8:	2402005a 	li	v0,90

004005cc <lchmod>:
  4005cc:	081000e0 	j	400380 <__syscall>
  4005d0:	2402005b 	li	v0,91

004005d4 <lchown>:
  4005d4:	081000e0 	j	400380 <__syscall>
  4005d8:	2402005c 	li	v0,92

004005dc <socket>:
  4005dc:	081000e0 	j	400380 <__syscall>
  4005e0:	24020062 	li	v0,98

004005e4 <bind>:
  4005e4:	081000e0 	j	400380 <__syscall>
  4005e8:	24020063 	li	v0,99

004005ec <connect>:
  4005ec:	081000e0 	j	400380 <__syscall>
  4005f0:	24020064 	li	v0,100

004005f4 <listen>:
  4005f4:	081000e0 	j	400380 <__syscall>
  4005f8:	24020065 	li	v0,101

004005fc <accept>:
  4005fc:	081000e0 	j	400380 <__syscall>
  400600:	24020066 	li	v0,102

00400604 <shutdown>:
  400604:	081000e0 	j	400380 <__syscall>
  400608:	24020068 	li	v0,104

0040060c <getsockname>:
  40060c:	081000e0 	j	400380 <__syscall>
  400610:	24020069 	li	v0,105

00400614 <getpeername>:
  400614:	081000e0 	j	400380 <__syscall>
  400618:	2402006a 	li	v0,106

0040061c <getsockopt>:
  40061c:	081000e0 	j	400380 <__syscall>
  400620:	2402006b 	li	v0,107

00400624 <setsockopt>:
  400624:	081000e0 	j	400380 <__syscall>
  400628:	2402006c 	li	v0,108

0040062c <__time>:
  40062c:	081000e0 	j	400380 <__syscall>
  400630:	24020071 	li	v0,113

00400634 <__settime>:
  400634:	081000e0 	j	400380 <__syscall>
  400638:	24020072 	li	v0,114

0040063c <nanosleep>:
  40063c:	081000e0 	j	400380 <__syscall>
  400640:	24020073 	li	v0,115

00400644 <sync>:
  400644:	081000e0 	j	400380 <__syscall>
  400648:	24020076 	li	v0,118

0040064c <reboot>:
  40064c:	081000e0 	j	400380 <__syscall>
  400650:	24020077 	li	v0,119
	...

00400660 <__senderr>:
  400660:	0810012f 	j	4004bc <write>
  400664:	24040002 	li	a0,2

00400668 <__senderrstr>:
  400668:	27bdffe8 	addiu	sp,sp,-24
  40066c:	afbf0014 	sw	ra,20(sp)
  400670:	afb00010 	sw	s0,16(sp)
  400674:	0c100438 	jal	4010e0 <strlen>
  400678:	00808021 	move	s0,a0
  40067c:	00403021 	move	a2,v0
  400680:	02002821 	move	a1,s0
  400684:	8fbf0014 	lw	ra,20(sp)
  400688:	8fb00010 	lw	s0,16(sp)
  40068c:	00002021 	move	a0,zero
  400690:	08100198 	j	400660 <__senderr>
  400694:	27bd0018 	addiu	sp,sp,24

00400698 <__printerr>:
  400698:	27bdffd8 	addiu	sp,sp,-40
  40069c:	afb40020 	sw	s4,32(sp)
  4006a0:	afb3001c 	sw	s3,28(sp)
  4006a4:	afb20018 	sw	s2,24(sp)
  4006a8:	afb10014 	sw	s1,20(sp)
  4006ac:	afbf0024 	sw	ra,36(sp)
  4006b0:	afb00010 	sw	s0,16(sp)
  4006b4:	3c021000 	lui	v0,0x1000
  4006b8:	00809821 	move	s3,a0
  4006bc:	8c440010 	lw	a0,16(v0)
  4006c0:	00a08821 	move	s1,a1
  4006c4:	0c10042c 	jal	4010b0 <strerror>
  4006c8:	00c09021 	move	s2,a2
  4006cc:	0040a021 	move	s4,v0
  4006d0:	3c021000 	lui	v0,0x1000
  4006d4:	8c420014 	lw	v0,20(v0)
  4006d8:	00000000 	nop
  4006dc:	1040001f 	beqz	v0,40075c <__printerr+0xc4>
  4006e0:	00000000 	nop
  4006e4:	8c420000 	lw	v0,0(v0)
  4006e8:	00000000 	nop
  4006ec:	1040001b 	beqz	v0,40075c <__printerr+0xc4>
  4006f0:	00402021 	move	a0,v0
  4006f4:	0c10019a 	jal	400668 <__senderrstr>
  4006f8:	3c100040 	lui	s0,0x40
  4006fc:	0c10019a 	jal	400668 <__senderrstr>
  400700:	26041a4c 	addiu	a0,s0,6732
  400704:	3c040040 	lui	a0,0x40
  400708:	24840660 	addiu	a0,a0,1632
  40070c:	02203021 	move	a2,s1
  400710:	02403821 	move	a3,s2
  400714:	0c1002e1 	jal	400b84 <__vprintf>
  400718:	00002821 	move	a1,zero
  40071c:	12600005 	beqz	s3,400734 <__printerr+0x9c>
  400720:	26041a4c 	addiu	a0,s0,6732
  400724:	0c10019a 	jal	400668 <__senderrstr>
  400728:	00000000 	nop
  40072c:	0c10019a 	jal	400668 <__senderrstr>
  400730:	02802021 	move	a0,s4
  400734:	3c040040 	lui	a0,0x40
  400738:	8fbf0024 	lw	ra,36(sp)
  40073c:	8fb40020 	lw	s4,32(sp)
  400740:	8fb3001c 	lw	s3,28(sp)
  400744:	8fb20018 	lw	s2,24(sp)
  400748:	8fb10014 	lw	s1,20(sp)
  40074c:	8fb00010 	lw	s0,16(sp)
  400750:	24841a50 	addiu	a0,a0,6736
  400754:	0810019a 	j	400668 <__senderrstr>
  400758:	27bd0028 	addiu	sp,sp,40
  40075c:	3c020040 	lui	v0,0x40
  400760:	081001bd 	j	4006f4 <__printerr+0x5c>
  400764:	24441a34 	addiu	a0,v0,6708

00400768 <verrx>:
  400768:	27bdffe8 	addiu	sp,sp,-24
  40076c:	afb00010 	sw	s0,16(sp)
  400770:	00808021 	move	s0,a0
  400774:	afbf0014 	sw	ra,20(sp)
  400778:	0c1001a6 	jal	400698 <__printerr>
  40077c:	00002021 	move	a0,zero
  400780:	0c1000c1 	jal	400304 <exit>
  400784:	02002021 	move	a0,s0

00400788 <errx>:
  400788:	27bdffe0 	addiu	sp,sp,-32
  40078c:	27a20028 	addiu	v0,sp,40
  400790:	afa60028 	sw	a2,40(sp)
  400794:	00403021 	move	a2,v0
  400798:	afbf0018 	sw	ra,24(sp)
  40079c:	afa7002c 	sw	a3,44(sp)
  4007a0:	0c1001da 	jal	400768 <verrx>
  4007a4:	afa20010 	sw	v0,16(sp)
  4007a8:	8fbf0018 	lw	ra,24(sp)
  4007ac:	00000000 	nop
  4007b0:	03e00008 	jr	ra
  4007b4:	27bd0020 	addiu	sp,sp,32

004007b8 <verr>:
  4007b8:	27bdffe8 	addiu	sp,sp,-24
  4007bc:	afb00010 	sw	s0,16(sp)
  4007c0:	00808021 	move	s0,a0
  4007c4:	afbf0014 	sw	ra,20(sp)
  4007c8:	0c1001a6 	jal	400698 <__printerr>
  4007cc:	24040001 	li	a0,1
  4007d0:	0c1000c1 	jal	400304 <exit>
  4007d4:	02002021 	move	a0,s0

004007d8 <err>:
  4007d8:	27bdffe0 	addiu	sp,sp,-32
  4007dc:	27a20028 	addiu	v0,sp,40
  4007e0:	afa60028 	sw	a2,40(sp)
  4007e4:	00403021 	move	a2,v0
  4007e8:	afbf0018 	sw	ra,24(sp)
  4007ec:	afa7002c 	sw	a3,44(sp)
  4007f0:	0c1001ee 	jal	4007b8 <verr>
  4007f4:	afa20010 	sw	v0,16(sp)
  4007f8:	8fbf0018 	lw	ra,24(sp)
  4007fc:	00000000 	nop
  400800:	03e00008 	jr	ra
  400804:	27bd0020 	addiu	sp,sp,32

00400808 <vwarnx>:
  400808:	00a03021 	move	a2,a1
  40080c:	00802821 	move	a1,a0
  400810:	081001a6 	j	400698 <__printerr>
  400814:	00002021 	move	a0,zero

00400818 <warnx>:
  400818:	27bdffe0 	addiu	sp,sp,-32
  40081c:	27a20024 	addiu	v0,sp,36
  400820:	afa50024 	sw	a1,36(sp)
  400824:	00402821 	move	a1,v0
  400828:	afbf0018 	sw	ra,24(sp)
  40082c:	afa60028 	sw	a2,40(sp)
  400830:	afa7002c 	sw	a3,44(sp)
  400834:	0c100202 	jal	400808 <vwarnx>
  400838:	afa20010 	sw	v0,16(sp)
  40083c:	8fbf0018 	lw	ra,24(sp)
  400840:	00000000 	nop
  400844:	03e00008 	jr	ra
  400848:	27bd0020 	addiu	sp,sp,32

0040084c <vwarn>:
  40084c:	00a03021 	move	a2,a1
  400850:	00802821 	move	a1,a0
  400854:	081001a6 	j	400698 <__printerr>
  400858:	24040001 	li	a0,1

0040085c <warn>:
  40085c:	27bdffe0 	addiu	sp,sp,-32
  400860:	27a20024 	addiu	v0,sp,36
  400864:	afa50024 	sw	a1,36(sp)
  400868:	00402821 	move	a1,v0
  40086c:	afbf0018 	sw	ra,24(sp)
  400870:	afa60028 	sw	a2,40(sp)
  400874:	afa7002c 	sw	a3,44(sp)
  400878:	0c100213 	jal	40084c <vwarn>
  40087c:	afa20010 	sw	v0,16(sp)
  400880:	8fbf0018 	lw	ra,24(sp)
  400884:	00000000 	nop
  400888:	03e00008 	jr	ra
  40088c:	27bd0020 	addiu	sp,sp,32

00400890 <__pf_print>:
  400890:	27bdffe0 	addiu	sp,sp,-32
  400894:	afbf0018 	sw	ra,24(sp)
  400898:	afb10014 	sw	s1,20(sp)
  40089c:	afb00010 	sw	s0,16(sp)
  4008a0:	8c830000 	lw	v1,0(a0)
  4008a4:	00808021 	move	s0,a0
  4008a8:	8c840004 	lw	a0,4(a0)
  4008ac:	0060f809 	jalr	v1
  4008b0:	00c08821 	move	s1,a2
  4008b4:	8e02000c 	lw	v0,12(s0)
  4008b8:	00000000 	nop
  4008bc:	00511021 	addu	v0,v0,s1
  4008c0:	ae02000c 	sw	v0,12(s0)
  4008c4:	8fbf0018 	lw	ra,24(sp)
  4008c8:	8fb10014 	lw	s1,20(sp)
  4008cc:	8fb00010 	lw	s0,16(sp)
  4008d0:	03e00008 	jr	ra
  4008d4:	27bd0020 	addiu	sp,sp,32

004008d8 <__pf_endfield>:
  4008d8:	24020020 	li	v0,32
  4008dc:	ac82002c 	sw	v0,44(a0)
  4008e0:	00001821 	move	v1,zero
  4008e4:	00001021 	move	v0,zero
  4008e8:	ac800038 	sw	zero,56(a0)
  4008ec:	ac800010 	sw	zero,16(a0)
  4008f0:	ac800014 	sw	zero,20(a0)
  4008f4:	ac83001c 	sw	v1,28(a0)
  4008f8:	ac820018 	sw	v0,24(a0)
  4008fc:	ac800020 	sw	zero,32(a0)
  400900:	ac800024 	sw	zero,36(a0)
  400904:	ac800028 	sw	zero,40(a0)
  400908:	ac800030 	sw	zero,48(a0)
  40090c:	03e00008 	jr	ra
  400910:	ac800034 	sw	zero,52(a0)

00400914 <__pf_fill>:
  400914:	27bdffd0 	addiu	sp,sp,-48
  400918:	afb30024 	sw	s3,36(sp)
  40091c:	afb20020 	sw	s2,32(sp)
  400920:	afbf0028 	sw	ra,40(sp)
  400924:	afb1001c 	sw	s1,28(sp)
  400928:	afb00018 	sw	s0,24(sp)
  40092c:	00809821 	move	s3,a0
  400930:	8c82002c 	lw	v0,44(a0)
  400934:	18a0000b 	blez	a1,400964 <__pf_fill+0x50>
  400938:	00a09021 	move	s2,a1
  40093c:	a3a20010 	sb	v0,16(sp)
  400940:	00008021 	move	s0,zero
  400944:	27b10010 	addiu	s1,sp,16
  400948:	26100001 	addiu	s0,s0,1
  40094c:	02602021 	move	a0,s3
  400950:	02202821 	move	a1,s1
  400954:	0c100224 	jal	400890 <__pf_print>
  400958:	24060001 	li	a2,1
  40095c:	1650fffb 	bne	s2,s0,40094c <__pf_fill+0x38>
  400960:	26100001 	addiu	s0,s0,1
  400964:	8fbf0028 	lw	ra,40(sp)
  400968:	8fb30024 	lw	s3,36(sp)
  40096c:	8fb20020 	lw	s2,32(sp)
  400970:	8fb1001c 	lw	s1,28(sp)
  400974:	8fb00018 	lw	s0,24(sp)
  400978:	03e00008 	jr	ra
  40097c:	27bd0030 	addiu	sp,sp,48

00400980 <__pf_printstuff>:
  400980:	27bdffd0 	addiu	sp,sp,-48
  400984:	afbf0028 	sw	ra,40(sp)
  400988:	afb50024 	sw	s5,36(sp)
  40098c:	afb40020 	sw	s4,32(sp)
  400990:	afb3001c 	sw	s3,28(sp)
  400994:	afb20018 	sw	s2,24(sp)
  400998:	00c09821 	move	s3,a2
  40099c:	afb10014 	sw	s1,20(sp)
  4009a0:	afb00010 	sw	s0,16(sp)
  4009a4:	00808821 	move	s1,a0
  4009a8:	00a02021 	move	a0,a1
  4009ac:	00a0a021 	move	s4,a1
  4009b0:	0c100438 	jal	4010e0 <strlen>
  4009b4:	00e0a821 	move	s5,a3
  4009b8:	02602021 	move	a0,s3
  4009bc:	0c100438 	jal	4010e0 <strlen>
  4009c0:	00409021 	move	s2,v0
  4009c4:	02a02021 	move	a0,s5
  4009c8:	0c100438 	jal	4010e0 <strlen>
  4009cc:	02428021 	addu	s0,s2,v0
  4009d0:	8e230024 	lw	v1,36(s1)
  4009d4:	02022821 	addu	a1,s0,v0
  4009d8:	00a3102a 	slt	v0,a1,v1
  4009dc:	10400040 	beqz	v0,400ae0 <__pf_printstuff+0x160>
  4009e0:	00658023 	subu	s0,v1,a1
  4009e4:	1a000056 	blez	s0,400b40 <__pf_printstuff+0x1c0>
  4009e8:	02403021 	move	a2,s2
  4009ec:	8e220028 	lw	v0,40(s1)
  4009f0:	00000000 	nop
  4009f4:	10400028 	beqz	v0,400a98 <__pf_printstuff+0x118>
  4009f8:	24020030 	li	v0,48
  4009fc:	0c100438 	jal	4010e0 <strlen>
  400a00:	02802021 	move	a0,s4
  400a04:	00403021 	move	a2,v0
  400a08:	02802821 	move	a1,s4
  400a0c:	0c100224 	jal	400890 <__pf_print>
  400a10:	02202021 	move	a0,s1
  400a14:	0c100438 	jal	4010e0 <strlen>
  400a18:	02602021 	move	a0,s3
  400a1c:	00403021 	move	a2,v0
  400a20:	02202021 	move	a0,s1
  400a24:	0c100224 	jal	400890 <__pf_print>
  400a28:	02602821 	move	a1,s3
  400a2c:	8e220028 	lw	v0,40(s1)
  400a30:	00000000 	nop
  400a34:	14400005 	bnez	v0,400a4c <__pf_printstuff+0xcc>
  400a38:	24020030 	li	v0,48
  400a3c:	8e23002c 	lw	v1,44(s1)
  400a40:	00000000 	nop
  400a44:	1062004b 	beq	v1,v0,400b74 <__pf_printstuff+0x1f4>
  400a48:	02202021 	move	a0,s1
  400a4c:	0c100438 	jal	4010e0 <strlen>
  400a50:	02a02021 	move	a0,s5
  400a54:	00403021 	move	a2,v0
  400a58:	02202021 	move	a0,s1
  400a5c:	0c100224 	jal	400890 <__pf_print>
  400a60:	02a02821 	move	a1,s5
  400a64:	8e220028 	lw	v0,40(s1)
  400a68:	00000000 	nop
  400a6c:	14400012 	bnez	v0,400ab8 <__pf_printstuff+0x138>
  400a70:	02202021 	move	a0,s1
  400a74:	8fbf0028 	lw	ra,40(sp)
  400a78:	8fb50024 	lw	s5,36(sp)
  400a7c:	8fb40020 	lw	s4,32(sp)
  400a80:	8fb3001c 	lw	s3,28(sp)
  400a84:	8fb20018 	lw	s2,24(sp)
  400a88:	8fb10014 	lw	s1,20(sp)
  400a8c:	8fb00010 	lw	s0,16(sp)
  400a90:	03e00008 	jr	ra
  400a94:	27bd0030 	addiu	sp,sp,48
  400a98:	8e23002c 	lw	v1,44(s1)
  400a9c:	00000000 	nop
  400aa0:	1062ffd6 	beq	v1,v0,4009fc <__pf_printstuff+0x7c>
  400aa4:	02202021 	move	a0,s1
  400aa8:	0c100245 	jal	400914 <__pf_fill>
  400aac:	02002821 	move	a1,s0
  400ab0:	0810027f 	j	4009fc <__pf_printstuff+0x7c>
  400ab4:	00000000 	nop
  400ab8:	02002821 	move	a1,s0
  400abc:	8fbf0028 	lw	ra,40(sp)
  400ac0:	8fb50024 	lw	s5,36(sp)
  400ac4:	8fb40020 	lw	s4,32(sp)
  400ac8:	8fb3001c 	lw	s3,28(sp)
  400acc:	8fb20018 	lw	s2,24(sp)
  400ad0:	8fb10014 	lw	s1,20(sp)
  400ad4:	8fb00010 	lw	s0,16(sp)
  400ad8:	08100245 	j	400914 <__pf_fill>
  400adc:	27bd0030 	addiu	sp,sp,48
  400ae0:	02802821 	move	a1,s4
  400ae4:	02403021 	move	a2,s2
  400ae8:	0c100224 	jal	400890 <__pf_print>
  400aec:	02202021 	move	a0,s1
  400af0:	0c100438 	jal	4010e0 <strlen>
  400af4:	02602021 	move	a0,s3
  400af8:	00403021 	move	a2,v0
  400afc:	02202021 	move	a0,s1
  400b00:	0c100224 	jal	400890 <__pf_print>
  400b04:	02602821 	move	a1,s3
  400b08:	0c100438 	jal	4010e0 <strlen>
  400b0c:	02a02021 	move	a0,s5
  400b10:	02202021 	move	a0,s1
  400b14:	02a02821 	move	a1,s5
  400b18:	8fbf0028 	lw	ra,40(sp)
  400b1c:	8fb50024 	lw	s5,36(sp)
  400b20:	8fb40020 	lw	s4,32(sp)
  400b24:	8fb3001c 	lw	s3,28(sp)
  400b28:	8fb20018 	lw	s2,24(sp)
  400b2c:	8fb10014 	lw	s1,20(sp)
  400b30:	8fb00010 	lw	s0,16(sp)
  400b34:	00403021 	move	a2,v0
  400b38:	08100224 	j	400890 <__pf_print>
  400b3c:	27bd0030 	addiu	sp,sp,48
  400b40:	02802821 	move	a1,s4
  400b44:	0c100224 	jal	400890 <__pf_print>
  400b48:	02202021 	move	a0,s1
  400b4c:	0c100438 	jal	4010e0 <strlen>
  400b50:	02602021 	move	a0,s3
  400b54:	00403021 	move	a2,v0
  400b58:	02202021 	move	a0,s1
  400b5c:	0c100224 	jal	400890 <__pf_print>
  400b60:	02602821 	move	a1,s3
  400b64:	0c100438 	jal	4010e0 <strlen>
  400b68:	02a02021 	move	a0,s5
  400b6c:	081002c5 	j	400b14 <__pf_printstuff+0x194>
  400b70:	02202021 	move	a0,s1
  400b74:	0c100245 	jal	400914 <__pf_fill>
  400b78:	02002821 	move	a1,s0
  400b7c:	08100293 	j	400a4c <__pf_printstuff+0xcc>
  400b80:	00000000 	nop

00400b84 <__vprintf>:
  400b84:	27bdff68 	addiu	sp,sp,-152
  400b88:	afbe0090 	sw	s8,144(sp)
  400b8c:	27be0030 	addiu	s8,sp,48
  400b90:	afb10074 	sw	s1,116(sp)
  400b94:	afa40030 	sw	a0,48(sp)
  400b98:	00c08821 	move	s1,a2
  400b9c:	03c02021 	move	a0,s8
  400ba0:	afb00070 	sw	s0,112(sp)
  400ba4:	afbf0094 	sw	ra,148(sp)
  400ba8:	afb7008c 	sw	s7,140(sp)
  400bac:	afb60088 	sw	s6,136(sp)
  400bb0:	afb50084 	sw	s5,132(sp)
  400bb4:	afb40080 	sw	s4,128(sp)
  400bb8:	afb3007c 	sw	s3,124(sp)
  400bbc:	afb20078 	sw	s2,120(sp)
  400bc0:	afa50034 	sw	a1,52(sp)
  400bc4:	afa70038 	sw	a3,56(sp)
  400bc8:	0c100236 	jal	4008d8 <__pf_endfield>
  400bcc:	afa0003c 	sw	zero,60(sp)
  400bd0:	82300000 	lb	s0,0(s1)
  400bd4:	00000000 	nop
  400bd8:	12000017 	beqz	s0,400c38 <__vprintf+0xb4>
  400bdc:	0220a021 	move	s4,s1
  400be0:	08100302 	j	400c08 <__vprintf+0x84>
  400be4:	00000000 	nop
  400be8:	27a50010 	addiu	a1,sp,16
  400bec:	24060001 	li	a2,1
  400bf0:	0c100224 	jal	400890 <__pf_print>
  400bf4:	a3b00010 	sb	s0,16(sp)
  400bf8:	82900001 	lb	s0,1(s4)
  400bfc:	00000000 	nop
  400c00:	1200000d 	beqz	s0,400c38 <__vprintf+0xb4>
  400c04:	26940001 	addiu	s4,s4,1
  400c08:	8fa20040 	lw	v0,64(sp)
  400c0c:	00000000 	nop
  400c10:	14400016 	bnez	v0,400c6c <__vprintf+0xe8>
  400c14:	24020025 	li	v0,37
  400c18:	1602fff3 	bne	s0,v0,400be8 <__vprintf+0x64>
  400c1c:	03c02021 	move	a0,s8
  400c20:	24020001 	li	v0,1
  400c24:	afa20040 	sw	v0,64(sp)
  400c28:	82900001 	lb	s0,1(s4)
  400c2c:	00000000 	nop
  400c30:	1600fff5 	bnez	s0,400c08 <__vprintf+0x84>
  400c34:	26940001 	addiu	s4,s4,1
  400c38:	8fa2003c 	lw	v0,60(sp)
  400c3c:	8fbf0094 	lw	ra,148(sp)
  400c40:	8fbe0090 	lw	s8,144(sp)
  400c44:	8fb7008c 	lw	s7,140(sp)
  400c48:	8fb60088 	lw	s6,136(sp)
  400c4c:	8fb50084 	lw	s5,132(sp)
  400c50:	8fb40080 	lw	s4,128(sp)
  400c54:	8fb3007c 	lw	s3,124(sp)
  400c58:	8fb20078 	lw	s2,120(sp)
  400c5c:	8fb10074 	lw	s1,116(sp)
  400c60:	8fb00070 	lw	s0,112(sp)
  400c64:	03e00008 	jr	ra
  400c68:	27bd0098 	addiu	sp,sp,152
  400c6c:	3c040040 	lui	a0,0x40
  400c70:	24841a60 	addiu	a0,a0,6752
  400c74:	0c1000c8 	jal	400320 <strchr>
  400c78:	02002821 	move	a1,s0
  400c7c:	10400031 	beqz	v0,400d44 <__vprintf+0x1c0>
  400c80:	24020030 	li	v0,48
  400c84:	1202001d 	beq	s0,v0,400cfc <__vprintf+0x178>
  400c88:	2a020031 	slti	v0,s0,49
  400c8c:	10400013 	beqz	v0,400cdc <__vprintf+0x158>
  400c90:	2402006c 	li	v0,108
  400c94:	24020023 	li	v0,35
  400c98:	12020027 	beq	s0,v0,400d38 <__vprintf+0x1b4>
  400c9c:	2402002d 	li	v0,45
  400ca0:	1202004a 	beq	s0,v0,400dcc <__vprintf+0x248>
  400ca4:	24020001 	li	v0,1
  400ca8:	2602ffcf 	addiu	v0,s0,-49
  400cac:	2c420009 	sltiu	v0,v0,9
  400cb0:	1040001a 	beqz	v0,400d1c <__vprintf+0x198>
  400cb4:	3c040040 	lui	a0,0x40
  400cb8:	8fa20054 	lw	v0,84(sp)
  400cbc:	00000000 	nop
  400cc0:	000218c0 	sll	v1,v0,0x3
  400cc4:	00021040 	sll	v0,v0,0x1
  400cc8:	00431021 	addu	v0,v0,v1
  400ccc:	02021021 	addu	v0,s0,v0
  400cd0:	2442ffd0 	addiu	v0,v0,-48
  400cd4:	081002fe 	j	400bf8 <__vprintf+0x74>
  400cd8:	afa20054 	sw	v0,84(sp)
  400cdc:	1602fff3 	bne	s0,v0,400cac <__vprintf+0x128>
  400ce0:	2602ffcf 	addiu	v0,s0,-49
  400ce4:	8fa20044 	lw	v0,68(sp)
  400ce8:	24030001 	li	v1,1
  400cec:	10430039 	beq	v0,v1,400dd4 <__vprintf+0x250>
  400cf0:	24020002 	li	v0,2
  400cf4:	081002fe 	j	400bf8 <__vprintf+0x74>
  400cf8:	afa30044 	sw	v1,68(sp)
  400cfc:	8fa20054 	lw	v0,84(sp)
  400d00:	00000000 	nop
  400d04:	1840008c 	blez	v0,400f38 <__vprintf+0x3b4>
  400d08:	000218c0 	sll	v1,v0,0x3
  400d0c:	00021040 	sll	v0,v0,0x1
  400d10:	00431021 	addu	v0,v0,v1
  400d14:	081002fe 	j	400bf8 <__vprintf+0x74>
  400d18:	afa20054 	sw	v0,84(sp)
  400d1c:	3c060040 	lui	a2,0x40
  400d20:	24841a70 	addiu	a0,a0,6768
  400d24:	24c61a98 	addiu	a2,a2,6808
  400d28:	0c10045c 	jal	401170 <__bad_assert>
  400d2c:	240500dc 	li	a1,220
  400d30:	0810032e 	j	400cb8 <__vprintf+0x134>
  400d34:	00000000 	nop
  400d38:	24020001 	li	v0,1
  400d3c:	081002fe 	j	400bf8 <__vprintf+0x74>
  400d40:	afa20068 	sw	v0,104(sp)
  400d44:	3c040040 	lui	a0,0x40
  400d48:	24841aac 	addiu	a0,a0,6828
  400d4c:	0c1000c8 	jal	400320 <strchr>
  400d50:	02002821 	move	a1,s0
  400d54:	10400091 	beqz	v0,400f9c <__vprintf+0x418>
  400d58:	24020070 	li	v0,112
  400d5c:	1202001f 	beq	s0,v0,400ddc <__vprintf+0x258>
  400d60:	24020064 	li	v0,100
  400d64:	1202009e 	beq	s0,v0,400fe0 <__vprintf+0x45c>
  400d68:	24020001 	li	v0,1
  400d6c:	8fa30044 	lw	v1,68(sp)
  400d70:	00000000 	nop
  400d74:	10620003 	beq	v1,v0,400d84 <__vprintf+0x200>
  400d78:	00000000 	nop
  400d7c:	14600074 	bnez	v1,400f50 <__vprintf+0x3cc>
  400d80:	24020002 	li	v0,2
  400d84:	8fa20038 	lw	v0,56(sp)
  400d88:	afa00048 	sw	zero,72(sp)
  400d8c:	8c430000 	lw	v1,0(v0)
  400d90:	24420004 	addiu	v0,v0,4
  400d94:	afa20038 	sw	v0,56(sp)
  400d98:	afa3004c 	sw	v1,76(sp)
  400d9c:	2602ff9c 	addiu	v0,s0,-100
  400da0:	304200ff 	andi	v0,v0,0xff
  400da4:	2c430015 	sltiu	v1,v0,21
  400da8:	10600015 	beqz	v1,400e00 <__vprintf+0x27c>
  400dac:	3c030040 	lui	v1,0x40
  400db0:	00021080 	sll	v0,v0,0x2
  400db4:	246318a0 	addiu	v1,v1,6304
  400db8:	00431021 	addu	v0,v0,v1
  400dbc:	8c440000 	lw	a0,0(v0)
  400dc0:	00000000 	nop
  400dc4:	00800008 	jr	a0
  400dc8:	00000000 	nop
  400dcc:	081002fe 	j	400bf8 <__vprintf+0x74>
  400dd0:	afa20058 	sw	v0,88(sp)
  400dd4:	081002fe 	j	400bf8 <__vprintf+0x74>
  400dd8:	afa20044 	sw	v0,68(sp)
  400ddc:	8fa20038 	lw	v0,56(sp)
  400de0:	afa00048 	sw	zero,72(sp)
  400de4:	24430004 	addiu	v1,v0,4
  400de8:	afa30038 	sw	v1,56(sp)
  400dec:	8c440000 	lw	a0,0(v0)
  400df0:	00000000 	nop
  400df4:	afa4004c 	sw	a0,76(sp)
  400df8:	24020010 	li	v0,16
  400dfc:	afa20060 	sw	v0,96(sp)
  400e00:	8fa20068 	lw	v0,104(sp)
  400e04:	00000000 	nop
  400e08:	1440004d 	bnez	v0,400f40 <__vprintf+0x3bc>
  400e0c:	24020001 	li	v0,1
  400e10:	24020070 	li	v0,112
  400e14:	1202004a 	beq	s0,v0,400f40 <__vprintf+0x3bc>
  400e18:	24020001 	li	v0,1
  400e1c:	8fb60060 	lw	s6,96(sp)
  400e20:	3c020040 	lui	v0,0x40
  400e24:	8fb1004c 	lw	s1,76(sp)
  400e28:	8fb00048 	lw	s0,72(sp)
  400e2c:	a3a00029 	sb	zero,41(sp)
  400e30:	24571ab4 	addiu	s7,v0,6836
  400e34:	27b50028 	addiu	s5,sp,40
  400e38:	02c09821 	move	s3,s6
  400e3c:	001697c3 	sra	s2,s6,0x1f
  400e40:	02202821 	move	a1,s1
  400e44:	02002021 	move	a0,s0
  400e48:	02603821 	move	a3,s3
  400e4c:	0c100450 	jal	401140 <__umoddi3>
  400e50:	02403021 	move	a2,s2
  400e54:	02e31821 	addu	v1,s7,v1
  400e58:	90620000 	lbu	v0,0(v1)
  400e5c:	02202821 	move	a1,s1
  400e60:	02002021 	move	a0,s0
  400e64:	02603821 	move	a3,s3
  400e68:	02403021 	move	a2,s2
  400e6c:	0c100448 	jal	401120 <__udivdi3>
  400e70:	a2a20000 	sb	v0,0(s5)
  400e74:	00408021 	move	s0,v0
  400e78:	02031025 	or	v0,s0,v1
  400e7c:	00608821 	move	s1,v1
  400e80:	1440ffef 	bnez	v0,400e40 <__vprintf+0x2bc>
  400e84:	26b5ffff 	addiu	s5,s5,-1
  400e88:	8fa20064 	lw	v0,100(sp)
  400e8c:	00000000 	nop
  400e90:	10400006 	beqz	v0,400eac <__vprintf+0x328>
  400e94:	3c020040 	lui	v0,0x40
  400e98:	24020010 	li	v0,16
  400e9c:	12c2005e 	beq	s6,v0,401018 <__vprintf+0x494>
  400ea0:	24020008 	li	v0,8
  400ea4:	12c20037 	beq	s6,v0,400f84 <__vprintf+0x400>
  400ea8:	3c020040 	lui	v0,0x40
  400eac:	24461a24 	addiu	a2,v0,6692
  400eb0:	8fa20050 	lw	v0,80(sp)
  400eb4:	00000000 	nop
  400eb8:	10400023 	beqz	v0,400f48 <__vprintf+0x3c4>
  400ebc:	3c020040 	lui	v0,0x40
  400ec0:	3c020040 	lui	v0,0x40
  400ec4:	24451a54 	addiu	a1,v0,6740
  400ec8:	03c02021 	move	a0,s8
  400ecc:	0c100260 	jal	400980 <__pf_printstuff>
  400ed0:	26a70001 	addiu	a3,s5,1
  400ed4:	0c100236 	jal	4008d8 <__pf_endfield>
  400ed8:	03c02021 	move	a0,s8
  400edc:	081002fe 	j	400bf8 <__vprintf+0x74>
  400ee0:	00000000 	nop
  400ee4:	8fa20038 	lw	v0,56(sp)
  400ee8:	2403fff8 	li	v1,-8
  400eec:	24420007 	addiu	v0,v0,7
  400ef0:	00431024 	and	v0,v0,v1
  400ef4:	8c470004 	lw	a3,4(v0)
  400ef8:	8c460000 	lw	a2,0(v0)
  400efc:	24420008 	addiu	v0,v0,8
  400f00:	afa20038 	sw	v0,56(sp)
  400f04:	04c10040 	bgez	a2,401008 <__vprintf+0x484>
  400f08:	2402000a 	li	v0,10
  400f0c:	00071823 	negu	v1,a3
  400f10:	0003282b 	sltu	a1,zero,v1
  400f14:	00061023 	negu	v0,a2
  400f18:	00451023 	subu	v0,v0,a1
  400f1c:	2404ffff 	li	a0,-1
  400f20:	afa40050 	sw	a0,80(sp)
  400f24:	afa3004c 	sw	v1,76(sp)
  400f28:	afa20048 	sw	v0,72(sp)
  400f2c:	2402000a 	li	v0,10
  400f30:	08100380 	j	400e00 <__vprintf+0x27c>
  400f34:	afa20060 	sw	v0,96(sp)
  400f38:	081002fe 	j	400bf8 <__vprintf+0x74>
  400f3c:	afb0005c 	sw	s0,92(sp)
  400f40:	08100387 	j	400e1c <__vprintf+0x298>
  400f44:	afa20064 	sw	v0,100(sp)
  400f48:	081003b2 	j	400ec8 <__vprintf+0x344>
  400f4c:	24451a24 	addiu	a1,v0,6692
  400f50:	1462ff93 	bne	v1,v0,400da0 <__vprintf+0x21c>
  400f54:	2602ff9c 	addiu	v0,s0,-100
  400f58:	8fa20038 	lw	v0,56(sp)
  400f5c:	2403fff8 	li	v1,-8
  400f60:	24420007 	addiu	v0,v0,7
  400f64:	00431024 	and	v0,v0,v1
  400f68:	8c450004 	lw	a1,4(v0)
  400f6c:	8c440000 	lw	a0,0(v0)
  400f70:	24420008 	addiu	v0,v0,8
  400f74:	afa20038 	sw	v0,56(sp)
  400f78:	afa5004c 	sw	a1,76(sp)
  400f7c:	08100367 	j	400d9c <__vprintf+0x218>
  400f80:	afa40048 	sw	a0,72(sp)
  400f84:	3c020040 	lui	v0,0x40
  400f88:	081003ac 	j	400eb0 <__vprintf+0x32c>
  400f8c:	24461acc 	addiu	a2,v0,6860
  400f90:	24020008 	li	v0,8
  400f94:	08100380 	j	400e00 <__vprintf+0x27c>
  400f98:	afa20060 	sw	v0,96(sp)
  400f9c:	24020073 	li	v0,115
  400fa0:	12020028 	beq	s0,v0,401044 <__vprintf+0x4c0>
  400fa4:	24020063 	li	v0,99
  400fa8:	12020037 	beq	s0,v0,401088 <__vprintf+0x504>
  400fac:	00000000 	nop
  400fb0:	a3b00011 	sb	s0,17(sp)
  400fb4:	3c050040 	lui	a1,0x40
  400fb8:	24a51a24 	addiu	a1,a1,6692
  400fbc:	03c02021 	move	a0,s8
  400fc0:	00a03021 	move	a2,a1
  400fc4:	27a70011 	addiu	a3,sp,17
  400fc8:	0c100260 	jal	400980 <__pf_printstuff>
  400fcc:	a3a00012 	sb	zero,18(sp)
  400fd0:	0c100236 	jal	4008d8 <__pf_endfield>
  400fd4:	03c02021 	move	a0,s8
  400fd8:	081002fe 	j	400bf8 <__vprintf+0x74>
  400fdc:	00000000 	nop
  400fe0:	8fa30044 	lw	v1,68(sp)
  400fe4:	00000000 	nop
  400fe8:	1062000e 	beq	v1,v0,401024 <__vprintf+0x4a0>
  400fec:	00000000 	nop
  400ff0:	1060000c 	beqz	v1,401024 <__vprintf+0x4a0>
  400ff4:	24020002 	li	v0,2
  400ff8:	1062ffba 	beq	v1,v0,400ee4 <__vprintf+0x360>
  400ffc:	00003821 	move	a3,zero
  401000:	00003021 	move	a2,zero
  401004:	2402000a 	li	v0,10
  401008:	afa7004c 	sw	a3,76(sp)
  40100c:	afa60048 	sw	a2,72(sp)
  401010:	08100380 	j	400e00 <__vprintf+0x27c>
  401014:	afa20060 	sw	v0,96(sp)
  401018:	3c020040 	lui	v0,0x40
  40101c:	081003ac 	j	400eb0 <__vprintf+0x32c>
  401020:	24461ac8 	addiu	a2,v0,6856
  401024:	8fa20038 	lw	v0,56(sp)
  401028:	00000000 	nop
  40102c:	8c430000 	lw	v1,0(v0)
  401030:	24420004 	addiu	v0,v0,4
  401034:	00603821 	move	a3,v1
  401038:	000337c3 	sra	a2,v1,0x1f
  40103c:	081003c1 	j	400f04 <__vprintf+0x380>
  401040:	afa20038 	sw	v0,56(sp)
  401044:	8fa30038 	lw	v1,56(sp)
  401048:	00000000 	nop
  40104c:	8c670000 	lw	a3,0(v1)
  401050:	00000000 	nop
  401054:	10e00013 	beqz	a3,4010a4 <__vprintf+0x520>
  401058:	3c020040 	lui	v0,0x40
  40105c:	3c050040 	lui	a1,0x40
  401060:	24a51a24 	addiu	a1,a1,6692
  401064:	24620004 	addiu	v0,v1,4
  401068:	03c02021 	move	a0,s8
  40106c:	00a03021 	move	a2,a1
  401070:	0c100260 	jal	400980 <__pf_printstuff>
  401074:	afa20038 	sw	v0,56(sp)
  401078:	0c100236 	jal	4008d8 <__pf_endfield>
  40107c:	03c02021 	move	a0,s8
  401080:	081002fe 	j	400bf8 <__vprintf+0x74>
  401084:	00000000 	nop
  401088:	8fa20038 	lw	v0,56(sp)
  40108c:	00000000 	nop
  401090:	8c430000 	lw	v1,0(v0)
  401094:	24420004 	addiu	v0,v0,4
  401098:	afa20038 	sw	v0,56(sp)
  40109c:	081003ed 	j	400fb4 <__vprintf+0x430>
  4010a0:	a3a30011 	sb	v1,17(sp)
  4010a4:	08100417 	j	40105c <__vprintf+0x4d8>
  4010a8:	24471a58 	addiu	a3,v0,6744
  4010ac:	00000000 	nop

004010b0 <strerror>:
  4010b0:	3c020040 	lui	v0,0x40
  4010b4:	00042880 	sll	a1,a0,0x2
  4010b8:	24421900 	addiu	v0,v0,6400
  4010bc:	3c030040 	lui	v1,0x40
  4010c0:	2c840041 	sltiu	a0,a0,65
  4010c4:	00a22821 	addu	a1,a1,v0
  4010c8:	10800002 	beqz	a0,4010d4 <strerror+0x24>
  4010cc:	24621ad0 	addiu	v0,v1,6864
  4010d0:	8ca20000 	lw	v0,0(a1)
  4010d4:	03e00008 	jr	ra
  4010d8:	00000000 	nop
  4010dc:	00000000 	nop

004010e0 <strlen>:
  4010e0:	80820000 	lb	v0,0(a0)
  4010e4:	00000000 	nop
  4010e8:	1040000a 	beqz	v0,401114 <strlen+0x34>
  4010ec:	00002821 	move	a1,zero
  4010f0:	24a50001 	addiu	a1,a1,1
  4010f4:	00851021 	addu	v0,a0,a1
  4010f8:	80430000 	lb	v1,0(v0)
  4010fc:	00000000 	nop
  401100:	1460fffc 	bnez	v1,4010f4 <strlen+0x14>
  401104:	24a50001 	addiu	a1,a1,1
  401108:	24a5ffff 	addiu	a1,a1,-1
  40110c:	03e00008 	jr	ra
  401110:	00a01021 	move	v0,a1
  401114:	03e00008 	jr	ra
  401118:	00a01021 	move	v0,a1
  40111c:	00000000 	nop

00401120 <__udivdi3>:
  401120:	27bdffe0 	addiu	sp,sp,-32
  401124:	afbf0018 	sw	ra,24(sp)
  401128:	0c1004d7 	jal	40135c <__qdivrem>
  40112c:	afa00010 	sw	zero,16(sp)
  401130:	8fbf0018 	lw	ra,24(sp)
  401134:	00000000 	nop
  401138:	03e00008 	jr	ra
  40113c:	27bd0020 	addiu	sp,sp,32

00401140 <__umoddi3>:
  401140:	27bdffd8 	addiu	sp,sp,-40
  401144:	27a20018 	addiu	v0,sp,24
  401148:	afbf0020 	sw	ra,32(sp)
  40114c:	0c1004d7 	jal	40135c <__qdivrem>
  401150:	afa20010 	sw	v0,16(sp)
  401154:	8fa3001c 	lw	v1,28(sp)
  401158:	8fa20018 	lw	v0,24(sp)
  40115c:	8fbf0020 	lw	ra,32(sp)
  401160:	00000000 	nop
  401164:	03e00008 	jr	ra
  401168:	27bd0028 	addiu	sp,sp,40
  40116c:	00000000 	nop

00401170 <__bad_assert>:
  401170:	27bdfee0 	addiu	sp,sp,-288
  401174:	00c03821 	move	a3,a2
  401178:	afb00118 	sw	s0,280(sp)
  40117c:	3c060040 	lui	a2,0x40
  401180:	27b00018 	addiu	s0,sp,24
  401184:	24c620d4 	addiu	a2,a2,8404
  401188:	afa40010 	sw	a0,16(sp)
  40118c:	afa50014 	sw	a1,20(sp)
  401190:	02002021 	move	a0,s0
  401194:	afbf011c 	sw	ra,284(sp)
  401198:	0c1004a8 	jal	4012a0 <snprintf>
  40119c:	24050100 	li	a1,256
  4011a0:	0c100438 	jal	4010e0 <strlen>
  4011a4:	02002021 	move	a0,s0
  4011a8:	00403021 	move	a2,v0
  4011ac:	02002821 	move	a1,s0
  4011b0:	0c10012f 	jal	4004bc <write>
  4011b4:	24040002 	li	a0,2
  4011b8:	0c1004b4 	jal	4012d0 <abort>
  4011bc:	00000000 	nop

004011c0 <__snprintf_send>:
  4011c0:	10c00012 	beqz	a2,40120c <__snprintf_send+0x4c>
  4011c4:	00004021 	move	t0,zero
  4011c8:	8c870008 	lw	a3,8(a0)
  4011cc:	8c820004 	lw	v0,4(a0)
  4011d0:	00a81821 	addu	v1,a1,t0
  4011d4:	00e2102b 	sltu	v0,a3,v0
  4011d8:	1040000a 	beqz	v0,401204 <__snprintf_send+0x44>
  4011dc:	25080001 	addiu	t0,t0,1
  4011e0:	8c820000 	lw	v0,0(a0)
  4011e4:	90630000 	lbu	v1,0(v1)
  4011e8:	00471021 	addu	v0,v0,a3
  4011ec:	a0430000 	sb	v1,0(v0)
  4011f0:	8c870008 	lw	a3,8(a0)
  4011f4:	00000000 	nop
  4011f8:	24e20001 	addiu	v0,a3,1
  4011fc:	00403821 	move	a3,v0
  401200:	ac820008 	sw	v0,8(a0)
  401204:	14c8fff1 	bne	a2,t0,4011cc <__snprintf_send+0xc>
  401208:	00000000 	nop
  40120c:	03e00008 	jr	ra
  401210:	00000000 	nop

00401214 <vsnprintf>:
  401214:	27bdffd8 	addiu	sp,sp,-40
  401218:	afb00020 	sw	s0,32(sp)
  40121c:	00a01021 	move	v0,a1
  401220:	00808021 	move	s0,a0
  401224:	3c040040 	lui	a0,0x40
  401228:	24a3ffff 	addiu	v1,a1,-1
  40122c:	afbf0024 	sw	ra,36(sp)
  401230:	248411c0 	addiu	a0,a0,4544
  401234:	27a50010 	addiu	a1,sp,16
  401238:	1440000c 	bnez	v0,40126c <vsnprintf+0x58>
  40123c:	afb00010 	sw	s0,16(sp)
  401240:	3c040040 	lui	a0,0x40
  401244:	248411c0 	addiu	a0,a0,4544
  401248:	afa00014 	sw	zero,20(sp)
  40124c:	0c1002e1 	jal	400b84 <__vprintf>
  401250:	afa00018 	sw	zero,24(sp)
  401254:	00401821 	move	v1,v0
  401258:	8fbf0024 	lw	ra,36(sp)
  40125c:	8fb00020 	lw	s0,32(sp)
  401260:	00601021 	move	v0,v1
  401264:	03e00008 	jr	ra
  401268:	27bd0028 	addiu	sp,sp,40
  40126c:	afa30014 	sw	v1,20(sp)
  401270:	0c1002e1 	jal	400b84 <__vprintf>
  401274:	afa00018 	sw	zero,24(sp)
  401278:	00401821 	move	v1,v0
  40127c:	8fa20018 	lw	v0,24(sp)
  401280:	00000000 	nop
  401284:	02021021 	addu	v0,s0,v0
  401288:	a0400000 	sb	zero,0(v0)
  40128c:	8fbf0024 	lw	ra,36(sp)
  401290:	8fb00020 	lw	s0,32(sp)
  401294:	00601021 	move	v0,v1
  401298:	03e00008 	jr	ra
  40129c:	27bd0028 	addiu	sp,sp,40

004012a0 <snprintf>:
  4012a0:	27bdffe0 	addiu	sp,sp,-32
  4012a4:	27a2002c 	addiu	v0,sp,44
  4012a8:	afa7002c 	sw	a3,44(sp)
  4012ac:	00403821 	move	a3,v0
  4012b0:	afbf0018 	sw	ra,24(sp)
  4012b4:	0c100485 	jal	401214 <vsnprintf>
  4012b8:	afa20010 	sw	v0,16(sp)
  4012bc:	8fbf0018 	lw	ra,24(sp)
  4012c0:	00000000 	nop
  4012c4:	03e00008 	jr	ra
  4012c8:	27bd0020 	addiu	sp,sp,32
  4012cc:	00000000 	nop

004012d0 <abort>:
  4012d0:	27bdffe8 	addiu	sp,sp,-24
  4012d4:	afbf0010 	sw	ra,16(sp)
  4012d8:	0c1000ef 	jal	4003bc <_exit>
  4012dc:	240400ff 	li	a0,255

004012e0 <shl>:
  4012e0:	18a00016 	blez	a1,40133c <shl+0x5c>
  4012e4:	24020010 	li	v0,16
  4012e8:	00464823 	subu	t1,v0,a2
  4012ec:	00803821 	move	a3,a0
  4012f0:	00004021 	move	t0,zero
  4012f4:	8ce20000 	lw	v0,0(a3)
  4012f8:	8ce30004 	lw	v1,4(a3)
  4012fc:	00c21004 	sllv	v0,v0,a2
  401300:	3042ffff 	andi	v0,v0,0xffff
  401304:	01231806 	srlv	v1,v1,t1
  401308:	00431025 	or	v0,v0,v1
  40130c:	25080001 	addiu	t0,t0,1
  401310:	ace20000 	sw	v0,0(a3)
  401314:	14a8fff7 	bne	a1,t0,4012f4 <shl+0x14>
  401318:	24e70004 	addiu	a3,a3,4
  40131c:	00051880 	sll	v1,a1,0x2
  401320:	00831821 	addu	v1,a0,v1
  401324:	8c620000 	lw	v0,0(v1)
  401328:	00000000 	nop
  40132c:	00c21004 	sllv	v0,v0,a2
  401330:	3042ffff 	andi	v0,v0,0xffff
  401334:	03e00008 	jr	ra
  401338:	ac620000 	sw	v0,0(v1)
  40133c:	00001821 	move	v1,zero
  401340:	00831821 	addu	v1,a0,v1
  401344:	8c620000 	lw	v0,0(v1)
  401348:	00000000 	nop
  40134c:	00c21004 	sllv	v0,v0,a2
  401350:	3042ffff 	andi	v0,v0,0xffff
  401354:	03e00008 	jr	ra
  401358:	ac620000 	sw	v0,0(v1)

0040135c <__qdivrem>:
  40135c:	27bdff80 	addiu	sp,sp,-128
  401360:	00c71025 	or	v0,a2,a3
  401364:	afb20060 	sw	s2,96(sp)
  401368:	afbf007c 	sw	ra,124(sp)
  40136c:	afbe0078 	sw	s8,120(sp)
  401370:	afb70074 	sw	s7,116(sp)
  401374:	afb60070 	sw	s6,112(sp)
  401378:	afb5006c 	sw	s5,108(sp)
  40137c:	afb40068 	sw	s4,104(sp)
  401380:	afb30064 	sw	s3,100(sp)
  401384:	afb1005c 	sw	s1,92(sp)
  401388:	afb00058 	sw	s0,88(sp)
  40138c:	00a04821 	move	t1,a1
  401390:	8fb20090 	lw	s2,144(sp)
  401394:	14400018 	bnez	v0,4013f8 <__qdivrem+0x9c>
  401398:	00804021 	move	t0,a0
  40139c:	3c031000 	lui	v1,0x1000
  4013a0:	8c640000 	lw	a0,0(v1)
  4013a4:	24020001 	li	v0,1
  4013a8:	14800002 	bnez	a0,4013b4 <__qdivrem+0x58>
  4013ac:	0044001b 	divu	zero,v0,a0
  4013b0:	0007000d 	break	0x7
  4013b4:	00001012 	mflo	v0
  4013b8:	12400003 	beqz	s2,4013c8 <__qdivrem+0x6c>
  4013bc:	00401821 	move	v1,v0
  4013c0:	ae450004 	sw	a1,4(s2)
  4013c4:	ae480000 	sw	t0,0(s2)
  4013c8:	8fbf007c 	lw	ra,124(sp)
  4013cc:	8fbe0078 	lw	s8,120(sp)
  4013d0:	8fb70074 	lw	s7,116(sp)
  4013d4:	8fb60070 	lw	s6,112(sp)
  4013d8:	8fb5006c 	lw	s5,108(sp)
  4013dc:	8fb40068 	lw	s4,104(sp)
  4013e0:	8fb30064 	lw	s3,100(sp)
  4013e4:	8fb20060 	lw	s2,96(sp)
  4013e8:	8fb1005c 	lw	s1,92(sp)
  4013ec:	8fb00058 	lw	s0,88(sp)
  4013f0:	03e00008 	jr	ra
  4013f4:	27bd0080 	addiu	sp,sp,128
  4013f8:	0086102b 	sltu	v0,a0,a2
  4013fc:	10400008 	beqz	v0,401420 <__qdivrem+0xc4>
  401400:	00000000 	nop
  401404:	1240010c 	beqz	s2,401838 <__qdivrem+0x4dc>
  401408:	00000000 	nop
  40140c:	00001821 	move	v1,zero
  401410:	00001021 	move	v0,zero
  401414:	ae490004 	sw	t1,4(s2)
  401418:	081004f2 	j	4013c8 <__qdivrem+0x6c>
  40141c:	ae480000 	sw	t0,0(s2)
  401420:	10860046 	beq	a0,a2,40153c <__qdivrem+0x1e0>
  401424:	00a7102b 	sltu	v0,a1,a3
  401428:	00e08821 	move	s1,a3
  40142c:	01001821 	move	v1,t0
  401430:	00c08021 	move	s0,a2
  401434:	30c7ffff 	andi	a3,a2,0xffff
  401438:	3108ffff 	andi	t0,t0,0xffff
  40143c:	312affff 	andi	t2,t1,0xffff
  401440:	3226ffff 	andi	a2,s1,0xffff
  401444:	00031c02 	srl	v1,v1,0x10
  401448:	00092c02 	srl	a1,t1,0x10
  40144c:	00101402 	srl	v0,s0,0x10
  401450:	00112402 	srl	a0,s1,0x10
  401454:	afa00010 	sw	zero,16(sp)
  401458:	afa30014 	sw	v1,20(sp)
  40145c:	afa80018 	sw	t0,24(sp)
  401460:	afa5001c 	sw	a1,28(sp)
  401464:	afaa0020 	sw	t2,32(sp)
  401468:	afa20028 	sw	v0,40(sp)
  40146c:	afa7002c 	sw	a3,44(sp)
  401470:	afa40030 	sw	a0,48(sp)
  401474:	144000f6 	bnez	v0,401850 <__qdivrem+0x4f4>
  401478:	afa60034 	sw	a2,52(sp)
  40147c:	14e00033 	bnez	a3,40154c <__qdivrem+0x1f0>
  401480:	27a20028 	addiu	v0,sp,40
  401484:	148000f7 	bnez	a0,401864 <__qdivrem+0x508>
  401488:	27a2002c 	addiu	v0,sp,44
  40148c:	14c00002 	bnez	a2,401498 <__qdivrem+0x13c>
  401490:	0066001b 	divu	zero,v1,a2
  401494:	0007000d 	break	0x7
  401498:	00001010 	mfhi	v0
  40149c:	00021400 	sll	v0,v0,0x10
  4014a0:	00481025 	or	v0,v0,t0
  4014a4:	00004812 	mflo	t1
	...
  4014b0:	14c00002 	bnez	a2,4014bc <__qdivrem+0x160>
  4014b4:	0046001b 	divu	zero,v0,a2
  4014b8:	0007000d 	break	0x7
  4014bc:	00001810 	mfhi	v1
  4014c0:	00031c00 	sll	v1,v1,0x10
  4014c4:	00651825 	or	v1,v1,a1
  4014c8:	00003812 	mflo	a3
	...
  4014d4:	14c00002 	bnez	a2,4014e0 <__qdivrem+0x184>
  4014d8:	0066001b 	divu	zero,v1,a2
  4014dc:	0007000d 	break	0x7
  4014e0:	00001010 	mfhi	v0
  4014e4:	00021400 	sll	v0,v0,0x10
  4014e8:	00001812 	mflo	v1
  4014ec:	12400008 	beqz	s2,401510 <__qdivrem+0x1b4>
  4014f0:	01422025 	or	a0,t2,v0
  4014f4:	14c00002 	bnez	a2,401500 <__qdivrem+0x1a4>
  4014f8:	0086001b 	divu	zero,a0,a2
  4014fc:	0007000d 	break	0x7
  401500:	ae400000 	sw	zero,0(s2)
  401504:	00001010 	mfhi	v0
  401508:	ae420004 	sw	v0,4(s2)
  40150c:	00000000 	nop
  401510:	14c00002 	bnez	a2,40151c <__qdivrem+0x1c0>
  401514:	0086001b 	divu	zero,a0,a2
  401518:	0007000d 	break	0x7
  40151c:	00091400 	sll	v0,t1,0x10
  401520:	00031c00 	sll	v1,v1,0x10
  401524:	00e28025 	or	s0,a3,v0
  401528:	02001021 	move	v0,s0
  40152c:	00002012 	mflo	a0
  401530:	00838825 	or	s1,a0,v1
  401534:	081004f2 	j	4013c8 <__qdivrem+0x6c>
  401538:	02201821 	move	v1,s1
  40153c:	1040ffbb 	beqz	v0,40142c <__qdivrem+0xd0>
  401540:	00e08821 	move	s1,a3
  401544:	08100501 	j	401404 <__qdivrem+0xa8>
  401548:	00000000 	nop
  40154c:	afa20050 	sw	v0,80(sp)
  401550:	24170003 	li	s7,3
  401554:	27be002c 	addiu	s8,sp,44
  401558:	8fa30014 	lw	v1,20(sp)
  40155c:	24020004 	li	v0,4
  401560:	146000c4 	bnez	v1,401874 <__qdivrem+0x518>
  401564:	00579823 	subu	s3,v0,s7
  401568:	0810055d 	j	401574 <__qdivrem+0x218>
  40156c:	27b40014 	addiu	s4,sp,20
  401570:	0060a021 	move	s4,v1
  401574:	8e820004 	lw	v0,4(s4)
  401578:	2673ffff 	addiu	s3,s3,-1
  40157c:	1040fffc 	beqz	v0,401570 <__qdivrem+0x214>
  401580:	26830004 	addiu	v1,s4,4
  401584:	24020004 	li	v0,4
  401588:	00532023 	subu	a0,v0,s3
  40158c:	2483ffff 	addiu	v1,a0,-1
  401590:	046000bc 	bltz	v1,401884 <__qdivrem+0x528>
  401594:	00001821 	move	v1,zero
  401598:	27a60038 	addiu	a2,sp,56
  40159c:	00042880 	sll	a1,a0,0x2
  4015a0:	00c51021 	addu	v0,a2,a1
  4015a4:	2442fffc 	addiu	v0,v0,-4
  4015a8:	24630001 	addiu	v1,v1,1
  4015ac:	ac400000 	sw	zero,0(v0)
  4015b0:	1464fffd 	bne	v1,a0,4015a8 <__qdivrem+0x24c>
  4015b4:	2442fffc 	addiu	v0,v0,-4
  4015b8:	8fcb0000 	lw	t3,0(s8)
  4015bc:	34028000 	li	v0,0x8000
  4015c0:	0162102b 	sltu	v0,t3,v0
  4015c4:	00c5b021 	addu	s6,a2,a1
  4015c8:	104000ac 	beqz	v0,40187c <__qdivrem+0x520>
  4015cc:	01601821 	move	v1,t3
  4015d0:	0000a821 	move	s5,zero
  4015d4:	34048000 	li	a0,0x8000
  4015d8:	00031840 	sll	v1,v1,0x1
  4015dc:	0064102b 	sltu	v0,v1,a0
  4015e0:	1440fffd 	bnez	v0,4015d8 <__qdivrem+0x27c>
  4015e4:	26b50001 	addiu	s5,s5,1
  4015e8:	1aa00009 	blez	s5,401610 <__qdivrem+0x2b4>
  4015ec:	02f32821 	addu	a1,s7,s3
  4015f0:	02a03021 	move	a2,s5
  4015f4:	0c1004b8 	jal	4012e0 <shl>
  4015f8:	02802021 	move	a0,s4
  4015fc:	03c02021 	move	a0,s8
  401600:	26e5ffff 	addiu	a1,s7,-1
  401604:	0c1004b8 	jal	4012e0 <shl>
  401608:	02a03021 	move	a2,s5
  40160c:	8fcb0000 	lw	t3,0(s8)
  401610:	8fa20050 	lw	v0,80(sp)
  401614:	00177080 	sll	t6,s7,0x2
  401618:	8c580008 	lw	t8,8(v0)
  40161c:	02c06821 	move	t5,s6
  401620:	02804821 	move	t1,s4
  401624:	028e6021 	addu	t4,s4,t6
  401628:	00007821 	move	t7,zero
  40162c:	3416ffff 	li	s6,0xffff
  401630:	8d240000 	lw	a0,0(t1)
  401634:	8d230004 	lw	v1,4(t1)
  401638:	8d260008 	lw	a2,8(t1)
  40163c:	11640081 	beq	t3,a0,401844 <__qdivrem+0x4e8>
  401640:	00041400 	sll	v0,a0,0x10
  401644:	00621025 	or	v0,v1,v0
  401648:	15600002 	bnez	t3,401654 <__qdivrem+0x2f8>
  40164c:	004b001b 	divu	zero,v0,t3
  401650:	0007000d 	break	0x7
  401654:	00002810 	mfhi	a1
  401658:	00003812 	mflo	a3
	...
  401664:	00f80018 	mult	a3,t8
  401668:	00051400 	sll	v0,a1,0x10
  40166c:	00c21025 	or	v0,a2,v0
  401670:	00001812 	mflo	v1
  401674:	0043182b 	sltu	v1,v0,v1
  401678:	10600006 	beqz	v1,401694 <__qdivrem+0x338>
  40167c:	00000000 	nop
  401680:	24e7ffff 	addiu	a3,a3,-1
  401684:	00ab2821 	addu	a1,a1,t3
  401688:	02c5102b 	sltu	v0,s6,a1
  40168c:	1040fff6 	beqz	v0,401668 <__qdivrem+0x30c>
  401690:	00f80018 	mult	a3,t8
  401694:	1ae00017 	blez	s7,4016f4 <__qdivrem+0x398>
  401698:	00004021 	move	t0,zero
  40169c:	8fa20050 	lw	v0,80(sp)
  4016a0:	01802021 	move	a0,t4
  4016a4:	004e3021 	addu	a2,v0,t6
  4016a8:	02e02821 	move	a1,s7
  4016ac:	3c0a0001 	lui	t2,0x1
  4016b0:	8cc20000 	lw	v0,0(a2)
  4016b4:	8c830000 	lw	v1,0(a0)
  4016b8:	00e20018 	mult	a3,v0
  4016bc:	24a5ffff 	addiu	a1,a1,-1
  4016c0:	24c6fffc 	addiu	a2,a2,-4
  4016c4:	00001012 	mflo	v0
  4016c8:	00621823 	subu	v1,v1,v0
  4016cc:	00681823 	subu	v1,v1,t0
  4016d0:	00031402 	srl	v0,v1,0x10
  4016d4:	01421023 	subu	v0,t2,v0
  4016d8:	3063ffff 	andi	v1,v1,0xffff
  4016dc:	ac830000 	sw	v1,0(a0)
  4016e0:	3048ffff 	andi	t0,v0,0xffff
  4016e4:	14a0fff2 	bnez	a1,4016b0 <__qdivrem+0x354>
  4016e8:	2484fffc 	addiu	a0,a0,-4
  4016ec:	8d240000 	lw	a0,0(t1)
  4016f0:	00000000 	nop
  4016f4:	00881023 	subu	v0,a0,t0
  4016f8:	3044ffff 	andi	a0,v0,0xffff
  4016fc:	00021c02 	srl	v1,v0,0x10
  401700:	10600018 	beqz	v1,401764 <__qdivrem+0x408>
  401704:	ad240000 	sw	a0,0(t1)
  401708:	1ae00012 	blez	s7,401754 <__qdivrem+0x3f8>
  40170c:	00004021 	move	t0,zero
  401710:	8fa20050 	lw	v0,80(sp)
  401714:	01802021 	move	a0,t4
  401718:	004e3021 	addu	a2,v0,t6
  40171c:	02e02821 	move	a1,s7
  401720:	8c820000 	lw	v0,0(a0)
  401724:	8cc30000 	lw	v1,0(a2)
  401728:	01021021 	addu	v0,t0,v0
  40172c:	00431021 	addu	v0,v0,v1
  401730:	3043ffff 	andi	v1,v0,0xffff
  401734:	24a5ffff 	addiu	a1,a1,-1
  401738:	ac830000 	sw	v1,0(a0)
  40173c:	00024402 	srl	t0,v0,0x10
  401740:	2484fffc 	addiu	a0,a0,-4
  401744:	14a0fff6 	bnez	a1,401720 <__qdivrem+0x3c4>
  401748:	24c6fffc 	addiu	a2,a2,-4
  40174c:	8d240000 	lw	a0,0(t1)
  401750:	00000000 	nop
  401754:	01041021 	addu	v0,t0,a0
  401758:	3042ffff 	andi	v0,v0,0xffff
  40175c:	ad220000 	sw	v0,0(t1)
  401760:	24e7ffff 	addiu	a3,a3,-1
  401764:	25ef0001 	addiu	t7,t7,1
  401768:	026f102a 	slt	v0,s3,t7
  40176c:	ada70000 	sw	a3,0(t5)
  401770:	25290004 	addiu	t1,t1,4
  401774:	25ad0004 	addiu	t5,t5,4
  401778:	1040ffad 	beqz	v0,401630 <__qdivrem+0x2d4>
  40177c:	258c0004 	addiu	t4,t4,4
  401780:	12400022 	beqz	s2,40180c <__qdivrem+0x4b0>
  401784:	00000000 	nop
  401788:	12a00016 	beqz	s5,4017e4 <__qdivrem+0x488>
  40178c:	02f32821 	addu	a1,s7,s3
  401790:	0265102a 	slt	v0,s3,a1
  401794:	10400011 	beqz	v0,4017dc <__qdivrem+0x480>
  401798:	00051080 	sll	v0,a1,0x2
  40179c:	00051880 	sll	v1,a1,0x2
  4017a0:	24020010 	li	v0,16
  4017a4:	00553823 	subu	a3,v0,s5
  4017a8:	02833021 	addu	a2,s4,v1
  4017ac:	8cc2fffc 	lw	v0,-4(a2)
  4017b0:	8cc30000 	lw	v1,0(a2)
  4017b4:	00e21004 	sllv	v0,v0,a3
  4017b8:	02a31806 	srlv	v1,v1,s5
  4017bc:	3042ffff 	andi	v0,v0,0xffff
  4017c0:	24a5ffff 	addiu	a1,a1,-1
  4017c4:	00621825 	or	v1,v1,v0
  4017c8:	0265202a 	slt	a0,s3,a1
  4017cc:	acc30000 	sw	v1,0(a2)
  4017d0:	1480fff6 	bnez	a0,4017ac <__qdivrem+0x450>
  4017d4:	24c6fffc 	addiu	a2,a2,-4
  4017d8:	00051080 	sll	v0,a1,0x2
  4017dc:	00541021 	addu	v0,v0,s4
  4017e0:	ac400000 	sw	zero,0(v0)
  4017e4:	8fa20014 	lw	v0,20(sp)
  4017e8:	8fa40018 	lw	a0,24(sp)
  4017ec:	00021400 	sll	v0,v0,0x10
  4017f0:	8fa3001c 	lw	v1,28(sp)
  4017f4:	00448025 	or	s0,v0,a0
  4017f8:	8fa20020 	lw	v0,32(sp)
  4017fc:	00031c00 	sll	v1,v1,0x10
  401800:	00628825 	or	s1,v1,v0
  401804:	ae510004 	sw	s1,4(s2)
  401808:	ae500000 	sw	s0,0(s2)
  40180c:	8fa2003c 	lw	v0,60(sp)
  401810:	8fa40040 	lw	a0,64(sp)
  401814:	00021400 	sll	v0,v0,0x10
  401818:	8fa30044 	lw	v1,68(sp)
  40181c:	00448025 	or	s0,v0,a0
  401820:	8fa20048 	lw	v0,72(sp)
  401824:	00031c00 	sll	v1,v1,0x10
  401828:	00628825 	or	s1,v1,v0
  40182c:	02201821 	move	v1,s1
  401830:	081004f2 	j	4013c8 <__qdivrem+0x6c>
  401834:	02001021 	move	v0,s0
  401838:	00001821 	move	v1,zero
  40183c:	081004f2 	j	4013c8 <__qdivrem+0x6c>
  401840:	00001021 	move	v0,zero
  401844:	00602821 	move	a1,v1
  401848:	081005a1 	j	401684 <__qdivrem+0x328>
  40184c:	3407ffff 	li	a3,0xffff
  401850:	27a20024 	addiu	v0,sp,36
  401854:	24170004 	li	s7,4
  401858:	27be0028 	addiu	s8,sp,40
  40185c:	08100556 	j	401558 <__qdivrem+0x1fc>
  401860:	afa20050 	sw	v0,80(sp)
  401864:	24170002 	li	s7,2
  401868:	27be0030 	addiu	s8,sp,48
  40186c:	08100556 	j	401558 <__qdivrem+0x1fc>
  401870:	afa20050 	sw	v0,80(sp)
  401874:	08100561 	j	401584 <__qdivrem+0x228>
  401878:	27b40010 	addiu	s4,sp,16
  40187c:	08100584 	j	401610 <__qdivrem+0x2b4>
  401880:	0000a821 	move	s5,zero
  401884:	00042880 	sll	a1,a0,0x2
  401888:	0810056e 	j	4015b8 <__qdivrem+0x25c>
  40188c:	27a60038 	addiu	a2,sp,56
