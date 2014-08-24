
../../../build/user/uw-testbin/vm-data1/vm-data1:     file format elf32-tradbigmips

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
  400028:	0c100091 	jal	400244 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1000a7 	jal	40029c <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <main>:
  400050:	27bdffe8 	addiu	sp,sp,-24
  400054:	afbf0010 	sw	ra,16(sp)
  400058:	00002821 	move	a1,zero
  40005c:	3c061000 	lui	a2,0x1000
  400060:	00001821 	move	v1,zero
  400064:	24c40020 	addiu	a0,a2,32
  400068:	ac830000 	sw	v1,0(a0)
  40006c:	3c020002 	lui	v0,0x2
  400070:	24630001 	addiu	v1,v1,1
  400074:	1462fffc 	bne	v1,v0,400068 <main+0x18>
  400078:	24840004 	addiu	a0,a0,4
  40007c:	24a50001 	addiu	a1,a1,1
  400080:	24020004 	li	v0,4
  400084:	14a2fff6 	bne	a1,v0,400060 <main+0x10>
  400088:	3c021000 	lui	v0,0x1000
  40008c:	24430020 	addiu	v1,v0,32
  400090:	00002821 	move	a1,zero
  400094:	0810002a 	j	4000a8 <main+0x58>
  400098:	3c040002 	lui	a0,0x2
  40009c:	00a4102b 	sltu	v0,a1,a0
  4000a0:	1040000c 	beqz	v0,4000d4 <main+0x84>
  4000a4:	24630004 	addiu	v1,v1,4
  4000a8:	8c660000 	lw	a2,0(v1)
  4000ac:	00000000 	nop
  4000b0:	10c5fffa 	beq	a2,a1,40009c <main+0x4c>
  4000b4:	24a50001 	addiu	a1,a1,1
  4000b8:	24a5ffff 	addiu	a1,a1,-1
  4000bc:	3c040040 	lui	a0,0x40
  4000c0:	24841640 	addiu	a0,a0,5696
  4000c4:	0c100057 	jal	40015c <printf>
  4000c8:	00a03821 	move	a3,a1
  4000cc:	0c100091 	jal	400244 <exit>
  4000d0:	24040001 	li	a0,1
  4000d4:	3c040040 	lui	a0,0x40
  4000d8:	0c10007c 	jal	4001f0 <puts>
  4000dc:	24841660 	addiu	a0,a0,5728
  4000e0:	0c100091 	jal	400244 <exit>
  4000e4:	00002021 	move	a0,zero
	...

004000f0 <vprintf>:
  4000f0:	00803021 	move	a2,a0
  4000f4:	3c040040 	lui	a0,0x40
  4000f8:	00a03821 	move	a3,a1
  4000fc:	24840108 	addiu	a0,a0,264
  400100:	0810020d 	j	400834 <__vprintf>
  400104:	00002821 	move	a1,zero

00400108 <__printf_send>:
  400108:	27bdffe0 	addiu	sp,sp,-32
  40010c:	afb20018 	sw	s2,24(sp)
  400110:	afb10014 	sw	s1,20(sp)
  400114:	afbf001c 	sw	ra,28(sp)
  400118:	afb00010 	sw	s0,16(sp)
  40011c:	00c09021 	move	s2,a2
  400120:	10c00008 	beqz	a2,400144 <__printf_send+0x3c>
  400124:	00a08821 	move	s1,a1
  400128:	00008021 	move	s0,zero
  40012c:	02301021 	addu	v0,s1,s0
  400130:	80440000 	lb	a0,0(v0)
  400134:	0c100064 	jal	400190 <putchar>
  400138:	26100001 	addiu	s0,s0,1
  40013c:	1650fffc 	bne	s2,s0,400130 <__printf_send+0x28>
  400140:	02301021 	addu	v0,s1,s0
  400144:	8fbf001c 	lw	ra,28(sp)
  400148:	8fb20018 	lw	s2,24(sp)
  40014c:	8fb10014 	lw	s1,20(sp)
  400150:	8fb00010 	lw	s0,16(sp)
  400154:	03e00008 	jr	ra
  400158:	27bd0020 	addiu	sp,sp,32

0040015c <printf>:
  40015c:	27bdffe0 	addiu	sp,sp,-32
  400160:	27a20024 	addiu	v0,sp,36
  400164:	afa50024 	sw	a1,36(sp)
  400168:	00402821 	move	a1,v0
  40016c:	afbf0018 	sw	ra,24(sp)
  400170:	afa60028 	sw	a2,40(sp)
  400174:	afa7002c 	sw	a3,44(sp)
  400178:	0c10003c 	jal	4000f0 <vprintf>
  40017c:	afa20010 	sw	v0,16(sp)
  400180:	8fbf0018 	lw	ra,24(sp)
  400184:	00000000 	nop
  400188:	03e00008 	jr	ra
  40018c:	27bd0020 	addiu	sp,sp,32

00400190 <putchar>:
  400190:	27bdffe0 	addiu	sp,sp,-32
  400194:	afb00018 	sw	s0,24(sp)
  400198:	27a50010 	addiu	a1,sp,16
  40019c:	00808021 	move	s0,a0
  4001a0:	24060001 	li	a2,1
  4001a4:	24040001 	li	a0,1
  4001a8:	afbf001c 	sw	ra,28(sp)
  4001ac:	0c1000e7 	jal	40039c <write>
  4001b0:	a3b00010 	sb	s0,16(sp)
  4001b4:	18400005 	blez	v0,4001cc <putchar+0x3c>
  4001b8:	02001021 	move	v0,s0
  4001bc:	8fbf001c 	lw	ra,28(sp)
  4001c0:	8fb00018 	lw	s0,24(sp)
  4001c4:	03e00008 	jr	ra
  4001c8:	27bd0020 	addiu	sp,sp,32
  4001cc:	2410ffff 	li	s0,-1
  4001d0:	02001021 	move	v0,s0
  4001d4:	8fbf001c 	lw	ra,28(sp)
  4001d8:	8fb00018 	lw	s0,24(sp)
  4001dc:	03e00008 	jr	ra
  4001e0:	27bd0020 	addiu	sp,sp,32
	...

004001f0 <puts>:
  4001f0:	27bdffe8 	addiu	sp,sp,-24
  4001f4:	afbf0010 	sw	ra,16(sp)
  4001f8:	0c100358 	jal	400d60 <__puts>
  4001fc:	00000000 	nop
  400200:	0c100064 	jal	400190 <putchar>
  400204:	2404000a 	li	a0,10
  400208:	8fbf0010 	lw	ra,16(sp)
  40020c:	00001021 	move	v0,zero
  400210:	03e00008 	jr	ra
  400214:	27bd0018 	addiu	sp,sp,24
	...

00400220 <__exit_hack>:
  400220:	27bdfff8 	addiu	sp,sp,-8
  400224:	24020001 	li	v0,1
  400228:	afa20000 	sw	v0,0(sp)
  40022c:	8fa20000 	lw	v0,0(sp)
  400230:	00000000 	nop
  400234:	1440fffd 	bnez	v0,40022c <__exit_hack+0xc>
  400238:	00000000 	nop
  40023c:	03e00008 	jr	ra
  400240:	27bd0008 	addiu	sp,sp,8

00400244 <exit>:
  400244:	27bdffe8 	addiu	sp,sp,-24
  400248:	afbf0010 	sw	ra,16(sp)
  40024c:	0c1000a7 	jal	40029c <_exit>
  400250:	00000000 	nop
	...

00400260 <__syscall>:
  400260:	0000000c 	syscall
  400264:	10e00005 	beqz	a3,40027c <__syscall+0x1c>
  400268:	00000000 	nop
  40026c:	3c011000 	lui	at,0x1000
  400270:	ac220010 	sw	v0,16(at)
  400274:	2403ffff 	li	v1,-1
  400278:	2402ffff 	li	v0,-1
  40027c:	03e00008 	jr	ra
  400280:	00000000 	nop

00400284 <fork>:
  400284:	08100098 	j	400260 <__syscall>
  400288:	24020000 	li	v0,0

0040028c <vfork>:
  40028c:	08100098 	j	400260 <__syscall>
  400290:	24020001 	li	v0,1

00400294 <execv>:
  400294:	08100098 	j	400260 <__syscall>
  400298:	24020002 	li	v0,2

0040029c <_exit>:
  40029c:	08100098 	j	400260 <__syscall>
  4002a0:	24020003 	li	v0,3

004002a4 <waitpid>:
  4002a4:	08100098 	j	400260 <__syscall>
  4002a8:	24020004 	li	v0,4

004002ac <getpid>:
  4002ac:	08100098 	j	400260 <__syscall>
  4002b0:	24020005 	li	v0,5

004002b4 <getppid>:
  4002b4:	08100098 	j	400260 <__syscall>
  4002b8:	24020006 	li	v0,6

004002bc <sbrk>:
  4002bc:	08100098 	j	400260 <__syscall>
  4002c0:	24020007 	li	v0,7

004002c4 <mmap>:
  4002c4:	08100098 	j	400260 <__syscall>
  4002c8:	24020008 	li	v0,8

004002cc <munmap>:
  4002cc:	08100098 	j	400260 <__syscall>
  4002d0:	24020009 	li	v0,9

004002d4 <mprotect>:
  4002d4:	08100098 	j	400260 <__syscall>
  4002d8:	2402000a 	li	v0,10

004002dc <umask>:
  4002dc:	08100098 	j	400260 <__syscall>
  4002e0:	24020011 	li	v0,17

004002e4 <issetugid>:
  4002e4:	08100098 	j	400260 <__syscall>
  4002e8:	24020012 	li	v0,18

004002ec <getresuid>:
  4002ec:	08100098 	j	400260 <__syscall>
  4002f0:	24020013 	li	v0,19

004002f4 <setresuid>:
  4002f4:	08100098 	j	400260 <__syscall>
  4002f8:	24020014 	li	v0,20

004002fc <getresgid>:
  4002fc:	08100098 	j	400260 <__syscall>
  400300:	24020015 	li	v0,21

00400304 <setresgid>:
  400304:	08100098 	j	400260 <__syscall>
  400308:	24020016 	li	v0,22

0040030c <getgroups>:
  40030c:	08100098 	j	400260 <__syscall>
  400310:	24020017 	li	v0,23

