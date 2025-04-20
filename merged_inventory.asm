
.MODEL SMALL
.STACK 100H

.DATA

    menuHeader 	DB 10, 13, "	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				DB 10, 13, "	||              Inventory Management System               ||"
				DB 10, 13, "	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				DB 10, 13, '	||        1. Update Products Information                  ||'                   
				DB 10, 13, '	||        2. View All Product                             ||'
				DB 10, 13, '	||        3. Exit                                         ||'
				DB 13,10,  "	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				DB 10, 13, '	Enter your choice: $'				
	menuChoice DB ?  ; Store user input choice
    invalidDigitA DB 10, 13, 10, 13, "	Detect that user type incorrect digit.Please try again.$ "
	invalidDigitB DB 10, 13, 10, 13, "	Detect that user type incorrect digit. Will return to previous page.$ "
	invalidChar DB 10, 13, 10, 13, "	Detect that user type incorrect Character.Please try again.$ "
    promptEnter DB 10, 13, 10, 13, "			PRESS ANY KEY TO CONTINUE! $"
	NL DB 0AH,0DH,"$"
	productPage 	db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
					db 13,10,"	||                        Products                         ||"
					db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
					db 13,10,"	||           1. Pencil                                     ||"
					db 13,10,"	||           2. Pencil Case                                ||"
					db 13,10,"	||           3. Ruler                                      ||"
					db 13,10,"	||           4. Highlight Pen                              ||"
					db 13,10,"	||           5. Pen                                        ||"
					db 13,10,"	||           6. Return to previous page                    ||"
					db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
					db 13,10,"	Please select the product you want to update: $"
	productChoice   db ?
	continueAddChoice db ?
	promptContinueAdd DB 13,10,13,10, "	The product information has been updated! Continue? (Y=Yes/N=No): $"
	
	viewProductPage 	db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
						db 13,10,"	||                         Product                         ||"
						db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"						
	product1  			db 13,10,"	||    1.Pencil          $"
    product2   			db 13,10,"	||    2.Pencil Case     $"
    product3   			db 13,10,"	||    3.Ruler           $"
    product4   			db 13,10,"	||    4.Highlight Pen   $"
	product5   			db 13,10,"	||    5.Pen             $"
	footer              db 13,10,"	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"
	showPrice			db " ||  RM $"
	showQuantity		db "  ||  Available: $"
	charEnd             db '   ||$'
	
	productPriceRM1 db ?
	productPriceRM2 db ?
	productPriceRM3 db ?
	productPriceRM4 db ?
	productPriceRM5 db ?
	
	productPriceSen1 db ?
	productPriceSen2 db ?
	productPriceSen3 db ?
	productPriceSen4 db ?
	productPriceSen5 db ?
	
	productQuantity1 db ?
	productQuantity2 db ?
	productQuantity3 db ?
	productQuantity4 db ?
	productQuantity5 db ?
	
	prodTensRM1 DB ?     ; Store the ASCII of the tens place
	prodTensRM2 DB ?
	prodTensRM3 DB ?
	prodTensRM4 DB ?
	prodTensRM5 DB ?
    prodOnesRM1 DB ?     ; Store the ASCII of the ones place
	prodOnesRM2 DB ?  
	prodOnesRM3 DB ?  
	prodOnesRM4 DB ?  
	prodOnesRM5 DB ?
	
	prodTensSen1 DB ?     ; Store the ASCII of the tens place
	prodTensSen2 DB ?
	prodTensSen3 DB ?
	prodTensSen4 DB ?
	prodTensSen5 DB ?
    prodOnesSen1 DB ?     ; Store the ASCII of the ones place
	prodOnesSen2 DB ?  
	prodOnesSen3 DB ?  
	prodOnesSen4 DB ?  
	prodOnesSen5 DB ?  
	
	prodTensQuantity1 DB ?     ; Store the ASCII of the tens place
	prodTensQuantity2 DB ?
	prodTensQuantity3 DB ?
	prodTensQuantity4 DB ?
	prodTensQuantity5 DB ?
    prodOnesQuantity1 DB ?     ; Store the ASCII of the ones place
	prodOnesQuantity2 DB ?  
	prodOnesQuantity3 DB ?  
	prodOnesQuantity4 DB ?  
	prodOnesQuantity5 DB ?  
	
	; Messages for adding product
    promptPriceRM DB 10, 13, 10, 13, '	Enter price (RM): $'
    promptPriceSen DB 10, 13, 10, 13, '	Enter price (Sen): $'
    promptQuantity DB 10, 13, 10, 13, '	Enter quantity: $'
    successMsg DB 10, 13, 10, 13, '	Product added successfully!$'



