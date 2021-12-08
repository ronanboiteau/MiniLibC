	global memset:

	section .text

memset:
	xor rcx, rcx

set:
	cmp rdx, rcx
	jle decrement_rdi
	mov [rdi], sil
	inc rdi
	inc rcx
	jmp set

decrement_rdi:
	cmp rcx, 0
	je end
	dec rdi
	dec rcx
	jmp decrement_rdi

end:
	mov rax, rdi
	ret