00400314 <setgroups>:
  400314:	08100098 	j	400260 <__syscall>
  400318:	24020018 	li	v0,24

0040031c <__getlogin>:
  40031c:	08100098 	j	400260 <__syscall>
  400320:	24020019 	li	v0,25

00400324 <__setlogin>:
  400324:	08100098 	j	400260 <__syscall>
  400328:	2402001a 	li	v0,26

0040032c <kill>:
  40032c:	08100098 	j	400260 <__syscall>
  400330:	2402001b 	li	v0,27

00400334 <sigaction>:
  400334:	08100098 	j	400260 <__syscall>
  400338:	2402001c 	li	v0,28

0040033c <sigpending>:
  40033c:	08100098 	j	400260 <__syscall>
  400340:	2402001d 	li	v0,29

00400344 <sigprocmask>:
  400344:	08100098 	j	400260 <__syscall>
  400348:	2402001e 	li	v0,30

0040034c <sigsuspend>:
  40034c:	08100098 	j	400260 <__syscall>
  400350:	2402001f 	li	v0,31

00400354 <sigreturn>:
  400354:	08100098 	j	400260 <__syscall>
  400358:	24020020 	li	v0,32

0040035c <open>:
  40035c:	08100098 	j	400260 <__syscall>
  400360:	2402002d 	li	v0,45

00400364 <pipe>:
  400364:	08100098 	j	400260 <__syscall>
  400368:	2402002e 	li	v0,46

0040036c <dup>:
  40036c:	08100098 	j	400260 <__syscall>
  400370:	2402002f 	li	v0,47

00400374 <dup2>:
  400374:	08100098 	j	400260 <__syscall>
  400378:	24020030 	li	v0,48

0040037c <close>:
  40037c:	08100098 	j	400260 <__syscall>
  400380:	24020031 	li	v0,49

00400384 <read>:
  400384:	08100098 	j	400260 <__syscall>
  400388:	24020032 	li	v0,50

0040038c <pread>:
  40038c:	08100098 	j	400260 <__syscall>
  400390:	24020033 	li	v0,51

00400394 <getdirentry>:
  400394:	08100098 	j	400260 <__syscall>
  400398:	24020036 	li	v0,54

0040039c <write>:
  40039c:	08100098 	j	400260 <__syscall>
  4003a0:	24020037 	li	v0,55

004003a4 <pwrite>:
  4003a4:	08100098 	j	400260 <__syscall>
  4003a8:	24020038 	li	v0,56

004003ac <lseek>:
  4003ac:	08100098 	j	400260 <__syscall>
  4003b0:	2402003b 	li	v0,59

004003b4 <flock>:
  4003b4:	08100098 	j	400260 <__syscall>
  4003b8:	2402003c 	li	v0,60

004003bc <ftruncate>:
  4003bc:	08100098 	j	400260 <__syscall>
  4003c0:	2402003d 	li	v0,61

004003c4 <fsync>:
  4003c4:	08100098 	j	400260 <__syscall>
  4003c8:	2402003e 	li	v0,62

004003cc <fcntl>:
  4003cc:	08100098 	j	400260 <__syscall>
  4003d0:	2402003f 	li	v0,63

004003d4 <ioctl>:
  4003d4:	08100098 	j	400260 <__syscall>
  4003d8:	24020040 	li	v0,64

004003dc <select>:
  4003dc:	08100098 	j	400260 <__syscall>
  4003e0:	24020041 	li	v0,65

004003e4 <poll>:
  4003e4:	08100098 	j	400260 <__syscall>
  4003e8:	24020042 	li	v0,66

004003ec <link>:
  4003ec:	08100098 	j	400260 <__syscall>
  4003f0:	24020043 	li	v0,67

004003f4 <remove>:
  4003f4:	08100098 	j	400260 <__syscall>
  4003f8:	24020044 	li	v0,68

004003fc <mkdir>:
  4003fc:	08100098 	j	400260 <__syscall>
  400400:	24020045 	li	v0,69

00400404 <rmdir>:
  400404:	08100098 	j	400260 <__syscall>
  400408:	24020046 	li	v0,70

0040040c <mkfifo>:
  40040c:	08100098 	j	400260 <__syscall>
  400410:	24020047 	li	v0,71

00400414 <rename>:
  400414:	08100098 	j	400260 <__syscall>
  400418:	24020048 	li	v0,72

0040041c <access>:
  40041c:	08100098 	j	400260 <__syscall>
  400420:	24020049 	li	v0,73

00400424 <chdir>:
  400424:	08100098 	j	400260 <__syscall>
  400428:	2402004a 	li	v0,74

0040042c <fchdir>:
  40042c:	08100098 	j	400260 <__syscall>
  400430:	2402004b 	li	v0,75

00400434 <__getcwd>:
  400434:	08100098 	j	400260 <__syscall>
  400438:	2402004c 	li	v0,76

0040043c <symlink>:
  40043c:	08100098 	j	400260 <__syscall>
  400440:	2402004d 	li	v0,77

00400444 <readlink>:
  400444:	08100098 	j	400260 <__syscall>
  400448:	2402004e 	li	v0,78

0040044c <mount>:
  40044c:	08100098 	j	400260 <__syscall>
  400450:	2402004f 	li	v0,79

00400454 <unmount>:
  400454:	08100098 	j	400260 <__syscall>
  400458:	24020050 	li	v0,80

0040045c <stat>:
  40045c:	08100098 	j	400260 <__syscall>
  400460:	24020051 	li	v0,81

00400464 <fstat>:
  400464:	08100098 	j	400260 <__syscall>
  400468:	24020052 	li	v0,82

0040046c <lstat>:
  40046c:	08100098 	j	400260 <__syscall>
  400470:	24020053 	li	v0,83

00400474 <utimes>:
  400474:	08100098 	j	400260 <__syscall>
  400478:	24020054 	li	v0,84

0040047c <futimes>:
  40047c:	08100098 	j	400260 <__syscall>
  400480:	24020055 	li	v0,85

00400484 <lutimes>:
  400484:	08100098 	j	400260 <__syscall>
  400488:	24020056 	li	v0,86

0040048c <chmod>:
  40048c:	08100098 	j	400260 <__syscall>
  400490:	24020057 	li	v0,87

00400494 <chown>:
  400494:	08100098 	j	400260 <__syscall>
  400498:	24020058 	li	v0,88

0040049c <fchmod>:
  40049c:	08100098 	j	400260 <__syscall>
  4004a0:	24020059 	li	v0,89

004004a4 <fchown>:
  4004a4:	08100098 	j	400260 <__syscall>
  4004a8:	2402005a 	li	v0,90

004004ac <lchmod>:
  4004ac:	08100098 	j	400260 <__syscall>
  4004b0:	2402005b 	li	v0,91

004004b4 <lchown>:
  4004b4:	08100098 	j	400260 <__syscall>
  4004b8:	2402005c 	li	v0,92

004004bc <socket>:
  4004bc:	08100098 	j	400260 <__syscall>
  4004c0:	24020062 	li	v0,98

004004c4 <bind>:
  4004c4:	08100098 	j	400260 <__syscall>
  4004c8:	24020063 	li	v0,99

004004cc <connect>:
  4004cc:	08100098 	j	400260 <__syscall>
  4004d0:	24020064 	li	v0,100

004004d4 <listen>:
  4004d4:	08100098 	j	400260 <__syscall>
  4004d8:	24020065 	li	v0,101

004004dc <accept>:
  4004dc:	08100098 	j	400260 <__syscall>
  4004e0:	24020066 	li	v0,102

004004e4 <shutdown>:
  4004e4:	08100098 	j	400260 <__syscall>
  4004e8:	24020068 	li	v0,104

004004ec <getsockname>:
  4004ec:	08100098 	j	400260 <__syscall>
  4004f0:	24020069 	li	v0,105

004004f4 <getpeername>:
  4004f4:	08100098 	j	400260 <__syscall>
  4004f8:	2402006a 	li	v0,106

004004fc <getsockopt>:
  4004fc:	08100098 	j	400260 <__syscall>
  400500:	2402006b 	li	v0,107

00400504 <setsockopt>:
  400504:	08100098 	j	400260 <__syscall>
  400508:	2402006c 	li	v0,108

0040050c <__time>:
  40050c:	08100098 	j	400260 <__syscall>
  400510:	24020071 	li	v0,113

00400514 <__settime>:
  400514:	08100098 	j	400260 <__syscall>
  400518:	24020072 	li	v0,114

0040051c <nanosleep>:
  40051c:	08100098 	j	400260 <__syscall>
  400520:	24020073 	li	v0,115

00400524 <sync>:
  400524:	08100098 	j	400260 <__syscall>
  400528:	24020076 	li	v0,118

0040052c <reboot>:
  40052c:	08100098 	j	400260 <__syscall>
  400530:	24020077 	li	v0,119
	...

00400540 <__pf_print>:
  400540:	27bdffe0 	addiu	sp,sp,-32
  400544:	afbf0018 	sw	ra,24(sp)
  400548:	afb10014 	sw	s1,20(sp)
  40054c:	afb00010 	sw	s0,16(sp)
  400550:	8c830000 	lw	v1,0(a0)
  400554:	00808021 	move	s0,a0
  400558:	8c840004 	lw	a0,4(a0)
  40055c:	0060f809 	jalr	v1
  400560:	00c08821 	move	s1,a2
  400564:	8e02000c 	lw	v0,12(s0)
  400568:	00000000 	nop
  40056c:	00511021 	addu	v0,v0,s1
  400570:	ae02000c 	sw	v0,12(s0)
  400574:	8fbf0018 	lw	ra,24(sp)
  400578:	8fb10014 	lw	s1,20(sp)
  40057c:	8fb00010 	lw	s0,16(sp)
  400580:	03e00008 	jr	ra
  400584:	27bd0020 	addiu	sp,sp,32

00400588 <__pf_endfield>:
  400588:	24020020 	li	v0,32
  40058c:	ac82002c 	sw	v0,44(a0)
  400590:	00001821 	move	v1,zero
  400594:	00001021 	move	v0,zero
  400598:	ac800038 	sw	zero,56(a0)
  40059c:	ac800010 	sw	zero,16(a0)
  4005a0:	ac800014 	sw	zero,20(a0)
  4005a4:	ac83001c 	sw	v1,28(a0)
  4005a8:	ac820018 	sw	v0,24(a0)
  4005ac:	ac800020 	sw	zero,32(a0)
  4005b0:	ac800024 	sw	zero,36(a0)
  4005b4:	ac800028 	sw	zero,40(a0)
  4005b8:	ac800030 	sw	zero,48(a0)
  4005bc:	03e00008 	jr	ra
  4005c0:	ac800034 	sw	zero,52(a0)