; ====== Variables from JUN.ASM (renamed with prefix) ======

    ; jun_Logo jun_and jun_Menu jun_options
    jun_LOGO1           jun_DB 10,13, '==========================================================='
                    jun_DB 10,13, '||                                                      ||'
                    jun_DB 10,13, '||      jun_INVENTORY jun_SYSTEM - jun_STATIONERY                   ||'
                    jun_DB 10,13, '||      -----------------------------                   ||'
                    jun_DB 10,13, '||                                                      ||'
                    jun_DB 10,13, '||        [ jun_MANAGE jun_YOUR jun_STATIONERY jun_STOCK ]              ||'
                    jun_DB 10,13, '||                                                      ||'
                    jun_DB 10,13, '===========================================================$'
    
    jun_MENU1           jun_DB 10,13, '||                      jun_MAIN jun_MENU                        ||'
                    jun_DB 10,13, '||-------------------------------------------------------||'
                    jun_DB 10,13, '||  [1] jun_Stock jun_In & jun_Out                                   ||'
                    jun_DB 10,13, '||  [2] jun_Generate jun_Report                                  ||'
                    jun_DB 10,13, '||  [3] jun_Back jun_To jun_Previous jun_Menu                            ||'
                    jun_DB 10,13, '||  [4] jun_Exit                                             ||'
                    jun_DB 10,13, '||-------------------------------------------------------||'
                    jun_DB 10,13, '    jun_Enter jun_Your jun_Choice: $'

    
    jun_INVALID_CHOICE  jun_DB 0Dh, 0Ah, "jun_Invalid jun_choice. jun_Please jun_try jun_again.$"
    
    ; jun_Stock jun_In/jun_Out jun_menu
    jun_STOCK_MENU      jun_DB 10,13, '||                  jun_STOCK jun_IN & jun_OUT jun_MENU                  ||'
                    jun_DB 10,13, '||-------------------------------------------------------||'
                    jun_DB 10,13, '||  [1] jun_Stock jun_In                                         ||'
                    jun_DB 10,13, '||  [2] jun_Stock jun_Out                                        ||'
                    jun_DB 10,13, '||  [3] jun_Back jun_To jun_Main jun_Menu                                ||'
                    jun_DB 10,13, '||-------------------------------------------------------||'
                    jun_DB 10,13, '     jun_Enter jun_Your jun_Choice: $'
  
    
    ; jun_Input jun_prompts
    jun_PROMPT_NAME     jun_DB 0Dh, 0Ah, "jun_Enter jun_Product jun_Name (jun_max 10 jun_chars): $"
    jun_PROMPT_QTY      jun_DB 0Dh, 0Ah, "jun_Enter jun_Quantity jun_Item (1-99): $"
    jun_PROMPT_LOC_IN   jun_DB 0Dh, 0Ah, "jun_Enter jun_Location jun_Received jun_From (jun_max 5 jun_chars): $"
    jun_PROMPT_LOC_OUT  jun_DB 0Dh, 0Ah, "jun_Enter jun_Location jun_Towards jun_To (jun_max 5 jun_chars): $"
    
    ; jun_Success jun_messages
    jun_MSG_SENT        jun_DB 0Dh, 0Ah, "jun_Product jun_sent jun_out jun_successfully!$"
    jun_MSG_RECEIVED    jun_DB 0Dh, 0Ah, "jun_Product jun_received jun_successfully!$"
    
    ; jun_Report jun_headers
    jun_REPORT_HEADER1  jun_DB 0Dh, 0Ah, "||                          jun_STOCK jun_MOVEMENT jun_REPORT                         ||$"
    jun_REPORT_HEADER2  jun_DB 0Dh, 0Ah, "||------------------------------------------------------------------------||$"
    jun_REPORT_HEADER3  jun_DB 0Dh, 0Ah, "||jun_Product        jun_Quantity        jun_Location        jun_Condition               ||$"
    jun_REPORT_HEADER4  jun_DB 0Dh, 0Ah, "============================================================================$"
    
    ; jun_Error jun_messages
    jun_ERR_NAME_EMPTY  jun_DB 0Dh, 0Ah, "jun_Product jun_name jun_cannot jun_be jun_empty! jun_Try jun_again.$"
    jun_ERR_QTY_INVALID jun_DB 0Dh, 0Ah, "jun_Invalid jun_quantity! jun_Must jun_be 1-99. jun_Try jun_again.$"
    jun_ERR_LOC_EMPTY   jun_DB 0Dh, 0Ah, "jun_Location jun_cannot jun_be jun_empty! jun_Try jun_again.$"
    
    ; jun_Strings jun_for jun_Condition
    jun_STR_SENT_OUT    jun_DB "jun_Sent jun_Out$"
    jun_STR_RECEIVED    jun_DB "jun_Received$"
    
    ; jun_Buffers jun_for jun_input
    jun_INPUT_BUFFER    jun_DB 20 jun_DUP(0)   ; jun_Buffer jun_for jun_keyboard jun_input
	jun_instr jun_label jun_BYTE 
	jun_MAX jun_db 20
	jun_ACTN jun_db ?
    
    ; jun_Storage jun_for jun_stock jun_records (jun_max 10 jun_records)
    ; jun_Each jun_record: jun_ProductName[10], jun_Quantity[2], jun_Location[5], jun_Condition[1] (0=jun_In, 1=jun_Out)
    jun_STOCK_RECORDS   jun_DB 180 jun_DUP(0)  ; 10 jun_records * 18 jun_bytes = 180 jun_bytes
    jun_RECORD_COUNT    jun_DB 0           ; jun_Number jun_of jun_records jun_stored
    
    ; jun_Buffer jun_for jun_number jun_conversion
    jun_NUM_BUFFER      jun_DB 5 jun_DUP('$')
    
    jun_NEW_LINE        jun_DB 0Dh, 0Ah, "$"
    jun_CONTINUE_PROMPT jun_DB 0Dh, 0Ah, "jun_Press jun_any jun_key jun_to jun_continue...$"
    jun_SPACE           jun_DB " $"



