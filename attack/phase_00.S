
./dark-calc:     file format elf64-x86-64


Disassembly of section .init:

0000000000401770 <_init>:
  401770:	sub    $0x8,%rsp
  401774:	mov    0x20187d(%rip),%rax        # 602ff8 <__gmon_start__>
  40177b:	test   %rax,%rax
  40177e:	je     401782 <_init+0x12>
  401780:	call   *%rax
  401782:	add    $0x8,%rsp
  401786:	ret

Disassembly of section .plt:

0000000000401790 <.plt>:
  401790:	push   0x201872(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401796:	jmp    *0x201874(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40179c:	nopl   0x0(%rax)

00000000004017a0 <strcpy@plt>:
  4017a0:	jmp    *0x201872(%rip)        # 603018 <strcpy@GLIBC_2.2.5>
  4017a6:	push   $0x0
  4017ab:	jmp    401790 <.plt>

00000000004017b0 <puts@plt>:
  4017b0:	jmp    *0x20186a(%rip)        # 603020 <puts@GLIBC_2.2.5>
  4017b6:	push   $0x1
  4017bb:	jmp    401790 <.plt>

00000000004017c0 <strlen@plt>:
  4017c0:	jmp    *0x201862(%rip)        # 603028 <strlen@GLIBC_2.2.5>
  4017c6:	push   $0x2
  4017cb:	jmp    401790 <.plt>

00000000004017d0 <mmap@plt>:
  4017d0:	jmp    *0x20185a(%rip)        # 603030 <mmap@GLIBC_2.2.5>
  4017d6:	push   $0x3
  4017db:	jmp    401790 <.plt>

00000000004017e0 <system@plt>:
  4017e0:	jmp    *0x201852(%rip)        # 603038 <system@GLIBC_2.2.5>
  4017e6:	push   $0x4
  4017eb:	jmp    401790 <.plt>

00000000004017f0 <printf@plt>:
  4017f0:	jmp    *0x20184a(%rip)        # 603040 <printf@GLIBC_2.2.5>
  4017f6:	push   $0x5
  4017fb:	jmp    401790 <.plt>

0000000000401800 <fprintf@plt>:
  401800:	jmp    *0x201842(%rip)        # 603048 <fprintf@GLIBC_2.2.5>
  401806:	push   $0x6
  40180b:	jmp    401790 <.plt>

0000000000401810 <memcpy@plt>:
  401810:	jmp    *0x20183a(%rip)        # 603050 <memcpy@GLIBC_2.14>
  401816:	push   $0x7
  40181b:	jmp    401790 <.plt>

0000000000401820 <gets@plt>:
  401820:	jmp    *0x201832(%rip)        # 603058 <gets@GLIBC_2.2.5>
  401826:	push   $0x8
  40182b:	jmp    401790 <.plt>

0000000000401830 <fflush@plt>:
  401830:	jmp    *0x20182a(%rip)        # 603060 <fflush@GLIBC_2.2.5>
  401836:	push   $0x9
  40183b:	jmp    401790 <.plt>

0000000000401840 <munmap@plt>:
  401840:	jmp    *0x201822(%rip)        # 603068 <munmap@GLIBC_2.2.5>
  401846:	push   $0xa
  40184b:	jmp    401790 <.plt>

0000000000401850 <memmove@plt>:
  401850:	jmp    *0x20181a(%rip)        # 603070 <memmove@GLIBC_2.2.5>
  401856:	push   $0xb
  40185b:	jmp    401790 <.plt>

0000000000401860 <mprotect@plt>:
  401860:	jmp    *0x201812(%rip)        # 603078 <mprotect@GLIBC_2.2.5>
  401866:	push   $0xc
  40186b:	jmp    401790 <.plt>

0000000000401870 <perror@plt>:
  401870:	jmp    *0x20180a(%rip)        # 603080 <perror@GLIBC_2.2.5>
  401876:	push   $0xd
  40187b:	jmp    401790 <.plt>

0000000000401880 <exit@plt>:
  401880:	jmp    *0x201802(%rip)        # 603088 <exit@GLIBC_2.2.5>
  401886:	push   $0xe
  40188b:	jmp    401790 <.plt>

Disassembly of section .text:

0000000000401890 <_start>:
  401890:	xor    %ebp,%ebp
  401892:	mov    %rdx,%r9
  401895:	pop    %rsi
  401896:	mov    %rsp,%rdx
  401899:	and    $0xfffffffffffffff0,%rsp
  40189d:	push   %rax
  40189e:	push   %rsp
  40189f:	mov    $0x401ca0,%r8
  4018a6:	mov    $0x401c30,%rcx
  4018ad:	mov    $0x401c0e,%rdi
  4018b4:	call   *0x201736(%rip)        # 602ff0 <__libc_start_main@GLIBC_2.2.5>
  4018ba:	hlt
  4018bb:	nopl   0x0(%rax,%rax,1)

00000000004018c0 <_dl_relocate_static_pie>:
  4018c0:	repz ret
  4018c2:	cs nopw 0x0(%rax,%rax,1)
  4018cc:	nopl   0x0(%rax)

00000000004018d0 <deregister_tm_clones>:
  4018d0:	push   %rbp
  4018d1:	mov    $0x6030a0,%eax
  4018d6:	cmp    $0x6030a0,%rax
  4018dc:	mov    %rsp,%rbp
  4018df:	je     4018f8 <deregister_tm_clones+0x28>
  4018e1:	mov    $0x0,%eax
  4018e6:	test   %rax,%rax
  4018e9:	je     4018f8 <deregister_tm_clones+0x28>
  4018eb:	pop    %rbp
  4018ec:	mov    $0x6030a0,%edi
  4018f1:	jmp    *%rax
  4018f3:	nopl   0x0(%rax,%rax,1)
  4018f8:	pop    %rbp
  4018f9:	ret
  4018fa:	nopw   0x0(%rax,%rax,1)

0000000000401900 <register_tm_clones>:
  401900:	mov    $0x6030a0,%esi
  401905:	push   %rbp
  401906:	sub    $0x6030a0,%rsi
  40190d:	mov    %rsp,%rbp
  401910:	sar    $0x3,%rsi
  401914:	mov    %rsi,%rax
  401917:	shr    $0x3f,%rax
  40191b:	add    %rax,%rsi
  40191e:	sar    $1,%rsi
  401921:	je     401938 <register_tm_clones+0x38>
  401923:	mov    $0x0,%eax
  401928:	test   %rax,%rax
  40192b:	je     401938 <register_tm_clones+0x38>
  40192d:	pop    %rbp
  40192e:	mov    $0x6030a0,%edi
  401933:	jmp    *%rax
  401935:	nopl   (%rax)
  401938:	pop    %rbp
  401939:	ret
  40193a:	nopw   0x0(%rax,%rax,1)

0000000000401940 <__do_global_dtors_aux>:
  401940:	cmpb   $0x0,0x201781(%rip)        # 6030c8 <completed.7698>
  401947:	jne    401960 <__do_global_dtors_aux+0x20>
  401949:	push   %rbp
  40194a:	mov    %rsp,%rbp
  40194d:	call   4018d0 <deregister_tm_clones>
  401952:	movb   $0x1,0x20176f(%rip)        # 6030c8 <completed.7698>
  401959:	pop    %rbp
  40195a:	ret
  40195b:	nopl   0x0(%rax,%rax,1)
  401960:	repz ret
  401962:	nopl   0x0(%rax)
  401966:	cs nopw 0x0(%rax,%rax,1)

0000000000401970 <frame_dummy>:
  401970:	push   %rbp
  401971:	mov    %rsp,%rbp
  401974:	pop    %rbp
  401975:	jmp    401900 <register_tm_clones>

0000000000401977 <input>:
  401977:	push   %rbp
  401978:	mov    %rsp,%rbp
  40197b:	sub    $0x10,%rsp
  40197f:	mov    $0xf,%esi
  401984:	mov    $0x401ce8,%edi
  401989:	mov    $0x0,%eax
  40198e:	call   4017f0 <printf@plt>
  401993:	lea    -0x10(%rbp),%rax
  401997:	mov    %rax,%rdi
  40199a:	call   401820 <gets@plt>
  40199f:	test   %rax,%rax
  4019a2:	je     4019af <input+0x38>
  4019a4:	lea    -0x10(%rbp),%rax
  4019a8:	movzbl (%rax),%eax
  4019ab:	test   %al,%al
  4019ad:	jne    4019c3 <input+0x4c>
  4019af:	mov    $0x401cd0,%edi
  4019b4:	call   4017b0 <puts@plt>
  4019b9:	mov    $0x0,%edi
  4019be:	call   401880 <exit@plt>
  4019c3:	lea    -0x10(%rbp),%rax
  4019c7:	mov    %rax,%rsi
  4019ca:	mov    $0x6030d0,%edi
  4019cf:	call   4017a0 <strcpy@plt>
  4019d4:	nop
  4019d5:	leave
  4019d6:	ret

00000000004019d7 <eval>:
  4019d7:	push   %rbp
  4019d8:	mov    %rsp,%rbp
  4019db:	sub    $0x10,%rsp
  4019df:	mov    $0x6030d0,%edi
  4019e4:	call   4017c0 <strlen@plt>
  4019e9:	cmp    $0xf,%rax
  4019ed:	ja     4019fb <eval+0x24>
  4019ef:	mov    $0x6030d0,%edi
  4019f4:	call   4017c0 <strlen@plt>
  4019f9:	jmp    401a00 <eval+0x29>
  4019fb:	mov    $0xf,%eax
  401a00:	mov    %eax,-0x4(%rbp)
  401a03:	mov    -0x4(%rbp),%eax
  401a06:	add    $0x1,%eax
  401a09:	cltq
  401a0b:	mov    $0x6030d8,%ecx
  401a10:	mov    %rax,%rdx
  401a13:	mov    $0x6030d0,%esi
  401a18:	mov    %rcx,%rdi
  401a1b:	call   401850 <memmove@plt>
  401a20:	mov    $0x8,%edx
  401a25:	mov    $0x401cc0,%esi
  401a2a:	mov    $0x6030d0,%edi
  401a2f:	call   401810 <memcpy@plt>
  401a34:	mov    -0x4(%rbp),%eax
  401a37:	cltq
  401a39:	add    $0x8,%rax
  401a3d:	add    $0x6030d0,%rax
  401a43:	movzwl 0x27f(%rip),%edx        # 401cc9 <wrapper_back>
  401a4a:	mov    %dx,(%rax)
  401a4d:	movzbl 0x277(%rip),%edx        # 401ccb <wrapper_back+0x2>
  401a54:	mov    %dl,0x2(%rax)
  401a57:	mov    $0x6030d0,%esi
  401a5c:	mov    $0x401d10,%edi
  401a61:	mov    $0x0,%eax
  401a66:	call   4017f0 <printf@plt>
  401a6b:	mov    $0x6030d0,%edi
  401a70:	call   4017e0 <system@plt>
  401a75:	mov    0x201624(%rip),%rax        # 6030a0 <stdout@GLIBC_2.2.5>
  401a7c:	mov    %rax,%rdi
  401a7f:	call   401830 <fflush@plt>
  401a84:	nop
  401a85:	leave
  401a86:	ret

0000000000401a87 <grade_eval>:
  401a87:	push   %rbp
  401a88:	mov    %rsp,%rbp
  401a8b:	sub    $0x10,%rsp
  401a8f:	mov    %edi,-0x4(%rbp)
  401a92:	cmpl   $0x4,-0x4(%rbp)
  401a96:	jne    401ab1 <grade_eval+0x2a>
  401a98:	mov    $0x45,%eax
  401a9d:	sub    -0x4(%rbp),%eax
  401aa0:	mov    %eax,%esi
  401aa2:	mov    $0x401d20,%edi
  401aa7:	mov    $0x0,%eax
  401aac:	call   4017f0 <printf@plt>
  401ab1:	mov    0x2015e8(%rip),%rax        # 6030a0 <stdout@GLIBC_2.2.5>
  401ab8:	mov    %rax,%rdi
  401abb:	call   401830 <fflush@plt>
  401ac0:	nop
  401ac1:	leave
  401ac2:	ret

0000000000401ac3 <main>:
  401ac3:	push   %rbp
  401ac4:	mov    %rsp,%rbp
  401ac7:	mov    $0x0,%eax
  401acc:	call   401977 <input>
  401ad1:	mov    $0x0,%eax
  401ad6:	call   4019d7 <eval>
  401adb:	jmp    401ac7 <main+0x4>

0000000000401add <init_fixed_stack>:
  401add:	push   %rbp
  401ade:	mov    %rsp,%rbp
  401ae1:	sub    $0x20,%rsp
  401ae5:	movq   $0x802000,-0x8(%rbp)
  401aed:	mov    -0x8(%rbp),%rax
  401af1:	mov    $0x0,%r9d
  401af7:	mov    $0xffffffff,%r8d
  401afd:	mov    $0x100022,%ecx
  401b02:	mov    $0x7,%edx
  401b07:	mov    %rax,%rsi
  401b0a:	movabs $0x721000000000,%rdi
  401b14:	call   4017d0 <mmap@plt>
  401b19:	mov    %rax,-0x10(%rbp)
  401b1d:	cmpq   $0xffffffffffffffff,-0x10(%rbp)
  401b22:	jne    401b38 <init_fixed_stack+0x5b>
  401b24:	mov    $0x401d48,%edi
  401b29:	call   401870 <perror@plt>
  401b2e:	mov    $0x1,%edi
  401b33:	call   401880 <exit@plt>
  401b38:	movabs $0x721000000000,%rax
  401b42:	cmp    %rax,-0x10(%rbp)
  401b46:	je     401b8c <init_fixed_stack+0xaf>
  401b48:	mov    0x201571(%rip),%rax        # 6030c0 <stderr@GLIBC_2.2.5>
  401b4f:	mov    -0x10(%rbp),%rdx
  401b53:	movabs $0x721000000000,%rcx
  401b5d:	mov    $0x401d70,%esi
  401b62:	mov    %rax,%rdi
  401b65:	mov    $0x0,%eax
  401b6a:	call   401800 <fprintf@plt>
  401b6f:	mov    -0x8(%rbp),%rdx
  401b73:	mov    -0x10(%rbp),%rax
  401b77:	mov    %rdx,%rsi
  401b7a:	mov    %rax,%rdi
  401b7d:	call   401840 <munmap@plt>
  401b82:	mov    $0x1,%edi
  401b87:	call   401880 <exit@plt>
  401b8c:	mov    -0x10(%rbp),%rax
  401b90:	mov    %rax,-0x18(%rbp)
  401b94:	mov    -0x18(%rbp),%rax
  401b98:	add    $0x801000,%rax
  401b9e:	mov    %rax,-0x20(%rbp)
  401ba2:	mov    -0x18(%rbp),%rax
  401ba6:	mov    $0x0,%edx
  401bab:	mov    $0x1000,%esi
  401bb0:	mov    %rax,%rdi
  401bb3:	call   401860 <mprotect@plt>
  401bb8:	cmp    $0xffffffff,%eax
  401bbb:	jne    401bd1 <init_fixed_stack+0xf4>
  401bbd:	mov    $0x401da0,%edi
  401bc2:	call   401870 <perror@plt>
  401bc7:	mov    $0x1,%edi
  401bcc:	call   401880 <exit@plt>
  401bd1:	mov    -0x20(%rbp),%rax
  401bd5:	mov    $0x0,%edx
  401bda:	mov    $0x1000,%esi
  401bdf:	mov    %rax,%rdi
  401be2:	call   401860 <mprotect@plt>
  401be7:	cmp    $0xffffffff,%eax
  401bea:	jne    401c00 <init_fixed_stack+0x123>
  401bec:	mov    $0x401dc0,%edi
  401bf1:	call   401870 <perror@plt>
  401bf6:	mov    $0x1,%edi
  401bfb:	call   401880 <exit@plt>
  401c00:	mov    -0x20(%rbp),%rax
  401c04:	mov    %rax,0x2014e5(%rip)        # 6030f0 <fixed_stack_top>
  401c0b:	nop
  401c0c:	leave
  401c0d:	ret

0000000000401c0e <__wrap_main>:
  401c0e:	push   %r12
  401c10:	mov    %rsp,%r12
  401c13:	mov    0x2014d6(%rip),%rsp        # 6030f0 <fixed_stack_top>
  401c1a:	call   401ac3 <main>
  401c1f:	mov    %r12,%rsp
  401c22:	pop    %r12
  401c24:	ret
  401c25:	cs nopw 0x0(%rax,%rax,1)
  401c2f:	nop

0000000000401c30 <__libc_csu_init>:
  401c30:	push   %r15
  401c32:	push   %r14
  401c34:	mov    %rdx,%r15
  401c37:	push   %r13
  401c39:	push   %r12
  401c3b:	lea    0x2011c6(%rip),%r12        # 602e08 <__frame_dummy_init_array_entry>
  401c42:	push   %rbp
  401c43:	lea    0x2011ce(%rip),%rbp        # 602e18 <__do_global_dtors_aux_fini_array_entry>
  401c4a:	push   %rbx
  401c4b:	mov    %edi,%r13d
  401c4e:	mov    %rsi,%r14
  401c51:	sub    %r12,%rbp
  401c54:	sub    $0x8,%rsp
  401c58:	sar    $0x3,%rbp
  401c5c:	call   401770 <_init>
  401c61:	test   %rbp,%rbp
  401c64:	je     401c86 <__libc_csu_init+0x56>
  401c66:	xor    %ebx,%ebx
  401c68:	nopl   0x0(%rax,%rax,1)
  401c70:	mov    %r15,%rdx
  401c73:	mov    %r14,%rsi
  401c76:	mov    %r13d,%edi
  401c79:	call   *(%r12,%rbx,8)
  401c7d:	add    $0x1,%rbx
  401c81:	cmp    %rbx,%rbp
  401c84:	jne    401c70 <__libc_csu_init+0x40>
  401c86:	add    $0x8,%rsp
  401c8a:	pop    %rbx
  401c8b:	pop    %rbp
  401c8c:	pop    %r12
  401c8e:	pop    %r13
  401c90:	pop    %r14
  401c92:	pop    %r15
  401c94:	ret
  401c95:	nop
  401c96:	cs nopw 0x0(%rax,%rax,1)

0000000000401ca0 <__libc_csu_fini>:
  401ca0:	repz ret

Disassembly of section .fini:

0000000000401ca4 <_fini>:
  401ca4:	sub    $0x8,%rsp
  401ca8:	add    $0x8,%rsp
  401cac:	ret
