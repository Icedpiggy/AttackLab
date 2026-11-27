
dark-log:     file format elf64-x86-64


Disassembly of section .init:

0000000000401510 <_init>:
  401510:	sub    $0x8,%rsp
  401514:	mov    0x200add(%rip),%rax        # 601ff8 <__gmon_start__>
  40151b:	test   %rax,%rax
  40151e:	je     401522 <_init+0x12>
  401520:	call   *%rax
  401522:	add    $0x8,%rsp
  401526:	ret

Disassembly of section .plt:

0000000000401530 <.plt>:
  401530:	push   0x200ad2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401536:	jmp    *0x200ad4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40153c:	nopl   0x0(%rax)

0000000000401540 <puts@plt>:
  401540:	jmp    *0x200ad2(%rip)        # 602018 <puts@GLIBC_2.2.5>
  401546:	push   $0x0
  40154b:	jmp    401530 <.plt>

0000000000401550 <__stack_chk_fail@plt>:
  401550:	jmp    *0x200aca(%rip)        # 602020 <__stack_chk_fail@GLIBC_2.4>
  401556:	push   $0x1
  40155b:	jmp    401530 <.plt>

0000000000401560 <printf@plt>:
  401560:	jmp    *0x200ac2(%rip)        # 602028 <printf@GLIBC_2.2.5>
  401566:	push   $0x2
  40156b:	jmp    401530 <.plt>

0000000000401570 <gets@plt>:
  401570:	jmp    *0x200aba(%rip)        # 602030 <gets@GLIBC_2.2.5>
  401576:	push   $0x3
  40157b:	jmp    401530 <.plt>

0000000000401580 <fflush@plt>:
  401580:	jmp    *0x200ab2(%rip)        # 602038 <fflush@GLIBC_2.2.5>
  401586:	push   $0x4
  40158b:	jmp    401530 <.plt>

Disassembly of section .text:

0000000000401590 <_start>:
  401590:	xor    %ebp,%ebp
  401592:	mov    %rdx,%r9
  401595:	pop    %rsi
  401596:	mov    %rsp,%rdx
  401599:	and    $0xfffffffffffffff0,%rsp
  40159d:	push   %rax
  40159e:	push   %rsp
  40159f:	mov    $0x4018b0,%r8
  4015a6:	mov    $0x401840,%rcx
  4015ad:	mov    $0x4017f5,%rdi
  4015b4:	call   *0x200a36(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  4015ba:	hlt
  4015bb:	nopl   0x0(%rax,%rax,1)

00000000004015c0 <_dl_relocate_static_pie>:
  4015c0:	repz ret
  4015c2:	cs nopw 0x0(%rax,%rax,1)
  4015cc:	nopl   0x0(%rax)

00000000004015d0 <deregister_tm_clones>:
  4015d0:	push   %rbp
  4015d1:	mov    $0x602050,%eax
  4015d6:	cmp    $0x602050,%rax
  4015dc:	mov    %rsp,%rbp
  4015df:	je     4015f8 <deregister_tm_clones+0x28>
  4015e1:	mov    $0x0,%eax
  4015e6:	test   %rax,%rax
  4015e9:	je     4015f8 <deregister_tm_clones+0x28>
  4015eb:	pop    %rbp
  4015ec:	mov    $0x602050,%edi
  4015f1:	jmp    *%rax
  4015f3:	nopl   0x0(%rax,%rax,1)
  4015f8:	pop    %rbp
  4015f9:	ret
  4015fa:	nopw   0x0(%rax,%rax,1)

0000000000401600 <register_tm_clones>:
  401600:	mov    $0x602050,%esi
  401605:	push   %rbp
  401606:	sub    $0x602050,%rsi
  40160d:	mov    %rsp,%rbp
  401610:	sar    $0x3,%rsi
  401614:	mov    %rsi,%rax
  401617:	shr    $0x3f,%rax
  40161b:	add    %rax,%rsi
  40161e:	sar    $1,%rsi
  401621:	je     401638 <register_tm_clones+0x38>
  401623:	mov    $0x0,%eax
  401628:	test   %rax,%rax
  40162b:	je     401638 <register_tm_clones+0x38>
  40162d:	pop    %rbp
  40162e:	mov    $0x602050,%edi
  401633:	jmp    *%rax
  401635:	nopl   (%rax)
  401638:	pop    %rbp
  401639:	ret
  40163a:	nopw   0x0(%rax,%rax,1)

0000000000401640 <__do_global_dtors_aux>:
  401640:	cmpb   $0x0,0x200a11(%rip)        # 602058 <completed.7698>
  401647:	jne    401660 <__do_global_dtors_aux+0x20>
  401649:	push   %rbp
  40164a:	mov    %rsp,%rbp
  40164d:	call   4015d0 <deregister_tm_clones>
  401652:	movb   $0x1,0x2009ff(%rip)        # 602058 <completed.7698>
  401659:	pop    %rbp
  40165a:	ret
  40165b:	nopl   0x0(%rax,%rax,1)
  401660:	repz ret
  401662:	nopl   0x0(%rax)
  401666:	cs nopw 0x0(%rax,%rax,1)

0000000000401670 <frame_dummy>:
  401670:	push   %rbp
  401671:	mov    %rsp,%rbp
  401674:	pop    %rbp
  401675:	jmp    401600 <register_tm_clones>

0000000000401677 <grade_eval>:
  401677:	push   %rbp
  401678:	mov    %rsp,%rbp
  40167b:	sub    $0x20,%rsp
  40167f:	mov    %edi,-0x14(%rbp)
  401682:	mov    %fs:0x28,%rax
  40168b:	mov    %rax,-0x8(%rbp)
  40168f:	xor    %eax,%eax
  401691:	cmpl   $0x4,-0x14(%rbp)
  401695:	jne    4016b0 <grade_eval+0x39>
  401697:	mov    $0x45,%eax
  40169c:	sub    -0x14(%rbp),%eax
  40169f:	mov    %eax,%esi
  4016a1:	mov    $0x4018c8,%edi
  4016a6:	mov    $0x0,%eax
  4016ab:	call   401560 <printf@plt>
  4016b0:	mov    0x200999(%rip),%rax        # 602050 <stdout@GLIBC_2.2.5>
  4016b7:	mov    %rax,%rdi
  4016ba:	call   401580 <fflush@plt>
  4016bf:	nop
  4016c0:	mov    -0x8(%rbp),%rax
  4016c4:	xor    %fs:0x28,%rax
  4016cd:	je     4016d4 <grade_eval+0x5d>
  4016cf:	call   401550 <__stack_chk_fail@plt>
  4016d4:	leave
  4016d5:	ret

00000000004016d6 <input>:
  4016d6:	push   %rbp
  4016d7:	mov    %rsp,%rbp
  4016da:	sub    $0x120,%rsp
  4016e1:	mov    %fs:0x28,%rax
  4016ea:	mov    %rax,-0x8(%rbp)
  4016ee:	xor    %eax,%eax
  4016f0:	movl   $0x0,-0x20(%rbp)
  4016f7:	mov    $0x4018ed,%edi
  4016fc:	call   401540 <puts@plt>
  401701:	lea    -0x120(%rbp),%rax
  401708:	mov    %rax,%rdi
  40170b:	call   401570 <gets@plt>
  401710:	test   %rax,%rax
  401713:	je     4017de <input+0x108>
  401719:	mov    -0x20(%rbp),%eax
  40171c:	cltq
  40171e:	lea    -0x120(%rbp),%rdx
  401725:	sub    $0xffffffffffffff80,%rdx
  401729:	add    %rdx,%rax
  40172c:	mov    -0x120(%rbp),%rdx
  401733:	mov    -0x118(%rbp),%rcx
  40173a:	mov    %rdx,(%rax)
  40173d:	mov    %rcx,0x8(%rax)
  401741:	mov    -0x110(%rbp),%rdx
  401748:	mov    -0x108(%rbp),%rcx
  40174f:	mov    %rdx,0x10(%rax)
  401753:	mov    %rcx,0x18(%rax)
  401757:	mov    -0x100(%rbp),%rdx
  40175e:	mov    -0xf8(%rbp),%rcx
  401765:	mov    %rdx,0x20(%rax)
  401769:	mov    %rcx,0x28(%rax)
  40176d:	mov    -0xf0(%rbp),%rdx
  401774:	mov    -0xe8(%rbp),%rcx
  40177b:	mov    %rdx,0x30(%rax)
  40177f:	mov    %rcx,0x38(%rax)
  401783:	mov    -0xe0(%rbp),%rdx
  40178a:	mov    -0xd8(%rbp),%rcx
  401791:	mov    %rdx,0x40(%rax)
  401795:	mov    %rcx,0x48(%rax)
  401799:	mov    -0xd0(%rbp),%rdx
  4017a0:	mov    -0xc8(%rbp),%rcx
  4017a7:	mov    %rdx,0x50(%rax)
  4017ab:	mov    %rcx,0x58(%rax)
  4017af:	mov    -0xc0(%rbp),%rdx
  4017b6:	mov    -0xb8(%rbp),%rcx
  4017bd:	mov    %rdx,0x60(%rax)
  4017c1:	mov    %rcx,0x68(%rax)
  4017c5:	mov    -0xb0(%rbp),%rdx
  4017cc:	mov    -0xa8(%rbp),%rcx
  4017d3:	mov    %rdx,0x70(%rax)
  4017d7:	mov    %rcx,0x78(%rax)
  4017db:	nop
  4017dc:	jmp    4017df <input+0x109>
  4017de:	nop
  4017df:	mov    -0x8(%rbp),%rax
  4017e3:	xor    %fs:0x28,%rax
  4017ec:	je     4017f3 <input+0x11d>
  4017ee:	call   401550 <__stack_chk_fail@plt>
  4017f3:	leave
  4017f4:	ret

00000000004017f5 <main>:
  4017f5:	push   %rbp
  4017f6:	mov    %rsp,%rbp
  4017f9:	sub    $0x10,%rsp
  4017fd:	mov    %fs:0x28,%rax
  401806:	mov    %rax,-0x8(%rbp)
  40180a:	xor    %eax,%eax
  40180c:	call   4016d6 <input>
  401811:	mov    $0x401902,%edi
  401816:	call   401540 <puts@plt>
  40181b:	mov    $0x0,%eax
  401820:	mov    -0x8(%rbp),%rdx
  401824:	xor    %fs:0x28,%rdx
  40182d:	je     401834 <main+0x3f>
  40182f:	call   401550 <__stack_chk_fail@plt>
  401834:	leave
  401835:	ret
  401836:	cs nopw 0x0(%rax,%rax,1)

0000000000401840 <__libc_csu_init>:
  401840:	push   %r15
  401842:	push   %r14
  401844:	mov    %rdx,%r15
  401847:	push   %r13
  401849:	push   %r12
  40184b:	lea    0x2005be(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  401852:	push   %rbp
  401853:	lea    0x2005be(%rip),%rbp        # 601e18 <__do_global_dtors_aux_fini_array_entry>
  40185a:	push   %rbx
  40185b:	mov    %edi,%r13d
  40185e:	mov    %rsi,%r14
  401861:	sub    %r12,%rbp
  401864:	sub    $0x8,%rsp
  401868:	sar    $0x3,%rbp
  40186c:	call   401510 <_init>
  401871:	test   %rbp,%rbp
  401874:	je     401896 <__libc_csu_init+0x56>
  401876:	xor    %ebx,%ebx
  401878:	nopl   0x0(%rax,%rax,1)
  401880:	mov    %r15,%rdx
  401883:	mov    %r14,%rsi
  401886:	mov    %r13d,%edi
  401889:	call   *(%r12,%rbx,8)
  40188d:	add    $0x1,%rbx
  401891:	cmp    %rbx,%rbp
  401894:	jne    401880 <__libc_csu_init+0x40>
  401896:	add    $0x8,%rsp
  40189a:	pop    %rbx
  40189b:	pop    %rbp
  40189c:	pop    %r12
  40189e:	pop    %r13
  4018a0:	pop    %r14
  4018a2:	pop    %r15
  4018a4:	ret
  4018a5:	nop
  4018a6:	cs nopw 0x0(%rax,%rax,1)

00000000004018b0 <__libc_csu_fini>:
  4018b0:	repz ret

Disassembly of section .fini:

00000000004018b4 <_fini>:
  4018b4:	sub    $0x8,%rsp
  4018b8:	add    $0x8,%rsp
  4018bc:	ret