.CODE

MAIN:
    CALL RepeatMain
    ; Execution ends after JunMain is done
    MOV AH, 4CH
    INT 21H

; ====== Repeat.asm main logic ======
RepeatMain PROC
MAIN PROC
    ; Initialize the program
    MOV AX, @DATA
    MOV DS, AX

MENU_LOOP:
	CALL ClearScreen
	MOV ah, 09h
    LEA DX, menuHeader
    INT 21H

    ; Read user input
    MOV AH, 01H  ; Read single char
    INT 21H
    MOV menuChoice, AL

    CMP menuChoice, '1'
    JE JMP_ADD_PRODUCT
    CMP menuChoice, '2'
    JE JMP_VIEW_PRODUCTS
    CMP menuChoice, '3'
    JE JMP_FIN
	JMP MENU_INVALID

MENU_INVALID:
    ; Invalid choice
	MOV ah, 09h
    LEA DX, invalidDigitA
    INT 21H
	
	CALL PRESSENTER
    JMP MENU_LOOP

PRESSENTER:
	MOV AX,0600H  ;--SET CURSOR
	MOV BH,87H
	MOV CX,1200H
	MOV DX,184FH
	INT 10H
	
	MOV CX,7
	NEWLINE:
		MOV AH,09H
		LEA DX,NL
		INT 21H
	LOOP NEWLINE
	
	MOV AH,09H			;--PROMPT_ENTER MESSAGE FOR USER
	LEA DX,promptEnter
	INT 21H 
    MOV AH, 01H
    INT 21H
	RET
	
JMP_ADD_PRODUCT:
	JMP ADD_PRODUCT

JMP_VIEW_PRODUCTS:
	JMP VIEW_PRODUCTS
	
JMP_FIN:
	JMP FIN

ClearScreen:
    MOV AH, 0
    MOV AL, 3
    INT 10H
    RET
	
ADD_PRODUCT:
	CALL ClearScreen
    ; Prompt for product
	MOV AH, 09H
    LEA DX, productPage
    INT 21H

    ; Read product number
    MOV AH, 01H
    INT 21H
	MOV productChoice,AL
	
    CMP productChoice, "1"
    JL INVALID_INPUT  ; If < 1, invalid
	JE JMP_ADD_PRODUCT1
	CMP productChoice, "2"
	JE JMP_ADD_PRODUCT2
	CMP productChoice, "3"
	JE JMP_ADD_PRODUCT3
	CMP productChoice, "4"
	JE JMP_ADD_PRODUCT4
    CMP productChoice, "5"
	JE JMP_ADD_PRODUCT5
	CMP productChoice, "6"
	JG INVALID_INPUT  ; If > 5, invalid
	JE JMP_MENU_LOOP

JMP_ADD_PRODUCT1:
	CALL PRESSENTER
	JMP ADD_PRODUCT1
JMP_ADD_PRODUCT2:
	CALL PRESSENTER
	JMP ADD_PRODUCT2
JMP_ADD_PRODUCT3:
	CALL PRESSENTER
	JMP ADD_PRODUCT3
JMP_ADD_PRODUCT4:
	CALL PRESSENTER
	JMP ADD_PRODUCT4
JMP_ADD_PRODUCT5:
	CALL PRESSENTER
	JMP ADD_PRODUCT5
JMP_MENU_LOOP:
	CALL PRESSENTER
	JMP MENU_LOOP

INVALID_INPUT:
	MOV ah, 09h
    LEA DX, invalidDigitA
    INT 21H
	CALL PRESSENTER
	JMP ADD_PRODUCT

ADD_PRODUCT1:
	CALL ClearScreen
	
    MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
	CALL DISPLAYPROD1
	
	MOV AH, 09H
    LEA DX, footer
    INT 21H
	
	MOV AH, 09H
    LEA DX, promptPriceRM
    INT 21H

	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT1
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT1
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT1
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT1
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceRM1, BL  
	JMP ADD_PRODUCT_SEN1

JMP_INVALID_INPUT1:
	JMP INVALID_INPUT
	
ADD_PRODUCT_SEN1:	
	MOV AH, 09H
    LEA DX, promptPriceSen
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT1
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT1
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT1
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT1
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceSen1, BL  

	MOV AH, 09H
    LEA DX, promptQuantity   
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT11
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT11
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT11
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT11
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productQuantity1, BL
	JMP ContinueAdd

JMP_INVALID_INPUT11:
	JMP INVALID_INPUT
	
ContinueAdd:
	MOV AH, 09H
    LEA DX, promptContinueAdd 
    INT 21H
	
	MOV AH,01H
	INT 21H
	MOV continueAddChoice,AL
	
	CMP continueAddChoice,"Y" 
	JE JMP2_ADD_PRODUCT
	CMP continueAddChoice,"y"
	JE JMP2_ADD_PRODUCT
	CMP continueAddChoice,"N" 
	JE JMP2_MENU_LOOP
	CMP continueAddChoice,"n"
	JE JMP2_MENU_LOOP
	
	MOV AH, 09H
    LEA DX, invalidChar
    INT 21H  
	
	JMP ContinueAdd

