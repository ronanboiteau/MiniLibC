	global rindex:

	section .text

rindex:
	xor rax, rax
	xor rcx, rcx

str_goto_end:
	mov r10b, [rdi + rcx]
	cmp r10b, 0
	je find
	inc rcx
	jmp str_goto_end

find:
	mov r10b, [rdi + rcx]
	cmp rcx, -1
	je reached_end
	cmp r10b, sil
	je result
	dec rcx
	jmp find

reached_end:
	cmp sil, 0
	jne end_null
	jmp result

result:
	cmp rcx, 0
	je end
	inc rdi
	dec rcx
	jmp result

end_null:
	ret

end:
	mov rax, rdi
	ret
