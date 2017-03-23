;Author information
;   Author name: Harley Davidson
;   Author email: harley@yahoo.com
;   Author location: Palm Springs, California
;Course information
;   Course number:
;   Assignment number: 
;   Due date: 2014-Nov-06
;Project information
;   Project title: Arrays and Functions
;   Purpose: to learn more about calling subprograms and how data, especially arrays, are passed to subprograms
;   Status:  
;   Project files: driver.c main.asm main.c inputqarray.asm initializepointerarray.asm swap.asm sortbypointers.c outputdataarray.c outputviapointer.c driver.c sum.asm
;   Background: 
;   Project references: 
;   This module's call name: inputqarray
;   Language: X86-64
;   Syntax: Intel
;   Date last modified: 2014-nov-6 (source code), 2014-nov-7 (comments added)
;   Purpose: input qarray 
;   File name: inputqarray.asm
;   Status: In production.  No known errors.
;   Future enhancements:
;Preconditions: must be satisfied before calling this module
; edi  - pointer to Array
; esi   - Max Number
;Postconditions: will be satisfied after calling this module
;   eax  - entered number
;Translator information
;   Linux: nasm -f elf64 -l inputqarray.lis -o inputqarray.o inputqarray.asm
;References and credits
;   
;Format information
;   Page width: 172 columns
;   Begin comments: 61
;   Optimal print specification: Landscape, 7 points or smaller, monospace, 8½x11 paper
;Permissions
;   The source code is free for use by members of the  programming course.


	extern printf                                              ;This subprogram will be linked later
	extern __isoc99_scanf
	extern getchar

        global input     ;Make this program callable by other programs. 

        
        segment .data
        align 16
question	db	0xa,"Do you have data to enter into the array (Y or N)?",0
	
enterS   db	"Enter the next float number:",0
frmscan db	"%lf",0
newLine db      0xa,0        
        
        
        segment .text 	;Instructions are placed in this segment
input:                    ;Execution of this program will begin here 
         align 16       ;Start the next instruction on a 16-byte boundary

;=========== Back up all the GPRs whether used in this program ==

	push       rbp                                              ;Save a copy of the stack base pointer^M
	mov        rbp, rsp                                         ;We do this in order to be 100 compatible with C
	push       rbx                                              ;Back up rbx^M
	push       rcx                                              ;Back up rcx^M
	push       rdx                                              ;Back up rdx^M
	push       rsi                                              ;Back up rsi^M
	push       rdi                                              ;Back up rdi^M
	push       r8                                               ;Back up r8^M
        push       r9                                               ;Back up r9^M
	push       r10                                              ;Back up r10^M
	push       r11                                              ;Back up r11^M
	push       r12                                              ;Back up r12^M
	push       r13                                              ;Back up r13^M
	push       r14                                              ;Back up r14^M
	push       r15                                              ;Back up r15^M
	pushf                                                       ;Back up rflags^M

; edi  - pointer to Array
; esi   - Max Number
; 	
	mov     r13,rdi			; save pointer to r13
	mov     r14,rsi			; save counter to r14
	xor     r12,r12                 ; use r12 for countter set to 0
_loop1:
	mov	edi, question		; load address of string
	call	printf			
	
	call	getchar		; call getchar
; eax  - return char
	mov     ebx,eax   ; save the char in ebx 
; remove all char from input
_loop2:	
	call	getchar
	cmp	eax,0xA
	jne	_loop2
	
	
	cmp	bl, 'N'   ; check for N or Y
	je	_loop3
	cmp	bl,'Y'
	jne	_loop1
	
_loop3:	  
	cmp	bl,'N'     ; if N end`
	je	_endL
	mov	edi, enterS    
	call	printf
	
	mov	rsi, r13 
	mov	edi, frmscan 
	xor     eax, eax
	call	__isoc99_scanf

_loop4:
	call	getchar
	cmp	eax,0xa
	jne	_loop4
	
	mov	edi, newLine
	call	printf

	
	inc	r12
	add	r13, 8

	cmp	r12,r14 
	jl	_loop1
	jmp     _endL1

_endL:
        xor     rbx,rbx
	mov	[r13] , rbx 

_endL1:
	mov     rax , r12
	
	
	  
       ;=========== Restore GPR values and return to the caller ===
;===================================================================

	popf                                                        ;Restore rflags
	pop        r15                                              ;Restore r15
	pop        r14                                              ;Restore r14
	pop        r13                                              ;Restore r13
	pop        r12                                              ;Restore r12
	pop        r11                                              ;Restore r11
	pop        r10                                              ;Restore r10
	pop        r9                                               ;Restore r9
	pop        r8                                               ;Restore r8
	pop        rdi                                              ;Restore rdi
	pop        rsi                                              ;Restore rsi
	pop        rdx                                              ;Restore rdx
	pop        rcx                                              ;Restore rcx
	pop        rbx                                              ;Restore rbx
	pop        rbp                                              ;Restore rbp

	ret                                                         ;Pop the integer stack and resume execution 
				;at the address that was popped from the stack.