JMP2_ADD_PRODUCT:
	CALL PRESSENTER
	JMP ADD_PRODUCT
	
JMP2_MENU_LOOP:
	CALL PRESSENTER
	JMP MENU_LOOP
	
ADD_PRODUCT2:
	CALL ClearScreen
	
	MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
    CALL DISPLAYPROD2
	
	MOV AH, 09H
    LEA DX, footer
    INT 21H
	
	MOV AH, 09H
    LEA DX, promptPriceRM
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT2
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT2
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT2
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT2
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceRM2, BL  
	JMP ADD_PRODUCT_SEN2
	
JMP_INVALID_INPUT2:
	JMP INVALID_INPUT	

ADD_PRODUCT_SEN2:	
	MOV AH, 09H
    LEA DX, promptPriceSen
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT2
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT2
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT2
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT2
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceSen2, BL  

	MOV AH, 09H
    LEA DX, promptQuantity   
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT22
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT22
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT22
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT22	
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productQuantity2, BL
	
	JMP ContinueAdd

JMP_INVALID_INPUT22:
	JMP INVALID_INPUT
	
ADD_PRODUCT3:
	CALL ClearScreen
	
	MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
	CALL DISPLAYPROD3
	
	MOV AH, 09H
    LEA DX, footer
    INT 21H
	
	MOV AH, 09H
    LEA DX, promptPriceRM
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT3
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT3
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT3
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT3
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceRM3, BL  
	JMP ADD_PRODUCT_SEN3

JMP_INVALID_INPUT3:
	JMP INVALID_INPUT
	
ADD_PRODUCT_SEN3:	
	MOV AH, 09H
    LEA DX, promptPriceSen
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT3
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT3
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT33
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT33
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceSen3, BL  

	MOV AH, 09H
    LEA DX, promptQuantity   
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT33
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT33
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productQuantity3, BL
	JMP ContinueAdd

JMP_INVALID_INPUT33:
	JMP INVALID_INPUT

ADD_PRODUCT4:
	CALL ClearScreen
	
	MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
    CALL DISPLAYPROD4
	
	MOV AH, 09H
    LEA DX, footer
    INT 21H
	
	MOV AH, 09H
    LEA DX, promptPriceRM
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT4
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT4
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT4
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT4
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceRM4, BL  
	JMP ADD_PRODUCT_SEN4

JMP_INVALID_INPUT4:
	JMP INVALID_INPUT
	
ADD_PRODUCT_SEN4:	
	MOV AH, 09H
    LEA DX, promptPriceSen
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT4
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT4
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT4
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT4
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceSen4, BL  

	MOV AH, 09H
    LEA DX, promptQuantity   
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT44
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT44
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT44
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT44
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productQuantity4, BL
	JMP ContinueAdd

JMP_INVALID_INPUT44:
	JMP INVALID_INPUT
	
ADD_PRODUCT5:
	CALL ClearScreen
	
	MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
    CALL DISPLAYPROD5
	
	MOV AH, 09H
    LEA DX, promptPriceRM
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT5
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT5
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT5
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT5
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceRM5, BL  
	JMP ADD_PRODUCT_SEN5

JMP_INVALID_INPUT5:
	JMP INVALID_INPUT
	
ADD_PRODUCT_SEN5:	
	MOV AH, 09H
    LEA DX, promptPriceSen
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT5
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT5
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT5
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT5
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productPriceSen5, BL  

	MOV AH, 09H
    LEA DX, promptQuantity   
    INT 21H
	
	MOV AH, 01H   ; DOS interrupt for input
    INT 21H       ; Read character from keyboard
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT55
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT55
    SUB AL, 30H   ; Convert ASCII to number (0-9)
    MOV BL, AL    ; Store in BL
	
	; Multiply by 10
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    MUL CL        ; AX = AL * 10
    MOV BL, AL    ; Store result in BL

    ; Read second digit
    MOV AH, 01H
    INT 21H
	CMP AL, "0"   ; Check if input is less than '0'
    JL JMP_INVALID_INPUT55
    CMP AL, "9"   ; Check if input is greater than '9'
    JG JMP_INVALID_INPUT55
    SUB AL, 30H   ; Convert ASCII to number (0-9)

    ; Add second digit
    ADD BL, AL
    ; Store the final number
    MOV productQuantity5, BL
	JMP ContinueAdd    

JMP_INVALID_INPUT55:
	JMP INVALID_INPUT
	
VIEW_PRODUCTS:
	CALL DISPLAYPROD1
	CALL DISPLAYPROD2
	CALL DISPLAYPROD3
	CALL DISPLAYPROD4
	CALL DISPLAYPROD5
	
	CALL PRESSENTER
	
	JMP MENU_LOOP

DISPLAYPROD1:
	CALL ClearScreen
	MOV AH, 09H
    LEA DX, viewProductPage
    INT 21H
	
	MOV AH, 09H
    LEA DX, product1
    INT 21H
	
	MOV AH, 09H
    LEA DX, showPrice
    INT 21H

	; Convert stored number to ASCII for printing
    MOV AL, productPriceRM1		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensRM1, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesRM1, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensRM1
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesRM1
    INT 21H
	
	MOV AH, 02H	
    MOV DL, "."
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productPriceSen1
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensSen1, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesSen1, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensSen1
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesSen1
    INT 21H
	
	MOV AH, 09H
    LEA DX, showQuantity
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productQuantity1	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensQuantity1, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesQuantity1, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensQuantity1
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesQuantity1
    INT 21H
	
	MOV AH, 09H
    LEA DX, charEnd
    INT 21H
	RET
	