004005c4 <__pf_fill>:
  4005c4:	27bdffd0 	addiu	sp,sp,-48
  4005c8:	afb30024 	sw	s3,36(sp)
  4005cc:	afb20020 	sw	s2,32(sp)
  4005d0:	afbf0028 	sw	ra,40(sp)
  4005d4:	afb1001c 	sw	s1,28(sp)
  4005d8:	afb00018 	sw	s0,24(sp)
  4005dc:	00809821 	move	s3,a0
  4005e0:	8c82002c 	lw	v0,44(a0)
  4005e4:	18a0000b 	blez	a1,400614 <__pf_fill+0x50>
  4005e8:	00a09021 	move	s2,a1
  4005ec:	a3a20010 	sb	v0,16(sp)
  4005f0:	00008021 	move	s0,zero
  4005f4:	27b10010 	addiu	s1,sp,16
  4005f8:	26100001 	addiu	s0,s0,1
  4005fc:	02602021 	move	a0,s3
  400600:	02202821 	move	a1,s1
  400604:	0c100150 	jal	400540 <__pf_print>
  400608:	24060001 	li	a2,1
  40060c:	1650fffb 	bne	s2,s0,4005fc <__pf_fill+0x38>
  400610:	26100001 	addiu	s0,s0,1
  400614:	8fbf0028 	lw	ra,40(sp)
  400618:	8fb30024 	lw	s3,36(sp)
  40061c:	8fb20020 	lw	s2,32(sp)
  400620:	8fb1001c 	lw	s1,28(sp)
  400624:	8fb00018 	lw	s0,24(sp)
  400628:	03e00008 	jr	ra
  40062c:	27bd0030 	addiu	sp,sp,48

00400630 <__pf_printstuff>:
  400630:	27bdffd0 	addiu	sp,sp,-48
  400634:	afbf0028 	sw	ra,40(sp)
  400638:	afb50024 	sw	s5,36(sp)
  40063c:	afb40020 	sw	s4,32(sp)
  400640:	afb3001c 	sw	s3,28(sp)
  400644:	afb20018 	sw	s2,24(sp)
  400648:	00c09821 	move	s3,a2
  40064c:	afb10014 	sw	s1,20(sp)
  400650:	afb00010 	sw	s0,16(sp)
  400654:	00808821 	move	s1,a0
  400658:	00a02021 	move	a0,a1
  40065c:	00a0a021 	move	s4,a1
  400660:	0c10038c 	jal	400e30 <strlen>
  400664:	00e0a821 	move	s5,a3
  400668:	02602021 	move	a0,s3
  40066c:	0c10038c 	jal	400e30 <strlen>
  400670:	00409021 	move	s2,v0
  400674:	02a02021 	move	a0,s5
  400678:	0c10038c 	jal	400e30 <strlen>
  40067c:	02428021 	addu	s0,s2,v0
  400680:	8e230024 	lw	v1,36(s1)
  400684:	02022821 	addu	a1,s0,v0
  400688:	00a3102a 	slt	v0,a1,v1
  40068c:	10400040 	beqz	v0,400790 <__pf_printstuff+0x160>
  400690:	00658023 	subu	s0,v1,a1
  400694:	1a000056 	blez	s0,4007f0 <__pf_printstuff+0x1c0>
  400698:	02403021 	move	a2,s2
  40069c:	8e220028 	lw	v0,40(s1)
  4006a0:	00000000 	nop
  4006a4:	10400028 	beqz	v0,400748 <__pf_printstuff+0x118>
  4006a8:	24020030 	li	v0,48
  4006ac:	0c10038c 	jal	400e30 <strlen>
  4006b0:	02802021 	move	a0,s4
  4006b4:	00403021 	move	a2,v0
  4006b8:	02802821 	move	a1,s4
  4006bc:	0c100150 	jal	400540 <__pf_print>
  4006c0:	02202021 	move	a0,s1
  4006c4:	0c10038c 	jal	400e30 <strlen>
  4006c8:	02602021 	move	a0,s3
  4006cc:	00403021 	move	a2,v0
  4006d0:	02202021 	move	a0,s1
  4006d4:	0c100150 	jal	400540 <__pf_print>
  4006d8:	02602821 	move	a1,s3
  4006dc:	8e220028 	lw	v0,40(s1)
  4006e0:	00000000 	nop
  4006e4:	14400005 	bnez	v0,4006fc <__pf_printstuff+0xcc>
  4006e8:	24020030 	li	v0,48
  4006ec:	8e23002c 	lw	v1,44(s1)
  4006f0:	00000000 	nop
  4006f4:	1062004b 	beq	v1,v0,400824 <__pf_printstuff+0x1f4>
  4006f8:	02202021 	move	a0,s1
  4006fc:	0c10038c 	jal	400e30 <strlen>
  400700:	02a02021 	move	a0,s5
  400704:	00403021 	move	a2,v0
  400708:	02202021 	move	a0,s1
  40070c:	0c100150 	jal	400540 <__pf_print>
  400710:	02a02821 	move	a1,s5
  400714:	8e220028 	lw	v0,40(s1)
  400718:	00000000 	nop
  40071c:	14400012 	bnez	v0,400768 <__pf_printstuff+0x138>
  400720:	02202021 	move	a0,s1
  400724:	8fbf0028 	lw	ra,40(sp)
  400728:	8fb50024 	lw	s5,36(sp)
  40072c:	8fb40020 	lw	s4,32(sp)
  400730:	8fb3001c 	lw	s3,28(sp)
  400734:	8fb20018 	lw	s2,24(sp)
  400738:	8fb10014 	lw	s1,20(sp)
  40073c:	8fb00010 	lw	s0,16(sp)
  400740:	03e00008 	jr	ra
  400744:	27bd0030 	addiu	sp,sp,48
  400748:	8e23002c 	lw	v1,44(s1)
  40074c:	00000000 	nop
  400750:	1062ffd6 	beq	v1,v0,4006ac <__pf_printstuff+0x7c>
  400754:	02202021 	move	a0,s1
  400758:	0c100171 	jal	4005c4 <__pf_fill>
  40075c:	02002821 	move	a1,s0
  400760:	081001ab 	j	4006ac <__pf_printstuff+0x7c>
  400764:	00000000 	nop
  400768:	02002821 	move	a1,s0
  40076c:	8fbf0028 	lw	ra,40(sp)
  400770:	8fb50024 	lw	s5,36(sp)
  400774:	8fb40020 	lw	s4,32(sp)
  400778:	8fb3001c 	lw	s3,28(sp)
  40077c:	8fb20018 	lw	s2,24(sp)
  400780:	8fb10014 	lw	s1,20(sp)
  400784:	8fb00010 	lw	s0,16(sp)
  400788:	08100171 	j	4005c4 <__pf_fill>
  40078c:	27bd0030 	addiu	sp,sp,48
  400790:	02802821 	move	a1,s4
  400794:	02403021 	move	a2,s2
  400798:	0c100150 	jal	400540 <__pf_print>
  40079c:	02202021 	move	a0,s1
  4007a0:	0c10038c 	jal	400e30 <strlen>
  4007a4:	02602021 	move	a0,s3
  4007a8:	00403021 	move	a2,v0
  4007ac:	02202021 	move	a0,s1
  4007b0:	0c100150 	jal	400540 <__pf_print>
  4007b4:	02602821 	move	a1,s3
  4007b8:	0c10038c 	jal	400e30 <strlen>
  4007bc:	02a02021 	move	a0,s5
  4007c0:	02202021 	move	a0,s1
  4007c4:	02a02821 	move	a1,s5
  4007c8:	8fbf0028 	lw	ra,40(sp)
  4007cc:	8fb50024 	lw	s5,36(sp)
  4007d0:	8fb40020 	lw	s4,32(sp)
  4007d4:	8fb3001c 	lw	s3,28(sp)
  4007d8:	8fb20018 	lw	s2,24(sp)
  4007dc:	8fb10014 	lw	s1,20(sp)
  4007e0:	8fb00010 	lw	s0,16(sp)
  4007e4:	00403021 	move	a2,v0
  4007e8:	08100150 	j	400540 <__pf_print>
  4007ec:	27bd0030 	addiu	sp,sp,48
  4007f0:	02802821 	move	a1,s4
  4007f4:	0c100150 	jal	400540 <__pf_print>
  4007f8:	02202021 	move	a0,s1
  4007fc:	0c10038c 	jal	400e30 <strlen>
  400800:	02602021 	move	a0,s3
  400804:	00403021 	move	a2,v0
  400808:	02202021 	move	a0,s1
  40080c:	0c100150 	jal	400540 <__pf_print>
  400810:	02602821 	move	a1,s3
  400814:	0c10038c 	jal	400e30 <strlen>
  400818:	02a02021 	move	a0,s5
  40081c:	081001f1 	j	4007c4 <__pf_printstuff+0x194>
  400820:	02202021 	move	a0,s1
  400824:	0c100171 	jal	4005c4 <__pf_fill>
  400828:	02002821 	move	a1,s0
  40082c:	081001bf 	j	4006fc <__pf_printstuff+0xcc>
  400830:	00000000 	nop

