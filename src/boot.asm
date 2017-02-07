global start

section .text ; default section for executable code
bits 32 ; states that the following instructions are 32-bit
start:
	; print 'OK'
	mov dword [0xb8000], 0x2f4b2f4f ; move 0x2f... to address b8000
	hlt ; halt

error:
	; Error handling routine. Put error text in 'al'.
	; Colour-code 4f and 'ERR' -> beginning of VGA buffer
	mov dword [0xb8000], 0x4f524f45 
	mov dword [0xb8004], 0x4f3a4f52 
	mov dword [0xb8008], 0x4f204f20
	; Error message.
	mov byte [0xb800a], al
	hlt