;++++++Product2+++++++++++++++++++++++++++++++++	
DISPLAYPROD2:
	MOV AH, 09H
    LEA DX, product2
    INT 21H
	
	MOV AH, 09H
    LEA DX, showPrice
    INT 21H

	; Convert stored number to ASCII for printing
    MOV AL, productPriceRM2	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensRM2, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesRM2, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensRM2
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesRM2
    INT 21H
	
	MOV AH, 02H	
    MOV DL, "."
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productPriceSen2		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensSen2, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesSen2, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensSen2
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesSen2
    INT 21H
	
	MOV AH, 09H
    LEA DX, showQuantity
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productQuantity2	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensQuantity2, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesQuantity2, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensQuantity2
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesQuantity2
    INT 21H
	
	MOV AH, 09H
    LEA DX, charEnd
    INT 21H
	RET
	
;+++++++product3+++++++++++++++	
DISPLAYPROD3:
	MOV AH, 09H
    LEA DX, product3
    INT 21H
	
	MOV AH, 09H
    LEA DX, showPrice
    INT 21H

	; Convert stored number to ASCII for printing
    MOV AL, productPriceRM3		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensRM3, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesRM3, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensRM3
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesRM3
    INT 21H
	
	MOV AH, 02H	
    MOV DL, "."
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productPriceSen3		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensSen3, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesSen3, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensSen3
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesSen3
    INT 21H
	
	MOV AH, 09H
    LEA DX, showQuantity
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productQuantity3	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensQuantity3, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesQuantity3, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensQuantity3
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesQuantity3
    INT 21H
	
	MOV AH, 09H
    LEA DX, charEnd
    INT 21H
	RET
	
;++++++++++++product4++++++++++	
DISPLAYPROD4:
	MOV AH, 09H
    LEA DX, product4
    INT 21H
	
	MOV AH, 09H
    LEA DX, showPrice
    INT 21H

	; Convert stored number to ASCII for printing
    MOV AL, productPriceRM4		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensRM4, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesRM4, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensRM4
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesRM4
    INT 21H
	
	MOV AH, 02H	
    MOV DL, "."
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productPriceSen4		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensSen4, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesSen4, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensSen4
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesSen4
    INT 21H
	
	MOV AH, 09H
    LEA DX, showQuantity
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productQuantity4	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensQuantity4, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesQuantity4, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensQuantity4
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesQuantity4
    INT 21H

	MOV AH, 09H
    LEA DX, charEnd
    INT 21H
	RET
	
;+++++++++++product5+++++++++++++++++++++++++++++++++++++++++++	
DISPLAYPROD5:
	MOV AH, 09H
    LEA DX, product5
    INT 21H
	
	MOV AH, 09H
    LEA DX, showPrice
    INT 21H

	; Convert stored number to ASCII for printing
    MOV AL, productPriceRM5		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensRM5, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesRM5, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensRM5
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesRM5
    INT 21H
	
	MOV AH, 02H	
    MOV DL, "."
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productPriceSen5		  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensSen5, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesSen5, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensSen5
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesSen5
    INT 21H
	
	MOV AH, 09H
    LEA DX, showQuantity
    INT 21H
	
	; Convert stored number to ASCII for printing
    MOV AL, productQuantity5	  
    MOV AH, 0   
    MOV DL, 10
    DIV DL        ; AL = quotient (tens), AH = remainder (ones)
    ADD AL, 30H   ; Convert tens place to ASCII
    MOV prodTensQuantity5, AL  ; Store tens digit
    ADD AH, 30H   ; Convert ones place to ASCII
    MOV prodOnesQuantity5, AH  ; Store ones digit

    ; Print tens digit
	MOV AH, 02H
    MOV DL, prodTensQuantity5
    INT 21H
	
    ; Print ones digit
    MOV AH, 02H	
    MOV DL, prodOnesQuantity5
    INT 21H
	
	MOV AH, 09H
    LEA DX, charEnd
    INT 21H
	
	MOV AH, 09H
    LEA DX, footer
    INT 21H
	RET
	
FIN:		
	MOV AX,4C00H
	INT 21H
		
MAIN ENDP
END MAIN
    ; After finishing RepeatMain logic, jump to JunMain
    CALL jun_JunMain
    RET
RepeatMain ENDP

; ====== Jun.asm main logic (renamed) ======
jun_JunMain PROC
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
jun_MENU_LOOP1:
    ; Clear screen 
    MOV AH, 0       
    MOV AL, 3       
    INT 10h         
    
    ; Display logo and main menu
    MOV AH, 09H       ; output string
    MOV DX, OFFSET LOGO1
    INT 21h         ; 
    
    MOV AH, 09H
    MOV DX, OFFSET MENU1
    INT 21h
    
    ; Get user choice
    MOV AH, 1       ; read character
    INT 21h         
    
    ; Process user choice
    CMP AL, '1'     ; Option 1 - Stock In & Out Menu
    JNE CHECK_OPTION2  
    JMP STOCK_MENU_DISPLAY
    
