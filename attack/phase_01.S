
dark-calc-nx:     file format elf64-x86-64


Disassembly of section .init:

0000000000401620 <_init>:
  401620:	sub    $0x8,%rsp
  401624:	mov    0x2009cd(%rip),%rax        # 601ff8 <__gmon_start__>
  40162b:	test   %rax,%rax
  40162e:	je     401632 <_init+0x12>
  401630:	call   *%rax
  401632:	add    $0x8,%rsp
  401636:	ret

Disassembly of section .plt:

0000000000401640 <.plt>:
  401640:	push   0x2009c2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401646:	jmp    *0x2009c4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40164c:	nopl   0x0(%rax)

0000000000401650 <strcpy@plt>:
  401650:	jmp    *0x2009c2(%rip)        # 602018 <strcpy@GLIBC_2.2.5>
  401656:	push   $0x0
  40165b:	jmp    401640 <.plt>

0000000000401660 <puts@plt>:
  401660:	jmp    *0x2009ba(%rip)        # 602020 <puts@GLIBC_2.2.5>
  401666:	push   $0x1
  40166b:	jmp    401640 <.plt>

0000000000401670 <strlen@plt>:
  401670:	jmp    *0x2009b2(%rip)        # 602028 <strlen@GLIBC_2.2.5>
  401676:	push   $0x2
  40167b:	jmp    401640 <.plt>

0000000000401680 <system@plt>:
  401680:	jmp    *0x2009aa(%rip)        # 602030 <system@GLIBC_2.2.5>
  401686:	push   $0x3
  40168b:	jmp    401640 <.plt>

0000000000401690 <printf@plt>:
  401690:	jmp    *0x2009a2(%rip)        # 602038 <printf@GLIBC_2.2.5>
  401696:	push   $0x4
  40169b:	jmp    401640 <.plt>

00000000004016a0 <memcpy@plt>:
  4016a0:	jmp    *0x20099a(%rip)        # 602040 <memcpy@GLIBC_2.14>
  4016a6:	push   $0x5
  4016ab:	jmp    401640 <.plt>

00000000004016b0 <gets@plt>:
  4016b0:	jmp    *0x200992(%rip)        # 602048 <gets@GLIBC_2.2.5>
  4016b6:	push   $0x6
  4016bb:	jmp    401640 <.plt>

00000000004016c0 <fflush@plt>:
  4016c0:	jmp    *0x20098a(%rip)        # 602050 <fflush@GLIBC_2.2.5>
  4016c6:	push   $0x7
  4016cb:	jmp    401640 <.plt>

00000000004016d0 <memmove@plt>:
  4016d0:	jmp    *0x200982(%rip)        # 602058 <memmove@GLIBC_2.2.5>
  4016d6:	push   $0x8
  4016db:	jmp    401640 <.plt>

00000000004016e0 <exit@plt>:
  4016e0:	jmp    *0x20097a(%rip)        # 602060 <exit@GLIBC_2.2.5>
  4016e6:	push   $0x9
  4016eb:	jmp    401640 <.plt>

Disassembly of section .text:

