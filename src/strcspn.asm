	global strcspn:

	section .text

strcspn:
	xor rcx, rcx

loop:
	movzx r11d, BYTE [rdi + rcx]
	cmp r11d, 0
	je end
	jmp check_reject
	inc rcx
	jmp loop

check_reject:
	xor rdx, rdx

loop_reject:
	movzx r8d, BYTE [rsi + rdx]
	cmp r8d, 0
	je back_to_start
	cmp r11d, r8d
	je end
	inc rdx
	jmp loop_reject

back_to_start:
	inc rcx
	jmp loop

end:
	mov rax, rcx
	ret