jun_CHECK_OPTION2:
    CMP AL, '2'     ; Option 2 - Generate Report
    JNE CHECK_OPTION3
    JMP REPORT_MENU
    
jun_CHECK_OPTION3:
    CMP AL, '3'     ; Option 3 - Back to Previous Menu
    JNE CHECK_OPTION4
    JMP MENU_LOOP1    ; Just refresh the menu
    
jun_CHECK_OPTION4:
    CMP AL, '4'     ; Option 4 - Exit
    JNE INVALID_MAIN_CHOICE
    JMP EXIT_PROGRAM
    
jun_INVALID_MAIN_CHOICE:
    ; Invalid choice
    MOV AH, 9
    MOV DX, OFFSET INVALID_CHOICE
    INT 21h
    
    ; Wait for key press
    MOV AH, 7       ; Function 7 - direct console input
    INT 21h
    
    JMP MENU_LOOP1   ; Return to menu

;------ STOCK MENU PROCEDURE ------
jun_STOCK_MENU_DISPLAY:
    ; Clear screen
    MOV AH, 0
    MOV AL, 3
    INT 10h
    
    ; Display logo and stock menu
    MOV AH, 9
    MOV DX, OFFSET LOGO1
    INT 21h
    
    MOV AH, 9
    MOV DX, OFFSET STOCK_MENU
    INT 21h
    
    ; Get user choice
    MOV AH, 1
    INT 21h
    
    ; Process choice
    CMP AL, '1'
    JNE CHECK_STOCK_OPTION2  
    JMP STOCK_IN
    
jun_CHECK_STOCK_OPTION2:
    CMP AL, '2'
    JNE CHECK_STOCK_OPTION3
    JMP STOCK_OUT
    
jun_CHECK_STOCK_OPTION3:
    CMP AL, '3'
    JNE INVALID_STOCK_CHOICE
    JMP MENU_LOOP1
    
jun_INVALID_STOCK_CHOICE:
    ; Invalid choice
    MOV AH, 9
    MOV DX, OFFSET INVALID_CHOICE
    INT 21h
    
    ; Wait for key press
    MOV AH, 7
    INT 21h
    
    JMP STOCK_MENU_DISPLAY
    
;------ STOCK IN PROCEDURE ------
jun_STOCK_IN:
    ; Check if record count is at maximum
    MOV AL, RECORD_COUNT
    CMP AL, 10
    JAE STOCK_IN_FULL  ; Jump if Above or Equal
    JMP STOCK_IN_CONT
    
jun_STOCK_IN_FULL:
    ; Display error message if full
    MOV AH, 9
    MOV DX, OFFSET NEW_LINE
    INT 21h
    MOV DX, OFFSET ERR_NAME_EMPTY ; Reusing message for "Database full"
    INT 21h
    JMP WAIT_AND_RETURN_TO_STOCK
    
jun_STOCK_IN_CONT:
    ; Get product name
    CALL GET_PRODUCT_NAME
    
    ; Get quantity
    CALL GET_QUANTITY
    
    ; Get location
    MOV AH, 9
    MOV DX, OFFSET PROMPT_LOC_IN
    INT 21h
    CALL GET_LOCATION
    
    ; Calculate record position
    MOV AL, RECORD_COUNT
    MOV AH, 18      ; Each record is 18 bytes
    MUL AH          ; AX = record index * 18
    MOV DI, AX      ; DI = offset to current record
    
    ; Store condition (0 = Stock In)
    MOV BYTE PTR [STOCK_RECORDS + DI + 17], 0
    
    ; Increment record count
    INC RECORD_COUNT
    
    ; Display success message
    MOV AH, 9
    MOV DX, OFFSET MSG_RECEIVED
    INT 21h
    
    JMP WAIT_AND_RETURN_TO_STOCK

;------ STOCK OUT PROCEDURE ------
jun_STOCK_OUT:
    ; Check if record count is at maximum
    MOV AL, RECORD_COUNT
    CMP AL, 10
    JAE STOCK_OUT_FULL  ; Use JAE
    JMP STOCK_OUT_CONT
    
jun_STOCK_OUT_FULL:
    ; Display error message if full
    MOV AH, 9
    MOV DX, OFFSET NEW_LINE
    INT 21h
    MOV DX, OFFSET ERR_NAME_EMPTY ; Reusing message for "Database full"
    INT 21h
    JMP WAIT_AND_RETURN_TO_STOCK
    
jun_STOCK_OUT_CONT:
    ; Get product name
    CALL GET_PRODUCT_NAME
    
    ; Get quantity
    CALL GET_QUANTITY
    
    ; Get location
    MOV AH, 9
    MOV DX, OFFSET PROMPT_LOC_OUT
    INT 21h
    CALL GET_LOCATION
    
    ; Calculate record position
    MOV AL, RECORD_COUNT
    MOV AH, 18      ; Each record is 18 bytes
    MUL AH          ; AX = record index * 18
    MOV DI, AX      ; DI = offset to current record
    
    ; Store condition (1 = Stock Out)
    MOV BYTE PTR [STOCK_RECORDS + DI + 17], 1
    
    ; Increment record count
    INC RECORD_COUNT
    
    ; Display success message
    MOV AH, 9
    MOV DX, OFFSET MSG_SENT
    INT 21h
    
    JMP WAIT_AND_RETURN_TO_STOCK

