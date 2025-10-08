section	.data
prog db  97, 98, 99, 100, 10, 97, 98, 99, 10, 0
charbuffer db 0					; char variable
borders1 dq 3					; set limit int 
borders2 dq 5					; set limit int
tmp_nbr times 11 db 0				; nbr string temp buffer
nbr times 11 db 0				; nbr string temp buffer
section	.text

	global	_main
	extern	___error

_main:
	call	_dr_quine_01			; call dr_quine
	mov	rax, 0x2000001			; macOS exit syscall
	mov	rdi, 0				; exit status 0
	syscall

_dr_quine_01:

	xor	r15, r15			; r12 = 0
	xor	rcx, rcx			; r12 = 0

	lea	r15, [rel prog]			; r12 = &prog
	mov	r13, [rel borders1]		;
	mov	r14, [rel borders2]		;

	.dr_start_loop:

		mov	dil, [r15 + rcx]	; read byte
		cmp	dil, 0x0		; compare byte and 0
		je	.done			; jmp to end loop
	
		cmp	rcx, r13                ; if rcx < border1
		jl	.print_char
		cmp	rcx, r14                ; if rcx < border2  
		jl	.print_nbr
		jmp	.print_char            ; if rcx >= border2
		
		
	.print_char:
		push	rax			;
		push	rdx			;
		push	rsi			;
		push	rdi			;
		push	rcx			;
		call	_ft_putchar		; print char 
		pop	rcx			;
		pop	rdi			;
		pop	rsi			;
		pop	rdx			;
		pop	rax			;
		jmp     .continue

	.print_nbr:
	
		push	rax			;
		push	rdx			;
		push	rsi			;
		push	rdi			;
		push	rcx			;
		push	rbx			;
		push	r12			;
		mov	dil, byte [r15, rcx]
		call	_ft_putnbr
		mov	rdi, rax		;
		call	_ft_putstr		;
		pop	r12			;
		pop	rbx			;
		pop	rcx			;
		pop	rdi			;
		pop	rsi			;
		pop	rdx			;
		pop	rax			;
		jmp     .continue	

	.continue:
	inc	rcx
	jmp	.dr_start_loop

		
	.done:
	ret

_ft_putchar:

	mov	[rel charbuffer], dil		; store character
	mov	rax, 0x2000004			; syscall number for write on macOS
	mov	rdi, 1				; stdout
	lea	rsi, [rel charbuffer]		; buffer pointer
	mov	rdx, 1				; length

	syscall

	ret


_ft_putnbr:

	xor	rcx, rcx				; index
	xor	r12, r12
	xor	r10, r10				; hold sign 0 unsiged 1 signed nbr
	mov	ebx, 0xA				; hold divisor
	lea	r11, [rel tmp_nbr]			; point r11 to tmp_nbr


	mov	eax, edi
	cmp	eax, 0x0				; compare with zero
	jge	.nbr_loop_start				; jump and handle negative
	neg	eax
	mov	r10, 1

	.nbr_loop_start:
		cdq
		div	ebx				; divide by 10
		add	dl, '0'				; convert number to ascii char
		mov	[r11 + rcx], byte dl		; move reminder to rsi
		inc	rcx				;
		cmp	eax, 0x0			; compare eax and 0
		je	.nbr_loop_end			; jump to nbr_end_loop

		jmp	.nbr_loop_start			; jump to nbr_loop_start

	.nbr_loop_end:
	cmp	r10, 1					; compare if signed
	jne	.nbr_flip_loop_start			; jump and add sign
	mov	[r11 + rcx], byte '-'			; add sign symbol
	inc	rcx

	;flip string
	lea	rsi , [rel nbr]
	.nbr_flip_loop_start:
		cmp	rcx, 0
		je	.nbr_flip_loop_end		; jump to end loop

		mov	al, byte [r11 + rcx - 1]	; copy byte
		mov	[rsi + r12], byte al		; past byte
		inc	r12
		dec	rcx

		jmp	.nbr_flip_loop_start		; jump to nbr filp loop

	.nbr_flip_loop_end:
	mov	[rsi + r12 + 1] , byte 0		; add nil

	mov	rax, rsi				; point rax to nbr
	ret


_ft_putstr:					; function name

	push	rbx				; save rbx
	mov	rbx, rdi			; store the string pointer in rbx
						; first arg is pointed by rdi

	.putstr_loop_start:			; strat of loop

		mov	dl, byte[rbx]		; load the curr rdx
		cmp	dl, 0x0			; compare dl and 0
		je	.putstr_loop_end	; jump to the end of loop

		mov	dil, dl		; store dl byte as arg for putchar in rdi (dil)
		push	rdi
		push	rsi
		push	rdx
		push	rax
		call	_ft_putchar		; sys call to _ft_putchar
		pop	rax
		pop	rdx
		pop	rsi
		pop	rdi

		inc	rbx			; increament rbx

		jmp	.putstr_loop_start	; jump to loop start

	.putstr_loop_end:
	pop	rbx
	ret