0000000000401700 <_start>:
  401700:	xor    %ebp,%ebp
  401702:	mov    %rdx,%r9
  401705:	pop    %rsi
  401706:	mov    %rsp,%rdx
  401709:	and    $0xfffffffffffffff0,%rsp
  40170d:	push   %rax
  40170e:	push   %rsp
  40170f:	mov    $0x401a40,%r8
  401716:	mov    $0x4019d0,%rcx
  40171d:	mov    $0x4019b4,%rdi
  401724:	call   *0x2008c6(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  40172a:	hlt
  40172b:	nopl   0x0(%rax,%rax,1)

0000000000401730 <_dl_relocate_static_pie>:
  401730:	repz ret
  401732:	cs nopw 0x0(%rax,%rax,1)
  40173c:	nopl   0x0(%rax)

0000000000401740 <deregister_tm_clones>:
  401740:	push   %rbp
  401741:	mov    $0x602078,%eax
  401746:	cmp    $0x602078,%rax
  40174c:	mov    %rsp,%rbp
  40174f:	je     401768 <deregister_tm_clones+0x28>
  401751:	mov    $0x0,%eax
  401756:	test   %rax,%rax
  401759:	je     401768 <deregister_tm_clones+0x28>
  40175b:	pop    %rbp
  40175c:	mov    $0x602078,%edi
  401761:	jmp    *%rax
  401763:	nopl   0x0(%rax,%rax,1)
  401768:	pop    %rbp
  401769:	ret
  40176a:	nopw   0x0(%rax,%rax,1)

0000000000401770 <register_tm_clones>:
  401770:	mov    $0x602078,%esi
  401775:	push   %rbp
  401776:	sub    $0x602078,%rsi
  40177d:	mov    %rsp,%rbp
  401780:	sar    $0x3,%rsi
  401784:	mov    %rsi,%rax
  401787:	shr    $0x3f,%rax
  40178b:	add    %rax,%rsi
  40178e:	sar    $1,%rsi
  401791:	je     4017a8 <register_tm_clones+0x38>
  401793:	mov    $0x0,%eax
  401798:	test   %rax,%rax
  40179b:	je     4017a8 <register_tm_clones+0x38>
  40179d:	pop    %rbp
  40179e:	mov    $0x602078,%edi
  4017a3:	jmp    *%rax
  4017a5:	nopl   (%rax)
  4017a8:	pop    %rbp
  4017a9:	ret
  4017aa:	nopw   0x0(%rax,%rax,1)

00000000004017b0 <__do_global_dtors_aux>:
  4017b0:	cmpb   $0x0,0x2008d1(%rip)        # 602088 <completed.7698>
  4017b7:	jne    4017d0 <__do_global_dtors_aux+0x20>
  4017b9:	push   %rbp
  4017ba:	mov    %rsp,%rbp
  4017bd:	call   401740 <deregister_tm_clones>
  4017c2:	movb   $0x1,0x2008bf(%rip)        # 602088 <completed.7698>
  4017c9:	pop    %rbp
  4017ca:	ret
  4017cb:	nopl   0x0(%rax,%rax,1)
  4017d0:	repz ret
  4017d2:	nopl   0x0(%rax)
  4017d6:	cs nopw 0x0(%rax,%rax,1)

00000000004017e0 <frame_dummy>:
  4017e0:	push   %rbp
  4017e1:	mov    %rsp,%rbp
  4017e4:	pop    %rbp
  4017e5:	jmp    401770 <register_tm_clones>
  4017e7:	cs nopw 0x0(%rax,%rax,1)
  4017f1:	cs nopw 0x0(%rax,%rax,1)
  4017fb:	nopl   0x0(%rax,%rax,1)

0000000000401800 <pad_no_wrapper>:
	...

0000000000401868 <input>:
  401868:	push   %rbp
  401869:	mov    %rsp,%rbp
  40186c:	sub    $0x10,%rsp
  401870:	mov    $0xf,%esi
  401875:	mov    $0x401a88,%edi
  40187a:	mov    $0x0,%eax
  40187f:	call   401690 <printf@plt>
  401884:	lea    -0x10(%rbp),%rax
  401888:	mov    %rax,%rdi
  40188b:	call   4016b0 <gets@plt>
  401890:	test   %rax,%rax
  401893:	je     4018a0 <input+0x38>
  401895:	lea    -0x10(%rbp),%rax
  401899:	movzbl (%rax),%eax
  40189c:	test   %al,%al
  40189e:	jne    4018b4 <input+0x4c>
  4018a0:	mov    $0x401a70,%edi
  4018a5:	call   401660 <puts@plt>
  4018aa:	mov    $0x0,%edi
  4018af:	call   4016e0 <exit@plt>
  4018b4:	lea    -0x10(%rbp),%rax
  4018b8:	mov    %rax,%rsi
  4018bb:	mov    $0x602090,%edi
  4018c0:	call   401650 <strcpy@plt>
  4018c5:	nop
  4018c6:	leave
  4018c7:	ret

00000000004018c8 <eval>:
  4018c8:	push   %rbp
  4018c9:	mov    %rsp,%rbp
  4018cc:	sub    $0x10,%rsp
  4018d0:	mov    $0x602090,%edi
  4018d5:	call   401670 <strlen@plt>
  4018da:	cmp    $0xf,%rax
  4018de:	ja     4018ec <eval+0x24>
  4018e0:	mov    $0x602090,%edi
  4018e5:	call   401670 <strlen@plt>
  4018ea:	jmp    4018f1 <eval+0x29>
  4018ec:	mov    $0xf,%eax
  4018f1:	mov    %eax,-0x4(%rbp)
  4018f4:	mov    -0x4(%rbp),%eax
  4018f7:	add    $0x1,%eax
  4018fa:	cltq
  4018fc:	mov    $0x602098,%ecx
  401901:	mov    %rax,%rdx
  401904:	mov    $0x602090,%esi
  401909:	mov    %rcx,%rdi
  40190c:	call   4016d0 <memmove@plt>
  401911:	mov    $0x8,%edx
  401916:	mov    $0x401a60,%esi
  40191b:	mov    $0x602090,%edi
  401920:	call   4016a0 <memcpy@plt>
  401925:	mov    -0x4(%rbp),%eax
  401928:	cltq
  40192a:	add    $0x8,%rax
  40192e:	add    $0x602090,%rax
  401934:	movzwl 0x12e(%rip),%edx        # 401a69 <wrapper_back>
  40193b:	mov    %dx,(%rax)
  40193e:	movzbl 0x126(%rip),%edx        # 401a6b <wrapper_back+0x2>
  401945:	mov    %dl,0x2(%rax)
  401948:	mov    $0x602090,%esi
  40194d:	mov    $0x401ab0,%edi
  401952:	mov    $0x0,%eax
  401957:	call   401690 <printf@plt>
  40195c:	mov    $0x602090,%edi
  401961:	call   401680 <system@plt>
  401966:	mov    0x200713(%rip),%rax        # 602080 <stdout@GLIBC_2.2.5>
  40196d:	mov    %rax,%rdi
  401970:	call   4016c0 <fflush@plt>
  401975:	nop
  401976:	leave
  401977:	ret

0000000000401978 <grade_eval>:
  401978:	push   %rbp
  401979:	mov    %rsp,%rbp
  40197c:	sub    $0x10,%rsp
  401980:	mov    %edi,-0x4(%rbp)
  401983:	cmpl   $0x4,-0x4(%rbp)
  401987:	jne    4019a2 <grade_eval+0x2a>
  401989:	mov    $0x45,%eax
  40198e:	sub    -0x4(%rbp),%eax
  401991:	mov    %eax,%esi
  401993:	mov    $0x401ac0,%edi
  401998:	mov    $0x0,%eax
  40199d:	call   401690 <printf@plt>
  4019a2:	mov    0x2006d7(%rip),%rax        # 602080 <stdout@GLIBC_2.2.5>
  4019a9:	mov    %rax,%rdi
  4019ac:	call   4016c0 <fflush@plt>
  4019b1:	nop
  4019b2:	leave
  4019b3:	ret

00000000004019b4 <main>:
  4019b4:	push   %rbp
  4019b5:	mov    %rsp,%rbp
  4019b8:	mov    $0x0,%eax
  4019bd:	call   401868 <input>
  4019c2:	mov    $0x0,%eax
  4019c7:	call   4018c8 <eval>
  4019cc:	jmp    4019b8 <main+0x4>
  4019ce:	xchg   %ax,%ax

00000000004019d0 <__libc_csu_init>:
  4019d0:	push   %r15
  4019d2:	push   %r14
  4019d4:	mov    %rdx,%r15
  4019d7:	push   %r13
  4019d9:	push   %r12
  4019db:	lea    0x20042e(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  4019e2:	push   %rbp
  4019e3:	lea    0x20042e(%rip),%rbp        # 601e18 <__do_global_dtors_aux_fini_array_entry>
  4019ea:	push   %rbx
  4019eb:	mov    %edi,%r13d
  4019ee:	mov    %rsi,%r14
  4019f1:	sub    %r12,%rbp
  4019f4:	sub    $0x8,%rsp
  4019f8:	sar    $0x3,%rbp
  4019fc:	call   401620 <_init>
  401a01:	test   %rbp,%rbp
  401a04:	je     401a26 <__libc_csu_init+0x56>
  401a06:	xor    %ebx,%ebx
  401a08:	nopl   0x0(%rax,%rax,1)
  401a10:	mov    %r15,%rdx
  401a13:	mov    %r14,%rsi
  401a16:	mov    %r13d,%edi
  401a19:	call   *(%r12,%rbx,8)
  401a1d:	add    $0x1,%rbx
  401a21:	cmp    %rbx,%rbp
  401a24:	jne    401a10 <__libc_csu_init+0x40>
  401a26:	add    $0x8,%rsp
  401a2a:	pop    %rbx
  401a2b:	pop    %rbp
  401a2c:	pop    %r12
  401a2e:	pop    %r13
  401a30:	pop    %r14
  401a32:	pop    %r15
  401a34:	ret
  401a35:	nop
  401a36:	cs nopw 0x0(%rax,%rax,1)

0000000000401a40 <__libc_csu_fini>:
  401a40:	repz ret

Disassembly of section .fini:

0000000000401a44 <_fini>:
  401a44:	sub    $0x8,%rsp
  401a48:	add    $0x8,%rsp
  401a4c:	ret
