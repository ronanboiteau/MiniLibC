	global memmove:

	section .text

memmove:
	push r13
	xor rcx, rcx

copy:
	cmp rdx, rcx
	je dec_loop
 	mov r10b, BYTE [rsi + rcx]
 	mov [r13], r10b
	inc r13
	inc rcx
	jmp copy

dec_loop:
	cmp rcx, 0
	je init_loop
	dec rcx
	dec r13
	jmp dec_loop

init_loop:
	xor rcx, rcx

loop:
	cmp rdx, rcx
	je decrement_rdi
 	mov r11b, BYTE [r13 + rcx]
 	mov [rdi], r11b
	inc rdi
	inc rcx
	jmp loop

decrement_rdi:
	cmp rcx, 0
	je end
	dec rdi
	dec rcx
	jmp decrement_rdi

end:
	mov rax, rdi
	pop r13
	ret