00400834 <__vprintf>:
  400834:	27bdff68 	addiu	sp,sp,-152
  400838:	afbe0090 	sw	s8,144(sp)
  40083c:	27be0030 	addiu	s8,sp,48
  400840:	afb10074 	sw	s1,116(sp)
  400844:	afa40030 	sw	a0,48(sp)
  400848:	00c08821 	move	s1,a2
  40084c:	03c02021 	move	a0,s8
  400850:	afb00070 	sw	s0,112(sp)
  400854:	afbf0094 	sw	ra,148(sp)
  400858:	afb7008c 	sw	s7,140(sp)
  40085c:	afb60088 	sw	s6,136(sp)
  400860:	afb50084 	sw	s5,132(sp)
  400864:	afb40080 	sw	s4,128(sp)
  400868:	afb3007c 	sw	s3,124(sp)
  40086c:	afb20078 	sw	s2,120(sp)
  400870:	afa50034 	sw	a1,52(sp)
  400874:	afa70038 	sw	a3,56(sp)
  400878:	0c100162 	jal	400588 <__pf_endfield>
  40087c:	afa0003c 	sw	zero,60(sp)
  400880:	82300000 	lb	s0,0(s1)
  400884:	00000000 	nop
  400888:	12000017 	beqz	s0,4008e8 <__vprintf+0xb4>
  40088c:	0220a021 	move	s4,s1
  400890:	0810022e 	j	4008b8 <__vprintf+0x84>
  400894:	00000000 	nop
  400898:	27a50010 	addiu	a1,sp,16
  40089c:	24060001 	li	a2,1
  4008a0:	0c100150 	jal	400540 <__pf_print>
  4008a4:	a3b00010 	sb	s0,16(sp)
  4008a8:	82900001 	lb	s0,1(s4)
  4008ac:	00000000 	nop
  4008b0:	1200000d 	beqz	s0,4008e8 <__vprintf+0xb4>
  4008b4:	26940001 	addiu	s4,s4,1
  4008b8:	8fa20040 	lw	v0,64(sp)
  4008bc:	00000000 	nop
  4008c0:	14400016 	bnez	v0,40091c <__vprintf+0xe8>
  4008c4:	24020025 	li	v0,37
  4008c8:	1602fff3 	bne	s0,v0,400898 <__vprintf+0x64>
  4008cc:	03c02021 	move	a0,s8
  4008d0:	24020001 	li	v0,1
  4008d4:	afa20040 	sw	v0,64(sp)
  4008d8:	82900001 	lb	s0,1(s4)
  4008dc:	00000000 	nop
  4008e0:	1600fff5 	bnez	s0,4008b8 <__vprintf+0x84>
  4008e4:	26940001 	addiu	s4,s4,1
  4008e8:	8fa2003c 	lw	v0,60(sp)
  4008ec:	8fbf0094 	lw	ra,148(sp)
  4008f0:	8fbe0090 	lw	s8,144(sp)
  4008f4:	8fb7008c 	lw	s7,140(sp)
  4008f8:	8fb60088 	lw	s6,136(sp)
  4008fc:	8fb50084 	lw	s5,132(sp)
  400900:	8fb40080 	lw	s4,128(sp)
  400904:	8fb3007c 	lw	s3,124(sp)
  400908:	8fb20078 	lw	s2,120(sp)
  40090c:	8fb10074 	lw	s1,116(sp)
  400910:	8fb00070 	lw	s0,112(sp)
  400914:	03e00008 	jr	ra
  400918:	27bd0098 	addiu	sp,sp,152
  40091c:	3c040040 	lui	a0,0x40
  400920:	24841678 	addiu	a0,a0,5752
  400924:	0c100374 	jal	400dd0 <strchr>
  400928:	02002821 	move	a1,s0
  40092c:	10400031 	beqz	v0,4009f4 <__vprintf+0x1c0>
  400930:	24020030 	li	v0,48
  400934:	1202001d 	beq	s0,v0,4009ac <__vprintf+0x178>
  400938:	2a020031 	slti	v0,s0,49
  40093c:	10400013 	beqz	v0,40098c <__vprintf+0x158>
  400940:	2402006c 	li	v0,108
  400944:	24020023 	li	v0,35
  400948:	12020027 	beq	s0,v0,4009e8 <__vprintf+0x1b4>
  40094c:	2402002d 	li	v0,45
  400950:	1202004a 	beq	s0,v0,400a7c <__vprintf+0x248>
  400954:	24020001 	li	v0,1
  400958:	2602ffcf 	addiu	v0,s0,-49
  40095c:	2c420009 	sltiu	v0,v0,9
  400960:	1040001a 	beqz	v0,4009cc <__vprintf+0x198>
  400964:	3c040040 	lui	a0,0x40
  400968:	8fa20054 	lw	v0,84(sp)
  40096c:	00000000 	nop
  400970:	000218c0 	sll	v1,v0,0x3
  400974:	00021040 	sll	v0,v0,0x1
  400978:	00431021 	addu	v0,v0,v1
  40097c:	02021021 	addu	v0,s0,v0
  400980:	2442ffd0 	addiu	v0,v0,-48
  400984:	0810022a 	j	4008a8 <__vprintf+0x74>
  400988:	afa20054 	sw	v0,84(sp)
  40098c:	1602fff3 	bne	s0,v0,40095c <__vprintf+0x128>
  400990:	2602ffcf 	addiu	v0,s0,-49
  400994:	8fa20044 	lw	v0,68(sp)
  400998:	24030001 	li	v1,1
  40099c:	10430039 	beq	v0,v1,400a84 <__vprintf+0x250>
  4009a0:	24020002 	li	v0,2
  4009a4:	0810022a 	j	4008a8 <__vprintf+0x74>
  4009a8:	afa30044 	sw	v1,68(sp)
  4009ac:	8fa20054 	lw	v0,84(sp)
  4009b0:	00000000 	nop
  4009b4:	1840008c 	blez	v0,400be8 <__vprintf+0x3b4>
  4009b8:	000218c0 	sll	v1,v0,0x3
  4009bc:	00021040 	sll	v0,v0,0x1
  4009c0:	00431021 	addu	v0,v0,v1
  4009c4:	0810022a 	j	4008a8 <__vprintf+0x74>
  4009c8:	afa20054 	sw	v0,84(sp)
  4009cc:	3c060040 	lui	a2,0x40
  4009d0:	24841688 	addiu	a0,a0,5768
  4009d4:	24c616b0 	addiu	a2,a2,5808
  4009d8:	0c1003b0 	jal	400ec0 <__bad_assert>
  4009dc:	240500dc 	li	a1,220
  4009e0:	0810025a 	j	400968 <__vprintf+0x134>
  4009e4:	00000000 	nop
  4009e8:	24020001 	li	v0,1
  4009ec:	0810022a 	j	4008a8 <__vprintf+0x74>
  4009f0:	afa20068 	sw	v0,104(sp)
  4009f4:	3c040040 	lui	a0,0x40
  4009f8:	248416c4 	addiu	a0,a0,5828
  4009fc:	0c100374 	jal	400dd0 <strchr>
  400a00:	02002821 	move	a1,s0
  400a04:	10400091 	beqz	v0,400c4c <__vprintf+0x418>
  400a08:	24020070 	li	v0,112
  400a0c:	1202001f 	beq	s0,v0,400a8c <__vprintf+0x258>
  400a10:	24020064 	li	v0,100
  400a14:	1202009e 	beq	s0,v0,400c90 <__vprintf+0x45c>
  400a18:	24020001 	li	v0,1
  400a1c:	8fa30044 	lw	v1,68(sp)
  400a20:	00000000 	nop
  400a24:	10620003 	beq	v1,v0,400a34 <__vprintf+0x200>
  400a28:	00000000 	nop
  400a2c:	14600074 	bnez	v1,400c00 <__vprintf+0x3cc>
  400a30:	24020002 	li	v0,2
  400a34:	8fa20038 	lw	v0,56(sp)
  400a38:	afa00048 	sw	zero,72(sp)
  400a3c:	8c430000 	lw	v1,0(v0)
  400a40:	24420004 	addiu	v0,v0,4
  400a44:	afa20038 	sw	v0,56(sp)
  400a48:	afa3004c 	sw	v1,76(sp)
  400a4c:	2602ff9c 	addiu	v0,s0,-100
  400a50:	304200ff 	andi	v0,v0,0xff
  400a54:	2c430015 	sltiu	v1,v0,21
  400a58:	10600015 	beqz	v1,400ab0 <__vprintf+0x27c>
  400a5c:	3c030040 	lui	v1,0x40
  400a60:	00021080 	sll	v0,v0,0x2
  400a64:	246315e0 	addiu	v1,v1,5600
  400a68:	00431021 	addu	v0,v0,v1
  400a6c:	8c440000 	lw	a0,0(v0)
  400a70:	00000000 	nop
  400a74:	00800008 	jr	a0
  400a78:	00000000 	nop
  400a7c:	0810022a 	j	4008a8 <__vprintf+0x74>
  400a80:	afa20058 	sw	v0,88(sp)
  400a84:	0810022a 	j	4008a8 <__vprintf+0x74>
  400a88:	afa20044 	sw	v0,68(sp)
  400a8c:	8fa20038 	lw	v0,56(sp)
  400a90:	afa00048 	sw	zero,72(sp)
  400a94:	24430004 	addiu	v1,v0,4
  400a98:	afa30038 	sw	v1,56(sp)
  400a9c:	8c440000 	lw	a0,0(v0)
  400aa0:	00000000 	nop
  400aa4:	afa4004c 	sw	a0,76(sp)
  400aa8:	24020010 	li	v0,16
  400aac:	afa20060 	sw	v0,96(sp)
  400ab0:	8fa20068 	lw	v0,104(sp)
  400ab4:	00000000 	nop
  400ab8:	1440004d 	bnez	v0,400bf0 <__vprintf+0x3bc>
  400abc:	24020001 	li	v0,1
  400ac0:	24020070 	li	v0,112
  400ac4:	1202004a 	beq	s0,v0,400bf0 <__vprintf+0x3bc>
  400ac8:	24020001 	li	v0,1
  400acc:	8fb60060 	lw	s6,96(sp)
  400ad0:	3c020040 	lui	v0,0x40
  400ad4:	8fb1004c 	lw	s1,76(sp)
  400ad8:	8fb00048 	lw	s0,72(sp)
  400adc:	a3a00029 	sb	zero,41(sp)
  400ae0:	245716cc 	addiu	s7,v0,5836
  400ae4:	27b50028 	addiu	s5,sp,40
  400ae8:	02c09821 	move	s3,s6
  400aec:	001697c3 	sra	s2,s6,0x1f
  400af0:	02202821 	move	a1,s1
  400af4:	02002021 	move	a0,s0
  400af8:	02603821 	move	a3,s3
  400afc:	0c1003a4 	jal	400e90 <__umoddi3>
  400b00:	02403021 	move	a2,s2
  400b04:	02e31821 	addu	v1,s7,v1
  400b08:	90620000 	lbu	v0,0(v1)
  400b0c:	02202821 	move	a1,s1
  400b10:	02002021 	move	a0,s0
  400b14:	02603821 	move	a3,s3
  400b18:	02403021 	move	a2,s2
  400b1c:	0c10039c 	jal	400e70 <__udivdi3>
  400b20:	a2a20000 	sb	v0,0(s5)
  400b24:	00408021 	move	s0,v0
  400b28:	02031025 	or	v0,s0,v1
  400b2c:	00608821 	move	s1,v1
  400b30:	1440ffef 	bnez	v0,400af0 <__vprintf+0x2bc>
  400b34:	26b5ffff 	addiu	s5,s5,-1
  400b38:	8fa20064 	lw	v0,100(sp)
  400b3c:	00000000 	nop
  400b40:	10400006 	beqz	v0,400b5c <__vprintf+0x328>
  400b44:	3c020040 	lui	v0,0x40
  400b48:	24020010 	li	v0,16
  400b4c:	12c2005e 	beq	s6,v0,400cc8 <__vprintf+0x494>
  400b50:	24020008 	li	v0,8
  400b54:	12c20037 	beq	s6,v0,400c34 <__vprintf+0x400>
  400b58:	3c020040 	lui	v0,0x40
  400b5c:	2446165c 	addiu	a2,v0,5724
  400b60:	8fa20050 	lw	v0,80(sp)
  400b64:	00000000 	nop
  400b68:	10400023 	beqz	v0,400bf8 <__vprintf+0x3c4>
  400b6c:	3c020040 	lui	v0,0x40
  400b70:	3c020040 	lui	v0,0x40
  400b74:	2445166c 	addiu	a1,v0,5740
  400b78:	03c02021 	move	a0,s8
  400b7c:	0c10018c 	jal	400630 <__pf_printstuff>
  400b80:	26a70001 	addiu	a3,s5,1
  400b84:	0c100162 	jal	400588 <__pf_endfield>
  400b88:	03c02021 	move	a0,s8
  400b8c:	0810022a 	j	4008a8 <__vprintf+0x74>
  400b90:	00000000 	nop
  400b94:	8fa20038 	lw	v0,56(sp)
  400b98:	2403fff8 	li	v1,-8
  400b9c:	24420007 	addiu	v0,v0,7
  400ba0:	00431024 	and	v0,v0,v1
  400ba4:	8c470004 	lw	a3,4(v0)
  400ba8:	8c460000 	lw	a2,0(v0)
  400bac:	24420008 	addiu	v0,v0,8
  400bb0:	afa20038 	sw	v0,56(sp)
  400bb4:	04c10040 	bgez	a2,400cb8 <__vprintf+0x484>
  400bb8:	2402000a 	li	v0,10
  400bbc:	00071823 	negu	v1,a3
  400bc0:	0003282b 	sltu	a1,zero,v1
  400bc4:	00061023 	negu	v0,a2
  400bc8:	00451023 	subu	v0,v0,a1
  400bcc:	2404ffff 	li	a0,-1
  400bd0:	afa40050 	sw	a0,80(sp)
  400bd4:	afa3004c 	sw	v1,76(sp)
  400bd8:	afa20048 	sw	v0,72(sp)
  400bdc:	2402000a 	li	v0,10
  400be0:	081002ac 	j	400ab0 <__vprintf+0x27c>
  400be4:	afa20060 	sw	v0,96(sp)
  400be8:	0810022a 	j	4008a8 <__vprintf+0x74>
  400bec:	afb0005c 	sw	s0,92(sp)
  400bf0:	081002b3 	j	400acc <__vprintf+0x298>
  400bf4:	afa20064 	sw	v0,100(sp)
  400bf8:	081002de 	j	400b78 <__vprintf+0x344>
  400bfc:	2445165c 	addiu	a1,v0,5724
  400c00:	1462ff93 	bne	v1,v0,400a50 <__vprintf+0x21c>
  400c04:	2602ff9c 	addiu	v0,s0,-100
  400c08:	8fa20038 	lw	v0,56(sp)
  400c0c:	2403fff8 	li	v1,-8
  400c10:	24420007 	addiu	v0,v0,7
  400c14:	00431024 	and	v0,v0,v1
  400c18:	8c450004 	lw	a1,4(v0)
  400c1c:	8c440000 	lw	a0,0(v0)
  400c20:	24420008 	addiu	v0,v0,8
  400c24:	afa20038 	sw	v0,56(sp)
  400c28:	afa5004c 	sw	a1,76(sp)
  400c2c:	08100293 	j	400a4c <__vprintf+0x218>
  400c30:	afa40048 	sw	a0,72(sp)
  400c34:	3c020040 	lui	v0,0x40
  400c38:	081002d8 	j	400b60 <__vprintf+0x32c>
  400c3c:	244616e4 	addiu	a2,v0,5860
  400c40:	24020008 	li	v0,8
  400c44:	081002ac 	j	400ab0 <__vprintf+0x27c>
  400c48:	afa20060 	sw	v0,96(sp)
  400c4c:	24020073 	li	v0,115
  400c50:	12020028 	beq	s0,v0,400cf4 <__vprintf+0x4c0>
  400c54:	24020063 	li	v0,99
  400c58:	12020037 	beq	s0,v0,400d38 <__vprintf+0x504>
  400c5c:	00000000 	nop
  400c60:	a3b00011 	sb	s0,17(sp)
  400c64:	3c050040 	lui	a1,0x40
  400c68:	24a5165c 	addiu	a1,a1,5724
  400c6c:	03c02021 	move	a0,s8
  400c70:	00a03021 	move	a2,a1
  400c74:	27a70011 	addiu	a3,sp,17
  400c78:	0c10018c 	jal	400630 <__pf_printstuff>
  400c7c:	a3a00012 	sb	zero,18(sp)
  400c80:	0c100162 	jal	400588 <__pf_endfield>
  400c84:	03c02021 	move	a0,s8
  400c88:	0810022a 	j	4008a8 <__vprintf+0x74>
  400c8c:	00000000 	nop
  400c90:	8fa30044 	lw	v1,68(sp)
  400c94:	00000000 	nop
  400c98:	1062000e 	beq	v1,v0,400cd4 <__vprintf+0x4a0>
  400c9c:	00000000 	nop
  400ca0:	1060000c 	beqz	v1,400cd4 <__vprintf+0x4a0>
  400ca4:	24020002 	li	v0,2
  400ca8:	1062ffba 	beq	v1,v0,400b94 <__vprintf+0x360>
  400cac:	00003821 	move	a3,zero
  400cb0:	00003021 	move	a2,zero
  400cb4:	2402000a 	li	v0,10
  400cb8:	afa7004c 	sw	a3,76(sp)
  400cbc:	afa60048 	sw	a2,72(sp)
  400cc0:	081002ac 	j	400ab0 <__vprintf+0x27c>
  400cc4:	afa20060 	sw	v0,96(sp)
  400cc8:	3c020040 	lui	v0,0x40
  400ccc:	081002d8 	j	400b60 <__vprintf+0x32c>
  400cd0:	244616e0 	addiu	a2,v0,5856
  400cd4:	8fa20038 	lw	v0,56(sp)
  400cd8:	00000000 	nop
  400cdc:	8c430000 	lw	v1,0(v0)
  400ce0:	24420004 	addiu	v0,v0,4
  400ce4:	00603821 	move	a3,v1
  400ce8:	000337c3 	sra	a2,v1,0x1f
  400cec:	081002ed 	j	400bb4 <__vprintf+0x380>
  400cf0:	afa20038 	sw	v0,56(sp)
  400cf4:	8fa30038 	lw	v1,56(sp)
  400cf8:	00000000 	nop
  400cfc:	8c670000 	lw	a3,0(v1)
  400d00:	00000000 	nop
  400d04:	10e00013 	beqz	a3,400d54 <__vprintf+0x520>
  400d08:	3c020040 	lui	v0,0x40
  400d0c:	3c050040 	lui	a1,0x40
  400d10:	24a5165c 	addiu	a1,a1,5724
  400d14:	24620004 	addiu	v0,v1,4
  400d18:	03c02021 	move	a0,s8
  400d1c:	00a03021 	move	a2,a1
  400d20:	0c10018c 	jal	400630 <__pf_printstuff>
  400d24:	afa20038 	sw	v0,56(sp)
  400d28:	0c100162 	jal	400588 <__pf_endfield>
  400d2c:	03c02021 	move	a0,s8
  400d30:	0810022a 	j	4008a8 <__vprintf+0x74>
  400d34:	00000000 	nop
  400d38:	8fa20038 	lw	v0,56(sp)
  400d3c:	00000000 	nop
  400d40:	8c430000 	lw	v1,0(v0)
  400d44:	24420004 	addiu	v0,v0,4
  400d48:	afa20038 	sw	v0,56(sp)
  400d4c:	08100319 	j	400c64 <__vprintf+0x430>
  400d50:	a3a30011 	sb	v1,17(sp)
  400d54:	08100343 	j	400d0c <__vprintf+0x4d8>
  400d58:	24471670 	addiu	a3,v0,5744
  400d5c:	00000000 	nop