jun_WAIT_AND_RETURN_TO_STOCK:
    ; Wait for key press
    MOV AH, 9
    MOV DX, OFFSET CONTINUE_PROMPT
    INT 21h
    MOV AH, 7       ; Function 7 - direct console input
    INT 21h
    
    JMP STOCK_MENU_DISPLAY  ; Return to stock menu

;------ REPORT MENU PROCEDURE ------
jun_REPORT_MENU:
    ; Clear screen
    MOV AH, 0       ; Function 0 - set video mode
    MOV AL, 3       ; Mode 3 - 80x25 text
    INT 10h         ; Call BIOS video service
    
    ; Display report headers
    MOV AH, 9
    MOV DX, OFFSET LOGO1
    INT 21h
    MOV DX, OFFSET REPORT_HEADER1
    INT 21h
    MOV DX, OFFSET REPORT_HEADER2
    INT 21h
    MOV DX, OFFSET REPORT_HEADER3
    INT 21h
    MOV DX, OFFSET REPORT_HEADER4
    INT 21h
    MOV DX, OFFSET NEW_LINE
    INT 21h
    
    ; Check if there are records to display
    CMP RECORD_COUNT, 0
    JNE HAVE_RECORDS  ; Fix: Use JNE
    JMP NO_RECORDS
    
jun_HAVE_RECORDS:
    ; Initialize counter
    MOV DI, 0       ; DI = current record offset
    MOV CX, 0       ; CX = current record index
    
jun_REPORT_LOOP:
    ; Display product name (10 chars max)
    MOV AH, 9
    MOV DX, OFFSET SPACE
    INT 21h
    MOV DX, DI
    ADD DX, OFFSET STOCK_RECORDS
    INT 21h
    
    ; Display quantity
    MOV AH, 9
    MOV DX, OFFSET SPACE
    INT 21h
    
    ; Get quantity value from record
    MOV AL, [STOCK_RECORDS + DI + 10]  ; First byte of quantity
    CALL DISPLAY_NUMBER
    
    ; Display location
    MOV AH, 9
    MOV DX, OFFSET SPACE
    INT 21h
    MOV DX, DI
    ADD DX, OFFSET STOCK_RECORDS
    ADD DX, 12      ; Offset to location field
    INT 21h
    
    ; Display condition
    MOV AH, 9
    MOV DX, OFFSET SPACE
    INT 21h
    
    ; Check condition flag (0=In, 1=Out)
    CMP BYTE PTR [STOCK_RECORDS + DI + 17], 0
    JNE DISPLAY_SENT_OUT  ; Fix: Use JNE
    
    ; Display "Received"
    MOV DX, OFFSET STR_RECEIVED
    JMP DISPLAY_CONDITION
    
jun_DISPLAY_SENT_OUT:
    ; Display "Sent Out"
    MOV DX, OFFSET STR_SENT_OUT
    
jun_DISPLAY_CONDITION:
    INT 21h
    
    ; New line
    MOV AH, 9
    MOV DX, OFFSET NEW_LINE
    INT 21h
    
    ; Move to next record
    ADD DI, 18      ; Each record is 18 bytes
    INC CL          ; Increment counter
    CMP CL, RECORD_COUNT
    JAE END_REPORT_LOOP  ; Fix: Use JAE
    JMP REPORT_LOOP  ; Continue if more records
    
jun_END_REPORT_LOOP:
    JMP WAIT_AND_RETURN
    
jun_NO_RECORDS:
    MOV AH, 9
    MOV DX, OFFSET SPACE
    INT 21h
    MOV DX, OFFSET ERR_NAME_EMPTY  ; Reusing message for "No records"
    INT 21h
    
jun_WAIT_AND_RETURN:
    ; Wait for key press
    MOV AH, 9
    MOV DX, OFFSET CONTINUE_PROMPT
    INT 21h
    MOV AH, 7       ; Function 7 - direct console input
    INT 21h
    
    JMP MENU_LOOP1   ; Return to menu

;------ EXIT PROCEDURE ------
jun_EXIT_PROGRAM:
    MOV AH, 4Ch     ; Function 4Ch - exit program
    INT 21h

;------ HELPER PROCEDURES ------

; GET_PRODUCT_NAME - Get and validate product name
GET_PRODUCT_NAME PROC
    PUSH CX         ; Save registers
    
jun_GET_NAME_LOOP:
    ; Display prompt
    MOV AH, 9
    MOV DX, OFFSET PROMPT_NAME
    INT 21h
    
    ; Clear input buffer
    MOV CX, 20
    MOV DI, OFFSET INPUT_BUFFER
jun_CLEAR_NAME_BUFFER:
    MOV BYTE PTR [DI], 0
    INC DI
    LOOP CLEAR_NAME_BUFFER
    
    ; Read string
    MOV AH, 0Ah     ; Function 0Ah - buffered input
    LEA DX, instr
    INT 21h
    
    ; Check if name is empty
    CMP BYTE PTR [INPUT_BUFFER+1], 0
    JNE NAME_VALID  ; Fix: Use JNE
    
    ; Name is empty
    MOV AH, 9
    MOV DX, OFFSET ERR_NAME_EMPTY
    INT 21h
    JMP GET_NAME_LOOP
    
