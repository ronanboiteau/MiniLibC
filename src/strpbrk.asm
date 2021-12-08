	global strpbrk:

	section .text

strpbrk:
	xor rcx, rcx
	xor rax, rax

loop:
	movzx r11d, BYTE [rdi + rcx]
	cmp r11d, 0
	je end_null
	jmp check_accept
	inc rcx
	jmp loop

check_accept:
	xor rdx, rdx

loop_accept:
	movzx r10d, BYTE [rsi + rdx]
	cmp r10d, 0
	je back_to_start
	cmp r11d, r10d
	je get_result
	inc rdx
	jmp loop_accept

back_to_start:
	inc rcx
	jmp loop

get_result:
	cmp rcx, 0
	je end
	inc rdi
	dec rcx
	jmp get_result

end_null:
	ret

end:
	mov rax, rdi
	ret