00400d60 <__puts>:
  400d60:	27bdffe0 	addiu	sp,sp,-32
  400d64:	afb00010 	sw	s0,16(sp)
  400d68:	afbf0018 	sw	ra,24(sp)
  400d6c:	afb10014 	sw	s1,20(sp)
  400d70:	00808021 	move	s0,a0
  400d74:	80840000 	lb	a0,0(a0)
  400d78:	00000000 	nop
  400d7c:	1080000d 	beqz	a0,400db4 <__puts+0x54>
  400d80:	00008821 	move	s1,zero
  400d84:	0c100064 	jal	400190 <putchar>
  400d88:	26100001 	addiu	s0,s0,1
  400d8c:	82040000 	lb	a0,0(s0)
  400d90:	00000000 	nop
  400d94:	1480fffb 	bnez	a0,400d84 <__puts+0x24>
  400d98:	26310001 	addiu	s1,s1,1
  400d9c:	02201021 	move	v0,s1
  400da0:	8fbf0018 	lw	ra,24(sp)
  400da4:	8fb10014 	lw	s1,20(sp)
  400da8:	8fb00010 	lw	s0,16(sp)
  400dac:	03e00008 	jr	ra
  400db0:	27bd0020 	addiu	sp,sp,32
  400db4:	02201021 	move	v0,s1
  400db8:	8fbf0018 	lw	ra,24(sp)
  400dbc:	8fb10014 	lw	s1,20(sp)
  400dc0:	8fb00010 	lw	s0,16(sp)
  400dc4:	03e00008 	jr	ra
  400dc8:	27bd0020 	addiu	sp,sp,32
  400dcc:	00000000 	nop

