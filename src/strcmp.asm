	global strcmp:

	section .text

strcmp:
	mov r10b, BYTE [rdi]
	mov r11b, BYTE [rsi]
	cmp r10b, 0
	je end
	cmp r11b, 0
	je end
	cmp r10b, r11b
	jne end
	inc rdi
	inc rsi
	jmp strcmp

end:
	movzx rax, r10b
	movzx rbx, r11b
	sub rax, rbx
	ret
