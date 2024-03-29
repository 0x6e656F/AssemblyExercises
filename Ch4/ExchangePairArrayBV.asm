comment !
        Task:Write a program with a loop and indexed addressing that exchanges every pair of values in an array with an even number of elements.
        Therefore, item i will exchange with item i+1, and item i+2 will exchange with item i+3, and so on.
!
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
Array WORD 1234h,3456h,5678h,7890h
.code
main proc

        mov ECX, (LENGTHOF Array) / 2                                   ;Initialize ECX (Counter)
        mov ESI, 0                                                      ;Initialize ESI (Index)
        L1:

                Push ECX                                                ;Push ECX on to the Stack
                mov ECX, TYPE Array                                     ;Set counter to be the # of byte in each item of the array
                L2:                                                     ;Loop through each byte inside of each item in the array
                        mov AL, BYTE PTR Array[ESI]                     ;mov the current byte into AL
                        xchg BYTE PTR Array[ESI + TYPE Array], AL       ;Exchange the next byte from the next item with AL
                        xchg BYTE PTR Array[ESI], Al                    ;exchange the current byte in current item with AL
                        Inc ESI                                         ;Increment ESI
                Loop L2
                Pop ECX                                                 ;Pop ECX from the Stack
                add ESI, TYPE Array                                     ;Go to the next pair
        Loop L1
        invoke ExitProcess,0
main endp
end main