00400dd0 <strchr>:
  400dd0:	80830000 	lb	v1,0(a0)
  400dd4:	00052e00 	sll	a1,a1,0x18
  400dd8:	00801021 	move	v0,a0
  400ddc:	1060000c 	beqz	v1,400e10 <strchr+0x40>
  400de0:	00052e03 	sra	a1,a1,0x18
  400de4:	14a30006 	bne	a1,v1,400e00 <strchr+0x30>
  400de8:	24420001 	addiu	v0,v0,1
  400dec:	03e00008 	jr	ra
  400df0:	2442ffff 	addiu	v0,v0,-1
  400df4:	10a3000c 	beq	a1,v1,400e28 <strchr+0x58>
  400df8:	00000000 	nop
  400dfc:	24420001 	addiu	v0,v0,1
  400e00:	80430000 	lb	v1,0(v0)
  400e04:	00000000 	nop
  400e08:	1460fffa 	bnez	v1,400df4 <strchr+0x24>
  400e0c:	00000000 	nop
  400e10:	14a00003 	bnez	a1,400e20 <strchr+0x50>
  400e14:	00000000 	nop
  400e18:	03e00008 	jr	ra
  400e1c:	00000000 	nop
  400e20:	03e00008 	jr	ra
  400e24:	00001021 	move	v0,zero
  400e28:	03e00008 	jr	ra
  400e2c:	00000000 	nop

00400e30 <strlen>:
  400e30:	80820000 	lb	v0,0(a0)
  400e34:	00000000 	nop
  400e38:	1040000a 	beqz	v0,400e64 <strlen+0x34>
  400e3c:	00002821 	move	a1,zero
  400e40:	24a50001 	addiu	a1,a1,1
  400e44:	00851021 	addu	v0,a0,a1
  400e48:	80430000 	lb	v1,0(v0)
  400e4c:	00000000 	nop
  400e50:	1460fffc 	bnez	v1,400e44 <strlen+0x14>
  400e54:	24a50001 	addiu	a1,a1,1
  400e58:	24a5ffff 	addiu	a1,a1,-1
  400e5c:	03e00008 	jr	ra
  400e60:	00a01021 	move	v0,a1
  400e64:	03e00008 	jr	ra
  400e68:	00a01021 	move	v0,a1
  400e6c:	00000000 	nop

00400e70 <__udivdi3>:
  400e70:	27bdffe0 	addiu	sp,sp,-32
  400e74:	afbf0018 	sw	ra,24(sp)
  400e78:	0c10042b 	jal	4010ac <__qdivrem>
  400e7c:	afa00010 	sw	zero,16(sp)
  400e80:	8fbf0018 	lw	ra,24(sp)
  400e84:	00000000 	nop
  400e88:	03e00008 	jr	ra
  400e8c:	27bd0020 	addiu	sp,sp,32

00400e90 <__umoddi3>:
  400e90:	27bdffd8 	addiu	sp,sp,-40
  400e94:	27a20018 	addiu	v0,sp,24
  400e98:	afbf0020 	sw	ra,32(sp)
  400e9c:	0c10042b 	jal	4010ac <__qdivrem>
  400ea0:	afa20010 	sw	v0,16(sp)
  400ea4:	8fa3001c 	lw	v1,28(sp)
  400ea8:	8fa20018 	lw	v0,24(sp)
  400eac:	8fbf0020 	lw	ra,32(sp)
  400eb0:	00000000 	nop
  400eb4:	03e00008 	jr	ra
  400eb8:	27bd0028 	addiu	sp,sp,40
  400ebc:	00000000 	nop

00400ec0 <__bad_assert>:
  400ec0:	27bdfee0 	addiu	sp,sp,-288
  400ec4:	00c03821 	move	a3,a2
  400ec8:	afb00118 	sw	s0,280(sp)
  400ecc:	3c060040 	lui	a2,0x40
  400ed0:	27b00018 	addiu	s0,sp,24
  400ed4:	24c616e8 	addiu	a2,a2,5864
  400ed8:	afa40010 	sw	a0,16(sp)
  400edc:	afa50014 	sw	a1,20(sp)
  400ee0:	02002021 	move	a0,s0
  400ee4:	afbf011c 	sw	ra,284(sp)
  400ee8:	0c1003fc 	jal	400ff0 <snprintf>
  400eec:	24050100 	li	a1,256
  400ef0:	0c10038c 	jal	400e30 <strlen>
  400ef4:	02002021 	move	a0,s0
  400ef8:	00403021 	move	a2,v0
  400efc:	02002821 	move	a1,s0
  400f00:	0c1000e7 	jal	40039c <write>
  400f04:	24040002 	li	a0,2
  400f08:	0c100408 	jal	401020 <abort>
  400f0c:	00000000 	nop

00400f10 <__snprintf_send>:
  400f10:	10c00012 	beqz	a2,400f5c <__snprintf_send+0x4c>
  400f14:	00004021 	move	t0,zero
  400f18:	8c870008 	lw	a3,8(a0)
  400f1c:	8c820004 	lw	v0,4(a0)
  400f20:	00a81821 	addu	v1,a1,t0
  400f24:	00e2102b 	sltu	v0,a3,v0
  400f28:	1040000a 	beqz	v0,400f54 <__snprintf_send+0x44>
  400f2c:	25080001 	addiu	t0,t0,1
  400f30:	8c820000 	lw	v0,0(a0)
  400f34:	90630000 	lbu	v1,0(v1)
  400f38:	00471021 	addu	v0,v0,a3
  400f3c:	a0430000 	sb	v1,0(v0)
  400f40:	8c870008 	lw	a3,8(a0)
  400f44:	00000000 	nop
  400f48:	24e20001 	addiu	v0,a3,1
  400f4c:	00403821 	move	a3,v0
  400f50:	ac820008 	sw	v0,8(a0)
  400f54:	14c8fff1 	bne	a2,t0,400f1c <__snprintf_send+0xc>
  400f58:	00000000 	nop
  400f5c:	03e00008 	jr	ra
  400f60:	00000000 	nop

00400f64 <vsnprintf>:
  400f64:	27bdffd8 	addiu	sp,sp,-40
  400f68:	afb00020 	sw	s0,32(sp)
  400f6c:	00a01021 	move	v0,a1
  400f70:	00808021 	move	s0,a0
  400f74:	3c040040 	lui	a0,0x40
  400f78:	24a3ffff 	addiu	v1,a1,-1
  400f7c:	afbf0024 	sw	ra,36(sp)
  400f80:	24840f10 	addiu	a0,a0,3856
  400f84:	27a50010 	addiu	a1,sp,16
  400f88:	1440000c 	bnez	v0,400fbc <vsnprintf+0x58>
  400f8c:	afb00010 	sw	s0,16(sp)
  400f90:	3c040040 	lui	a0,0x40
  400f94:	24840f10 	addiu	a0,a0,3856
  400f98:	afa00014 	sw	zero,20(sp)
  400f9c:	0c10020d 	jal	400834 <__vprintf>
  400fa0:	afa00018 	sw	zero,24(sp)
  400fa4:	00401821 	move	v1,v0
  400fa8:	8fbf0024 	lw	ra,36(sp)
  400fac:	8fb00020 	lw	s0,32(sp)
  400fb0:	00601021 	move	v0,v1
  400fb4:	03e00008 	jr	ra
  400fb8:	27bd0028 	addiu	sp,sp,40
  400fbc:	afa30014 	sw	v1,20(sp)
  400fc0:	0c10020d 	jal	400834 <__vprintf>
  400fc4:	afa00018 	sw	zero,24(sp)
  400fc8:	00401821 	move	v1,v0
  400fcc:	8fa20018 	lw	v0,24(sp)
  400fd0:	00000000 	nop
  400fd4:	02021021 	addu	v0,s0,v0
  400fd8:	a0400000 	sb	zero,0(v0)
  400fdc:	8fbf0024 	lw	ra,36(sp)
  400fe0:	8fb00020 	lw	s0,32(sp)
  400fe4:	00601021 	move	v0,v1
  400fe8:	03e00008 	jr	ra
  400fec:	27bd0028 	addiu	sp,sp,40

00400ff0 <snprintf>:
  400ff0:	27bdffe0 	addiu	sp,sp,-32
  400ff4:	27a2002c 	addiu	v0,sp,44
  400ff8:	afa7002c 	sw	a3,44(sp)
  400ffc:	00403821 	move	a3,v0
  401000:	afbf0018 	sw	ra,24(sp)
  401004:	0c1003d9 	jal	400f64 <vsnprintf>
  401008:	afa20010 	sw	v0,16(sp)
  40100c:	8fbf0018 	lw	ra,24(sp)
  401010:	00000000 	nop
  401014:	03e00008 	jr	ra
  401018:	27bd0020 	addiu	sp,sp,32
  40101c:	00000000 	nop

00401020 <abort>:
  401020:	27bdffe8 	addiu	sp,sp,-24
  401024:	afbf0010 	sw	ra,16(sp)
  401028:	0c1000a7 	jal	40029c <_exit>
  40102c:	240400ff 	li	a0,255

00401030 <shl>:
  401030:	18a00016 	blez	a1,40108c <shl+0x5c>
  401034:	24020010 	li	v0,16
  401038:	00464823 	subu	t1,v0,a2
  40103c:	00803821 	move	a3,a0
  401040:	00004021 	move	t0,zero
  401044:	8ce20000 	lw	v0,0(a3)
  401048:	8ce30004 	lw	v1,4(a3)
  40104c:	00c21004 	sllv	v0,v0,a2
  401050:	3042ffff 	andi	v0,v0,0xffff
  401054:	01231806 	srlv	v1,v1,t1
  401058:	00431025 	or	v0,v0,v1
  40105c:	25080001 	addiu	t0,t0,1
  401060:	ace20000 	sw	v0,0(a3)
  401064:	14a8fff7 	bne	a1,t0,401044 <shl+0x14>
  401068:	24e70004 	addiu	a3,a3,4
  40106c:	00051880 	sll	v1,a1,0x2
  401070:	00831821 	addu	v1,a0,v1
  401074:	8c620000 	lw	v0,0(v1)
  401078:	00000000 	nop
  40107c:	00c21004 	sllv	v0,v0,a2
  401080:	3042ffff 	andi	v0,v0,0xffff
  401084:	03e00008 	jr	ra
  401088:	ac620000 	sw	v0,0(v1)
  40108c:	00001821 	move	v1,zero
  401090:	00831821 	addu	v1,a0,v1
  401094:	8c620000 	lw	v0,0(v1)
  401098:	00000000 	nop
  40109c:	00c21004 	sllv	v0,v0,a2
  4010a0:	3042ffff 	andi	v0,v0,0xffff
  4010a4:	03e00008 	jr	ra
  4010a8:	ac620000 	sw	v0,0(v1)

