section	.text

	global	_start

_start:
	call	create_file
	cmp	rax, 1
	je	.terminate			; x = 0
	;call	dr_quine_01
	.terminate:
	;mov	rax, 60	
	mov	rdi, rax
	mov	rax, 0x2000001	
	syscall

create_file:
	mov	rax, [rel X]
	cmp	rax, 0
	je	.return
	dec	rax
	add	rax, 48
	lea	rdi, [rel filename]
	mov	[rdi + 6], byte al
	;mov	rax, 2
	mov	rax,  0x2000005
	lea	rdi, [rel filename]
	mov	rsi, 0x601
	mov	rdx, 0o644
	syscall
	ret
	.return:
	mov	rax, 1
	ret

dr_quine_01:

	xor	r15, r15
	xor	r9, r9
	xor	rcx, rcx

	lea	r15, [rel prog]
	mov	r13, [rel borders1]
	mov	r14, [rel borders2]

	.dr_start_loop:

		mov	dil, [r15 + rcx]
		cmp	dil, 0
		je	.done

		cmp	r9, 0
		je	.print_char
		jmp	.print_nbr

	.print_char:
		cmp	rcx, r13
		je	.reprint
		push	rax
		push	rdx
		push	rsi
		push	rdi
		push	rcx
		call	ft_putchar
		pop	rcx
		pop	rdi
		pop	rsi
		pop	rdx
		pop	rax
		jmp     .continue

	.print_nbr:

		push	rax
		push	rsi
		push	rdi
		push	rdx
		push	rcx
		call	ft_putnbr
		cmp	rcx, 4053
		je	.move
		mov	dil, 44
		call	ft_putchar
		mov	dil, 32
		call	ft_putchar
		.move:
		pop	rcx
		pop	rdx
		pop	rdi
		pop	rsi
		pop	rax
		jmp     .continue

		.reprint:
		mov	rcx,0; [rel borders1]
		;inc	rcx
		mov	r9, 1
		jmp	.dr_start_loop


	.continue:
	inc	rcx
	jmp	.dr_start_loop

	.done:
	mov	dil, 10
	call	ft_putchar
	mov	dil, 10
	call	ft_putchar
	ret


ft_putnbr:

	push	rbx
	push	rcx
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	xor	r14, r14
	xor	r12, r12
	xor	r10, r10
	mov	ebx, 0xA
	lea	r11, [rel tmp_nbr]


	mov	eax, edi
	cmp	eax, 0x0
	jge	.nbr_loop_start
	cmp	eax, -2147483648
	je	.handle_min_int
	neg	eax
	mov	r10, 1
	jmp	.nbr_loop_start

	.handle_min_int:
	mov	r10, 1
	lea	rsi, [rel nbr]
	mov	dword [rsi], "-214"
	mov	dword [rsi+4], "7483"
	mov	dword [rsi+8], "648"
	mov	byte [rsi+11], 0
	mov	rax, rsi
	jmp	.return

	.nbr_loop_start:
		cdq
		div	ebx
		add	dl, '0'
		mov	[r11 + r14], byte dl
		inc	r14
		cmp	eax, 0x0
		je	.nbr_loop_end

		jmp	.nbr_loop_start

	.nbr_loop_end:
	lea	rsi , [rel nbr]
	cmp	r10, 1
	jne	.nbr_flip_loop_start
	mov	[r11 + r14], byte '-'
	inc	r14

	;flip string
	.nbr_flip_loop_start:
		cmp	r14, 0
		je	.nbr_flip_loop_end

		mov	r13b, byte [r11 + r14 - 1]
		mov	[rsi + r12], byte r13b
		inc	r12
		dec	r14

		jmp	.nbr_flip_loop_start

	.nbr_flip_loop_end:
	mov	[rsi + r12] , byte 0
	mov	rax, rsi
	;print nbr
	push	r12
	xor	r12, r12

	.putstr_loop_start:

		mov	dl, byte[rsi + r12]
		cmp	dl, 0x0
		je	.putstr_loop_end

		mov	dil, dl
		push	rdi
		push	rsi
		push	rdx
		push	rax
		call	ft_putchar
		pop	rax
		pop	rdx
		pop	rsi
		pop	rdi

		inc	r12

		jmp	.putstr_loop_start

	.putstr_loop_end:
	pop	r12

	.return:
	pop	r14
	pop	r13
	pop	r12
	pop	r11
	pop	r10
	pop	rcx
	pop	rbx
	ret


ft_putchar:

	mov	[rel charbuffer], dil
	mov	rax, 1
	mov	rdi, 1
	lea	rsi, [rel charbuffer]
	mov	rdx, 1

	syscall

	ret


section	.data
charbuffer db 0					; char variable
borders1 dq 4052				; set limit int
borders2 dq 8054				; set limit int
tmp_nbr times 12 db 0				; nbr string temp buffer
nbr_sp_cln db 44, 32, 0
nbr times 12 db 0				; nbr string temp buffer
filename db "Selly_X.c", 0
fd dq 0
X dq 1						; file nbr
prog db 0
