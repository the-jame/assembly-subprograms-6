;Author information
;   Author name: Harley Davidson
;   Author email: harley@yahoo.com
;   Author location: Palm Springs, California
;Course information
;   Course number:
;   Assignment number: 
;   Due date: 2014-Nov-21
;Project information
;   Project title: Standard Deviation
;   Purpose: to learn more about calling subprograms and how data, especially arrays, are passed to subprograms
;   Status:  
;   Project files: driver.c harmonirmean.c inputqarray.asm 
;			main.asm mean.asm outputdataarray.c reciprocals.asm  
;			sum.asm variance.cpp
;   Background: 
;   Project references: 
;   This module's call name: reciprocals
;   Language: X86-64
;   Syntax: Intel
;   Date last modified: 2014-nov-21 (source code), 2014-nov-21 (comments added)
;   Purpose: calc reciprocals
;   File name: reciprocals.asm
;   Status: In production.  No known errors.
;   Future enhancements:
;Preconditions: must be satisfied before calling this module
;   The pointer of Array is in rdi
;   The Number of digit in Array in esi
;Postconditions: will be satisfied after calling this module
;   The mean in xmm0
;Translator information
;   Linux: nasm -f elf64 -l reciprocals.lis -o reciprocals.o reciprocals.asm
;References and credits
;   
;Format information
;   Page width: 172 columns
;   Begin comments: 61
;   Optimal print specification: Landscape, 7 points or smaller, monospace, 8½x11 paper
;Permissions
;   The source code is free for use by members of the  programming course.



        global reciprocals     ;Make this program callable by other programs. 

        segment .text 	;Instructions are placed in this segment
reciprocals:                    ;Execution of this program will begin here 
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

; rdi  - pIn
; rsi   -pOut
; rdx  - numbers
; 
	mov  eax,1
	cvtsi2sd xmm2,eax  
	xor  eax,eax
	jmp  chk_loop
loop1:
	
	movsd  xmm1,[rdi]
	movsd  xmm0,xmm2
	divsd  xmm0,xmm1
	movsd  [rsi],xmm0
	add  rsi,8
	add  rdi,8
	inc  eax
chk_loop:
        cmp  edx,eax
        jg   loop1
	
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
