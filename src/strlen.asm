	global strlen:

	section .text

strlen:
	xor rax, rax

count:
	cmp BYTE [rdi], 0
	je end
	inc rdi
	inc rax
	jmp count

end:
	ret
