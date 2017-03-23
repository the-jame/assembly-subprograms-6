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
;   This module's call name: main
;   Language: X86-64
;   Syntax: Intel
;   Date last modified: 2014-nov-6 (source code), 2014-nov-7 (comments added)
;   Purpose: call every function 
;   File name: main.asm
;   Status: In production.  No known errors.
;   Future enhancements:
;Preconditions: must be satisfied before calling this module
; none
;Postconditions: will be satisfied after calling this module
;   rax  pointer to Array
;Translator information
;   Linux: nasm -f elf64 -l main.lis -o main.o main.asm
;References and credits
;   
;Format information
;   Page width: 172 columns
;   Begin comments: 61
;   Optimal print specification: Landscape, 7 points or smaller, monospace, 8½x11 paper
;Permissions
;   The source code is free for use by members of the  programming course.

        extern printf
        extern inputqarray
        extern variance
        extern harmononicmean
        extern sum
        extern outputdataarray
        extern puts
        

        global main_asm     ;Make this program callable by other programs. 

        segment .data
        align 16
        
sumS	db	"The sum of the array is %1.10lf",0xa,0
endS    db      "The assembly program will now terminate and send thr harmonic mean to the driver.",0
varS 	db    	"The variance of the array is %1.10lf",0xa,0
thankS  db      "Thank you this is the array:",0xa,0

	segment  .bss
	
EnteredNumbers resd 1
pArray   resq  10 
Array    resq  11   ;; max 10 + 1

        segment .text 	;Instructions are placed in this segment
main_asm:                    ;Execution of this program will begin here 
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

	mov	esi, 10			; load MAX number
	mov     edi, $Array    ; load address of Arayf
	call	inputqarray
	mov	[EnteredNumbers],eax

	mov	edi, $thankS        ; 
	call	puts
	
	mov	esi,[EnteredNumbers]
	mov	edi, $Array
	call	outputdataarray

	
	mov	esi,[EnteredNumbers]
	mov	edi, $Array
	call	sum

	mov	rdi,$sumS
	mov     eax,1  
	call	printf      ; xmm0 the value`
	
	mov	esi,[EnteredNumbers]
	mov	edi, $Array
	call	variance

	mov	rdi,$varS
	mov     eax,1  
	call	printf      ; xmm0 the value`
	
	mov	esi,[EnteredNumbers]
	mov	edi, $Array
	call	harmononicmean
	movq    rax,xmm0
	push    rax		; save
	
	
	mov	edi, $endS        ; 
	call	puts
	
	pop     rax
	movq    xmm0,rax; return address of Array
	
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