jun_NAME_VALID:
    ; Copy name to record
    MOV CX, 10      ; Max 10 characters
    MOV SI, OFFSET INPUT_BUFFER+2  ; Source (input buffer)
    
    ; Calculate destination address
    MOV AL, RECORD_COUNT
    MOV AH, 18      ; Each record is 18 bytes
    MUL AH          ; AX = record index * 18
    MOV DI, AX      ; DI = offset to current record
    ADD DI, OFFSET STOCK_RECORDS   ; DI = address of record
    
    ; Copy characters
jun_COPY_NAME_LOOP:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    INC DI
    LOOP COPY_NAME_LOOP
    
    POP CX          ; Restore registers
    RET
GET_PRODUCT_NAME ENDP

; GET_QUANTITY - Get and validate quantity
GET_QUANTITY PROC
    PUSH CX         ; Save registers
    
jun_GET_QTY_LOOP:
    ; Display prompt
    MOV AH, 9
    MOV DX, OFFSET PROMPT_QTY
    INT 21h
    
    ; Read digit
    MOV AH, 1       ; Function 1 - read character
    INT 21h
    
    ; Validate (must be 1-9)
    CMP AL, '1'
    JB QTY_ERROR
    CMP AL, '9'
    JA QTY_ERROR
    
    ; Convert to binary
    SUB AL, '0'
    
    ; Calculate record position for quantity field
    PUSH AX         ; Save quantity value
    MOV AL, RECORD_COUNT
    MOV AH, 18      ; Each record is 18 bytes
    MUL AH          ; AX = record index * 18
    MOV DI, AX      ; DI = offset to current record
    POP AX          ; Restore quantity value
    
    ; Store quantity in record
    MOV [STOCK_RECORDS + DI + 10], AL
    
    POP CX          ; Restore registers
    RET
    
jun_QTY_ERROR:
    MOV AH, 9
    MOV DX, OFFSET NEW_LINE
    INT 21h
    MOV DX, OFFSET ERR_QTY_INVALID
    INT 21h
    JMP GET_QTY_LOOP
GET_QUANTITY ENDP

; GET_LOCATION - Get and validate location
GET_LOCATION PROC
    PUSH CX         ; Save registers
    
jun_GET_LOC_LOOP:
    ; Clear input buffer
    MOV CX, 20
    MOV DI, OFFSET INPUT_BUFFER
jun_CLEAR_LOC_BUFFER:
    MOV BYTE PTR [DI], 0
    INC DI
    LOOP CLEAR_LOC_BUFFER
    
    ; Read string
    MOV AH, 0Ah     ; Function 0Ah - buffered input
    MOV DX, OFFSET INPUT_BUFFER
    INT 21h
    
    ; Check if location is empty
    CMP BYTE PTR [INPUT_BUFFER+1], 0
    JNE LOC_VALID  ; Fix: Use JNE
    
    ; Location is empty
    MOV AH, 9
    MOV DX, OFFSET ERR_LOC_EMPTY
    INT 21h
    JMP GET_LOC_LOOP
    
jun_LOC_VALID:
    ; Copy location to record
    MOV CX, 5       ; Max 5 characters
    MOV SI, OFFSET INPUT_BUFFER+2  ; Source (input buffer)
    
    ; Calculate destination address
    MOV AL, RECORD_COUNT
    MOV AH, 18      ; Each record is 18 bytes
    MUL AH          ; AX = record index * 18
    MOV DI, AX      ; DI = offset to current record
    ADD DI, OFFSET STOCK_RECORDS
    ADD DI, 12      ; Offset to location field
    
    ; Copy characters
jun_COPY_LOC_LOOP:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    INC DI
    LOOP COPY_LOC_LOOP
    
    POP CX          ; Restore registers
    RET
GET_LOCATION ENDP

; DISPLAY_NUMBER - Display the value in AL as decimal
DISPLAY_NUMBER PROC
    PUSH AX         ; Save registers
    PUSH BX
    PUSH CX
    PUSH DX
    
    ; Convert AL to decimal string
    MOV AH, 0       ; Clear high byte
    MOV CX, 10      ; Divisor
    MOV DI, OFFSET NUM_BUFFER
    ADD DI, 4       ; Start from end of buffer
    MOV BYTE PTR [DI], '$'  ; End of string marker
    DEC DI
    
    ; Division loop
jun_DIGIT_LOOP:
    MOV DX, 0       ; Clear high word
    DIV CX          ; AX / 10, quotient in AX, remainder in DX
    ADD DL, '0'     ; Convert to ASCII
    MOV [DI], DL    ; Store digit
    DEC DI          ; Move pointer
    
    CMP AX, 0       ; Check if number is done
    JNE DIGIT_LOOP
    
    ; Display number
    MOV AH, 9
    MOV DX, DI
    INC DX          ; Point to first digit
    INT 21h
    
    POP DX          ; Restore registers
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUMBER ENDP

jun_FIN:		
	MOV AX,4C00H
	INT 21H
	


MAIN ENDP
END MAIN
    RET
jun_JunMain ENDP

END MAIN
