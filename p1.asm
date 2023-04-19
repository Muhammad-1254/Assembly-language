printString MACRO p
lea dx,p
mov ah,9
int 21h    
ENDM

dosseg
.model small
.stack 100h
.data
;;this is only string that are inly print int terminal
gameTitle db 'Tic Tac Toe game is here!$'
init00 db "The first user is 'X' and second user is 'Y'$"


wrongIndex db 'please input correct index $'

printSymbol db 'enter symbol: $' 
printPlace db 'enter place: $'

;///
tempArray0 db '0,1,2$'
tempArray1 db '0,1,2$'
tempArray2 db '0,1,2$'


ind db '012345678'


place db 0
symbol db ?



array db '_________'

.code
;description
main PROC
    
    ;;declare data segment
    mov ax,@data
    mov ds,ax

    ;;;game starting


    ;printitng some strings
    printString gameTitle
    call printNewLine
    printString init00
    call printNewLine


    ;print temporary Array
    printString tempArray0
    call printNewLine
    printString tempArray1
    call printNewLine
    printString tempArray2
    call printNewLine



   

mainLoop:    ;;main method
;;taking place and user symbol

    ;print Symbol 
    printString printSymbol
    ;taking input from user
    call input
    mov symbol,al
    call printNewLine

    ;print place
    printString printPlace
    call input
    mov place,al
    call printNewLine

  
;;///


    ;;assignment
    ; mov si,0
    ; mov dl,place
    ; cbw
    ; add si,dx
    ; mov dl,88
    ; mov array[si],dl
    ; mov dl,array[si]
    ; call printDX

    call printNewLine

    mov si,0
    mov cx,9
    lp:
    mov dl,array[si]
    call printDX
    inc si
    loop lp





    


    



mov ah,4ch
int 21h
main ENDP
 
 ;description
 printNewLine PROC
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h
    ret
 printNewLine ENDP

 ;description
 printDX PROC
    mov ah,2
    int 21h
    ret
 printDX ENDP

 ;description
 input PROC
    mov ah,1
    int 21h
    ret
 input ENDP
end main