004010ac <__qdivrem>:
  4010ac:	27bdff80 	addiu	sp,sp,-128
  4010b0:	00c71025 	or	v0,a2,a3
  4010b4:	afb20060 	sw	s2,96(sp)
  4010b8:	afbf007c 	sw	ra,124(sp)
  4010bc:	afbe0078 	sw	s8,120(sp)
  4010c0:	afb70074 	sw	s7,116(sp)
  4010c4:	afb60070 	sw	s6,112(sp)
  4010c8:	afb5006c 	sw	s5,108(sp)
  4010cc:	afb40068 	sw	s4,104(sp)
  4010d0:	afb30064 	sw	s3,100(sp)
  4010d4:	afb1005c 	sw	s1,92(sp)
  4010d8:	afb00058 	sw	s0,88(sp)
  4010dc:	00a04821 	move	t1,a1
  4010e0:	8fb20090 	lw	s2,144(sp)
  4010e4:	14400018 	bnez	v0,401148 <__qdivrem+0x9c>
  4010e8:	00804021 	move	t0,a0
  4010ec:	3c031000 	lui	v1,0x1000
  4010f0:	8c640000 	lw	a0,0(v1)
  4010f4:	24020001 	li	v0,1
  4010f8:	14800002 	bnez	a0,401104 <__qdivrem+0x58>
  4010fc:	0044001b 	divu	zero,v0,a0
  401100:	0007000d 	break	0x7
  401104:	00001012 	mflo	v0
  401108:	12400003 	beqz	s2,401118 <__qdivrem+0x6c>
  40110c:	00401821 	move	v1,v0
  401110:	ae450004 	sw	a1,4(s2)
  401114:	ae480000 	sw	t0,0(s2)
  401118:	8fbf007c 	lw	ra,124(sp)
  40111c:	8fbe0078 	lw	s8,120(sp)
  401120:	8fb70074 	lw	s7,116(sp)
  401124:	8fb60070 	lw	s6,112(sp)
  401128:	8fb5006c 	lw	s5,108(sp)
  40112c:	8fb40068 	lw	s4,104(sp)
  401130:	8fb30064 	lw	s3,100(sp)
  401134:	8fb20060 	lw	s2,96(sp)
  401138:	8fb1005c 	lw	s1,92(sp)
  40113c:	8fb00058 	lw	s0,88(sp)
  401140:	03e00008 	jr	ra
  401144:	27bd0080 	addiu	sp,sp,128
  401148:	0086102b 	sltu	v0,a0,a2
  40114c:	10400008 	beqz	v0,401170 <__qdivrem+0xc4>
  401150:	00000000 	nop
  401154:	1240010c 	beqz	s2,401588 <__qdivrem+0x4dc>
  401158:	00000000 	nop
  40115c:	00001821 	move	v1,zero
  401160:	00001021 	move	v0,zero
  401164:	ae490004 	sw	t1,4(s2)
  401168:	08100446 	j	401118 <__qdivrem+0x6c>
  40116c:	ae480000 	sw	t0,0(s2)
  401170:	10860046 	beq	a0,a2,40128c <__qdivrem+0x1e0>
  401174:	00a7102b 	sltu	v0,a1,a3
  401178:	00e08821 	move	s1,a3
  40117c:	01001821 	move	v1,t0
  401180:	00c08021 	move	s0,a2
  401184:	30c7ffff 	andi	a3,a2,0xffff
  401188:	3108ffff 	andi	t0,t0,0xffff
  40118c:	312affff 	andi	t2,t1,0xffff
  401190:	3226ffff 	andi	a2,s1,0xffff
  401194:	00031c02 	srl	v1,v1,0x10
  401198:	00092c02 	srl	a1,t1,0x10
  40119c:	00101402 	srl	v0,s0,0x10
  4011a0:	00112402 	srl	a0,s1,0x10
  4011a4:	afa00010 	sw	zero,16(sp)
  4011a8:	afa30014 	sw	v1,20(sp)
  4011ac:	afa80018 	sw	t0,24(sp)
  4011b0:	afa5001c 	sw	a1,28(sp)
  4011b4:	afaa0020 	sw	t2,32(sp)
  4011b8:	afa20028 	sw	v0,40(sp)
  4011bc:	afa7002c 	sw	a3,44(sp)
  4011c0:	afa40030 	sw	a0,48(sp)
  4011c4:	144000f6 	bnez	v0,4015a0 <__qdivrem+0x4f4>
  4011c8:	afa60034 	sw	a2,52(sp)
  4011cc:	14e00033 	bnez	a3,40129c <__qdivrem+0x1f0>
  4011d0:	27a20028 	addiu	v0,sp,40
  4011d4:	148000f7 	bnez	a0,4015b4 <__qdivrem+0x508>
  4011d8:	27a2002c 	addiu	v0,sp,44
  4011dc:	14c00002 	bnez	a2,4011e8 <__qdivrem+0x13c>
  4011e0:	0066001b 	divu	zero,v1,a2
  4011e4:	0007000d 	break	0x7
  4011e8:	00001010 	mfhi	v0
  4011ec:	00021400 	sll	v0,v0,0x10
  4011f0:	00481025 	or	v0,v0,t0
  4011f4:	00004812 	mflo	t1
	...
  401200:	14c00002 	bnez	a2,40120c <__qdivrem+0x160>
  401204:	0046001b 	divu	zero,v0,a2
  401208:	0007000d 	break	0x7
  40120c:	00001810 	mfhi	v1
  401210:	00031c00 	sll	v1,v1,0x10
  401214:	00651825 	or	v1,v1,a1
  401218:	00003812 	mflo	a3
	...
  401224:	14c00002 	bnez	a2,401230 <__qdivrem+0x184>
  401228:	0066001b 	divu	zero,v1,a2
  40122c:	0007000d 	break	0x7
  401230:	00001010 	mfhi	v0
  401234:	00021400 	sll	v0,v0,0x10
  401238:	00001812 	mflo	v1
  40123c:	12400008 	beqz	s2,401260 <__qdivrem+0x1b4>
  401240:	01422025 	or	a0,t2,v0
  401244:	14c00002 	bnez	a2,401250 <__qdivrem+0x1a4>
  401248:	0086001b 	divu	zero,a0,a2
  40124c:	0007000d 	break	0x7
  401250:	ae400000 	sw	zero,0(s2)
  401254:	00001010 	mfhi	v0
  401258:	ae420004 	sw	v0,4(s2)
  40125c:	00000000 	nop
  401260:	14c00002 	bnez	a2,40126c <__qdivrem+0x1c0>
  401264:	0086001b 	divu	zero,a0,a2
  401268:	0007000d 	break	0x7
  40126c:	00091400 	sll	v0,t1,0x10
  401270:	00031c00 	sll	v1,v1,0x10
  401274:	00e28025 	or	s0,a3,v0
  401278:	02001021 	move	v0,s0
  40127c:	00002012 	mflo	a0
  401280:	00838825 	or	s1,a0,v1
  401284:	08100446 	j	401118 <__qdivrem+0x6c>
  401288:	02201821 	move	v1,s1
  40128c:	1040ffbb 	beqz	v0,40117c <__qdivrem+0xd0>
  401290:	00e08821 	move	s1,a3
  401294:	08100455 	j	401154 <__qdivrem+0xa8>
  401298:	00000000 	nop
  40129c:	afa20050 	sw	v0,80(sp)
  4012a0:	24170003 	li	s7,3
  4012a4:	27be002c 	addiu	s8,sp,44
  4012a8:	8fa30014 	lw	v1,20(sp)
  4012ac:	24020004 	li	v0,4
  4012b0:	146000c4 	bnez	v1,4015c4 <__qdivrem+0x518>
  4012b4:	00579823 	subu	s3,v0,s7
  4012b8:	081004b1 	j	4012c4 <__qdivrem+0x218>
  4012bc:	27b40014 	addiu	s4,sp,20
  4012c0:	0060a021 	move	s4,v1
  4012c4:	8e820004 	lw	v0,4(s4)
  4012c8:	2673ffff 	addiu	s3,s3,-1
  4012cc:	1040fffc 	beqz	v0,4012c0 <__qdivrem+0x214>
  4012d0:	26830004 	addiu	v1,s4,4
  4012d4:	24020004 	li	v0,4
  4012d8:	00532023 	subu	a0,v0,s3
  4012dc:	2483ffff 	addiu	v1,a0,-1
  4012e0:	046000bc 	bltz	v1,4015d4 <__qdivrem+0x528>
  4012e4:	00001821 	move	v1,zero
  4012e8:	27a60038 	addiu	a2,sp,56
  4012ec:	00042880 	sll	a1,a0,0x2
  4012f0:	00c51021 	addu	v0,a2,a1
  4012f4:	2442fffc 	addiu	v0,v0,-4
  4012f8:	24630001 	addiu	v1,v1,1
  4012fc:	ac400000 	sw	zero,0(v0)
  401300:	1464fffd 	bne	v1,a0,4012f8 <__qdivrem+0x24c>
  401304:	2442fffc 	addiu	v0,v0,-4
  401308:	8fcb0000 	lw	t3,0(s8)
  40130c:	34028000 	li	v0,0x8000
  401310:	0162102b 	sltu	v0,t3,v0
  401314:	00c5b021 	addu	s6,a2,a1
  401318:	104000ac 	beqz	v0,4015cc <__qdivrem+0x520>
  40131c:	01601821 	move	v1,t3
  401320:	0000a821 	move	s5,zero
  401324:	34048000 	li	a0,0x8000
  401328:	00031840 	sll	v1,v1,0x1
  40132c:	0064102b 	sltu	v0,v1,a0
  401330:	1440fffd 	bnez	v0,401328 <__qdivrem+0x27c>
  401334:	26b50001 	addiu	s5,s5,1
  401338:	1aa00009 	blez	s5,401360 <__qdivrem+0x2b4>
  40133c:	02f32821 	addu	a1,s7,s3
  401340:	02a03021 	move	a2,s5
  401344:	0c10040c 	jal	401030 <shl>
  401348:	02802021 	move	a0,s4
  40134c:	03c02021 	move	a0,s8
  401350:	26e5ffff 	addiu	a1,s7,-1
  401354:	0c10040c 	jal	401030 <shl>
  401358:	02a03021 	move	a2,s5
  40135c:	8fcb0000 	lw	t3,0(s8)
  401360:	8fa20050 	lw	v0,80(sp)
  401364:	00177080 	sll	t6,s7,0x2
  401368:	8c580008 	lw	t8,8(v0)
  40136c:	02c06821 	move	t5,s6
  401370:	02804821 	move	t1,s4
  401374:	028e6021 	addu	t4,s4,t6
  401378:	00007821 	move	t7,zero
  40137c:	3416ffff 	li	s6,0xffff
  401380:	8d240000 	lw	a0,0(t1)
  401384:	8d230004 	lw	v1,4(t1)
  401388:	8d260008 	lw	a2,8(t1)
  40138c:	11640081 	beq	t3,a0,401594 <__qdivrem+0x4e8>
  401390:	00041400 	sll	v0,a0,0x10
  401394:	00621025 	or	v0,v1,v0
  401398:	15600002 	bnez	t3,4013a4 <__qdivrem+0x2f8>
  40139c:	004b001b 	divu	zero,v0,t3
  4013a0:	0007000d 	break	0x7
  4013a4:	00002810 	mfhi	a1
  4013a8:	00003812 	mflo	a3
	...
  4013b4:	00f80018 	mult	a3,t8
  4013b8:	00051400 	sll	v0,a1,0x10
  4013bc:	00c21025 	or	v0,a2,v0
  4013c0:	00001812 	mflo	v1
  4013c4:	0043182b 	sltu	v1,v0,v1
  4013c8:	10600006 	beqz	v1,4013e4 <__qdivrem+0x338>
  4013cc:	00000000 	nop
  4013d0:	24e7ffff 	addiu	a3,a3,-1
  4013d4:	00ab2821 	addu	a1,a1,t3
  4013d8:	02c5102b 	sltu	v0,s6,a1
  4013dc:	1040fff6 	beqz	v0,4013b8 <__qdivrem+0x30c>
  4013e0:	00f80018 	mult	a3,t8
  4013e4:	1ae00017 	blez	s7,401444 <__qdivrem+0x398>
  4013e8:	00004021 	move	t0,zero
  4013ec:	8fa20050 	lw	v0,80(sp)
  4013f0:	01802021 	move	a0,t4
  4013f4:	004e3021 	addu	a2,v0,t6
  4013f8:	02e02821 	move	a1,s7
  4013fc:	3c0a0001 	lui	t2,0x1
  401400:	8cc20000 	lw	v0,0(a2)
  401404:	8c830000 	lw	v1,0(a0)
  401408:	00e20018 	mult	a3,v0
  40140c:	24a5ffff 	addiu	a1,a1,-1
  401410:	24c6fffc 	addiu	a2,a2,-4
  401414:	00001012 	mflo	v0
  401418:	00621823 	subu	v1,v1,v0
  40141c:	00681823 	subu	v1,v1,t0
  401420:	00031402 	srl	v0,v1,0x10
  401424:	01421023 	subu	v0,t2,v0
  401428:	3063ffff 	andi	v1,v1,0xffff
  40142c:	ac830000 	sw	v1,0(a0)
  401430:	3048ffff 	andi	t0,v0,0xffff
  401434:	14a0fff2 	bnez	a1,401400 <__qdivrem+0x354>
  401438:	2484fffc 	addiu	a0,a0,-4
  40143c:	8d240000 	lw	a0,0(t1)
  401440:	00000000 	nop
  401444:	00881023 	subu	v0,a0,t0
  401448:	3044ffff 	andi	a0,v0,0xffff
  40144c:	00021c02 	srl	v1,v0,0x10
  401450:	10600018 	beqz	v1,4014b4 <__qdivrem+0x408>
  401454:	ad240000 	sw	a0,0(t1)
  401458:	1ae00012 	blez	s7,4014a4 <__qdivrem+0x3f8>
  40145c:	00004021 	move	t0,zero
  401460:	8fa20050 	lw	v0,80(sp)
  401464:	01802021 	move	a0,t4
  401468:	004e3021 	addu	a2,v0,t6
  40146c:	02e02821 	move	a1,s7
  401470:	8c820000 	lw	v0,0(a0)
  401474:	8cc30000 	lw	v1,0(a2)
  401478:	01021021 	addu	v0,t0,v0
  40147c:	00431021 	addu	v0,v0,v1
  401480:	3043ffff 	andi	v1,v0,0xffff
  401484:	24a5ffff 	addiu	a1,a1,-1
  401488:	ac830000 	sw	v1,0(a0)
  40148c:	00024402 	srl	t0,v0,0x10
  401490:	2484fffc 	addiu	a0,a0,-4
  401494:	14a0fff6 	bnez	a1,401470 <__qdivrem+0x3c4>
  401498:	24c6fffc 	addiu	a2,a2,-4
  40149c:	8d240000 	lw	a0,0(t1)
  4014a0:	00000000 	nop
  4014a4:	01041021 	addu	v0,t0,a0
  4014a8:	3042ffff 	andi	v0,v0,0xffff
  4014ac:	ad220000 	sw	v0,0(t1)
  4014b0:	24e7ffff 	addiu	a3,a3,-1
  4014b4:	25ef0001 	addiu	t7,t7,1
  4014b8:	026f102a 	slt	v0,s3,t7
  4014bc:	ada70000 	sw	a3,0(t5)
  4014c0:	25290004 	addiu	t1,t1,4
  4014c4:	25ad0004 	addiu	t5,t5,4
  4014c8:	1040ffad 	beqz	v0,401380 <__qdivrem+0x2d4>
  4014cc:	258c0004 	addiu	t4,t4,4
  4014d0:	12400022 	beqz	s2,40155c <__qdivrem+0x4b0>
  4014d4:	00000000 	nop
  4014d8:	12a00016 	beqz	s5,401534 <__qdivrem+0x488>
  4014dc:	02f32821 	addu	a1,s7,s3
  4014e0:	0265102a 	slt	v0,s3,a1
  4014e4:	10400011 	beqz	v0,40152c <__qdivrem+0x480>
  4014e8:	00051080 	sll	v0,a1,0x2
  4014ec:	00051880 	sll	v1,a1,0x2
  4014f0:	24020010 	li	v0,16
  4014f4:	00553823 	subu	a3,v0,s5
  4014f8:	02833021 	addu	a2,s4,v1
  4014fc:	8cc2fffc 	lw	v0,-4(a2)
  401500:	8cc30000 	lw	v1,0(a2)
  401504:	00e21004 	sllv	v0,v0,a3
  401508:	02a31806 	srlv	v1,v1,s5
  40150c:	3042ffff 	andi	v0,v0,0xffff
  401510:	24a5ffff 	addiu	a1,a1,-1
  401514:	00621825 	or	v1,v1,v0
  401518:	0265202a 	slt	a0,s3,a1
  40151c:	acc30000 	sw	v1,0(a2)
  401520:	1480fff6 	bnez	a0,4014fc <__qdivrem+0x450>
  401524:	24c6fffc 	addiu	a2,a2,-4
  401528:	00051080 	sll	v0,a1,0x2
  40152c:	00541021 	addu	v0,v0,s4
  401530:	ac400000 	sw	zero,0(v0)
  401534:	8fa20014 	lw	v0,20(sp)
  401538:	8fa40018 	lw	a0,24(sp)
  40153c:	00021400 	sll	v0,v0,0x10
  401540:	8fa3001c 	lw	v1,28(sp)
  401544:	00448025 	or	s0,v0,a0
  401548:	8fa20020 	lw	v0,32(sp)
  40154c:	00031c00 	sll	v1,v1,0x10
  401550:	00628825 	or	s1,v1,v0
  401554:	ae510004 	sw	s1,4(s2)
  401558:	ae500000 	sw	s0,0(s2)
  40155c:	8fa2003c 	lw	v0,60(sp)
  401560:	8fa40040 	lw	a0,64(sp)
  401564:	00021400 	sll	v0,v0,0x10
  401568:	8fa30044 	lw	v1,68(sp)
  40156c:	00448025 	or	s0,v0,a0
  401570:	8fa20048 	lw	v0,72(sp)
  401574:	00031c00 	sll	v1,v1,0x10
  401578:	00628825 	or	s1,v1,v0
  40157c:	02201821 	move	v1,s1
  401580:	08100446 	j	401118 <__qdivrem+0x6c>
  401584:	02001021 	move	v0,s0
  401588:	00001821 	move	v1,zero
  40158c:	08100446 	j	401118 <__qdivrem+0x6c>
  401590:	00001021 	move	v0,zero
  401594:	00602821 	move	a1,v1
  401598:	081004f5 	j	4013d4 <__qdivrem+0x328>
  40159c:	3407ffff 	li	a3,0xffff
  4015a0:	27a20024 	addiu	v0,sp,36
  4015a4:	24170004 	li	s7,4
  4015a8:	27be0028 	addiu	s8,sp,40
  4015ac:	081004aa 	j	4012a8 <__qdivrem+0x1fc>
  4015b0:	afa20050 	sw	v0,80(sp)
  4015b4:	24170002 	li	s7,2
  4015b8:	27be0030 	addiu	s8,sp,48
  4015bc:	081004aa 	j	4012a8 <__qdivrem+0x1fc>
  4015c0:	afa20050 	sw	v0,80(sp)
  4015c4:	081004b5 	j	4012d4 <__qdivrem+0x228>
  4015c8:	27b40010 	addiu	s4,sp,16
  4015cc:	081004d8 	j	401360 <__qdivrem+0x2b4>
  4015d0:	0000a821 	move	s5,zero
  4015d4:	00042880 	sll	a1,a0,0x2
  4015d8:	081004c2 	j	401308 <__qdivrem+0x25c>
  4015dc:	27a60038 	addiu	a2,sp,56
