opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 9 "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
	psect config,class=CONFIG,delta=2 ;#
# 9 "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
	dw 0xFFFA & 0xFFF7 & 0xFFEF & 0xFFFF & 0xFFBF & 0xFF7F & 0xFFFF & 0xFBFF & 0xFFFF & 0xEFFF & 0xFFFF ;#
# 10 "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
	psect config,class=CONFIG,delta=2 ;#
# 10 "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
	dw 0xFEFF & 0xFFFF ;#
	FNCALL	_main,_InicializarDisplay
	FNCALL	_main,_TamanhoFrase
	FNCALL	_main,_Centralizar
	FNCALL	_main,_EscreveFrase
	FNCALL	_main,_DesenharBitmap
	FNCALL	_main,_JustificarDireita
	FNCALL	_main,_delay
	FNCALL	_main,_InverterCores
	FNCALL	_EscreveFrase,_EscreveCaractere
	FNCALL	_DesenharBitmap,_Ponto
	FNCALL	_EscreveCaractere,___wmul
	FNCALL	_EscreveCaractere,_Ponto
	FNCALL	_InicializarDisplay,_RST
	FNCALL	_InicializarDisplay,_RW
	FNCALL	_InicializarDisplay,_delay
	FNCALL	_InicializarDisplay,_LigarDisplay
	FNCALL	_InicializarDisplay,_LimparDisplay
	FNCALL	_Ponto,_EnderecoX
	FNCALL	_Ponto,_EnderecoY
	FNCALL	_Ponto,_NovoX
	FNCALL	_Ponto,_EnviarDado
	FNCALL	_LimparDisplay,_EnderecoX
	FNCALL	_LimparDisplay,_EnviarDado
	FNCALL	_NovoX,_LerDado
	FNCALL	_InverterCores,_EnderecoX
	FNCALL	_InverterCores,_EnderecoY
	FNCALL	_InverterCores,_LerDado
	FNCALL	_InverterCores,_EnviarDado
	FNCALL	_LigarDisplay,_SelecionarArea
	FNCALL	_LigarDisplay,_RS
	FNCALL	_LigarDisplay,_Clock
	FNCALL	_EnviarDado,_SelecionarArea
	FNCALL	_EnviarDado,_RS
	FNCALL	_EnviarDado,_Clock
	FNCALL	_LerDado,_SelecionarArea
	FNCALL	_LerDado,_RS
	FNCALL	_LerDado,_ClockComLeitura
	FNCALL	_EnderecoY,_SelecionarArea
	FNCALL	_EnderecoY,_RS
	FNCALL	_EnderecoY,_Clock
	FNCALL	_EnderecoX,_SelecionarArea
	FNCALL	_EnderecoX,_RS
	FNCALL	_EnderecoX,_Clock
	FNCALL	_ClockComLeitura,_RW
	FNCALL	_ClockComLeitura,_E
	FNCALL	_ClockComLeitura,_delayMicroseconds
	FNCALL	_Clock,_E
	FNCALL	_Clock,_delayMicroseconds
	FNCALL	_JustificarDireita,___bmul
	FNCALL	_Centralizar,___wmul
	FNCALL	_SelecionarArea,_CS1
	FNCALL	_SelecionarArea,_CS2
	FNROOT	_main
	global	_alfabeto
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\caracteres.h"
	line	9
_alfabeto:
	retlw	07Eh
	retlw	088h
	retlw	088h
	retlw	088h
	retlw	07Eh
	retlw	0FEh
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	06Ch
	retlw	07Ch
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	044h
	retlw	0FEh
	retlw	082h
	retlw	082h
	retlw	044h
	retlw	038h
	retlw	0FEh
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	082h
	retlw	0FEh
	retlw	090h
	retlw	090h
	retlw	090h
	retlw	080h
	retlw	07Ch
	retlw	082h
	retlw	092h
	retlw	092h
	retlw	05Eh
	retlw	0FEh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0FEh
	retlw	0
	retlw	082h
	retlw	0FEh
	retlw	082h
	retlw	0
	retlw	04h
	retlw	02h
	retlw	082h
	retlw	0FCh
	retlw	080h
	retlw	0FEh
	retlw	010h
	retlw	028h
	retlw	044h
	retlw	082h
	retlw	0FEh
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	0FEh
	retlw	040h
	retlw	030h
	retlw	040h
	retlw	0FEh
	retlw	0FEh
	retlw	020h
	retlw	010h
	retlw	08h
	retlw	0FEh
	retlw	07Ch
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	07Ch
	retlw	0FEh
	retlw	090h
	retlw	090h
	retlw	090h
	retlw	060h
	retlw	07Ch
	retlw	082h
	retlw	08Ah
	retlw	084h
	retlw	07Ah
	retlw	0FEh
	retlw	090h
	retlw	098h
	retlw	094h
	retlw	062h
	retlw	062h
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	08Ch
	retlw	080h
	retlw	080h
	retlw	0FEh
	retlw	080h
	retlw	080h
	retlw	0FCh
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	0FCh
	retlw	0F8h
	retlw	04h
	retlw	02h
	retlw	04h
	retlw	0F8h
	retlw	0FCh
	retlw	02h
	retlw	01Ch
	retlw	02h
	retlw	0FCh
	retlw	0C6h
	retlw	028h
	retlw	010h
	retlw	028h
	retlw	0C6h
	retlw	0E0h
	retlw	010h
	retlw	0Eh
	retlw	010h
	retlw	0E0h
	retlw	086h
	retlw	08Ah
	retlw	092h
	retlw	0A2h
	retlw	0C2h
	retlw	04h
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	01Eh
	retlw	0FEh
	retlw	012h
	retlw	022h
	retlw	022h
	retlw	01Ch
	retlw	01Ch
	retlw	022h
	retlw	022h
	retlw	022h
	retlw	04h
	retlw	01Ch
	retlw	022h
	retlw	022h
	retlw	012h
	retlw	0FEh
	retlw	01Ch
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	018h
	retlw	010h
	retlw	07Eh
	retlw	090h
	retlw	080h
	retlw	040h
	retlw	030h
	retlw	04Ah
	retlw	04Ah
	retlw	04Ah
	retlw	07Ch
	retlw	0FEh
	retlw	010h
	retlw	020h
	retlw	020h
	retlw	01Eh
	retlw	0
	retlw	022h
	retlw	0BEh
	retlw	02h
	retlw	0
	retlw	04h
	retlw	02h
	retlw	022h
	retlw	0BCh
	retlw	0
	retlw	0FEh
	retlw	08h
	retlw	014h
	retlw	022h
	retlw	0
	retlw	0
	retlw	082h
	retlw	0FEh
	retlw	02h
	retlw	0
	retlw	03Eh
	retlw	020h
	retlw	018h
	retlw	020h
	retlw	01Eh
	retlw	03Eh
	retlw	010h
	retlw	020h
	retlw	020h
	retlw	01Eh
	retlw	01Ch
	retlw	022h
	retlw	022h
	retlw	022h
	retlw	01Ch
	retlw	03Eh
	retlw	028h
	retlw	028h
	retlw	028h
	retlw	010h
	retlw	010h
	retlw	028h
	retlw	028h
	retlw	018h
	retlw	03Eh
	retlw	03Eh
	retlw	010h
	retlw	020h
	retlw	020h
	retlw	010h
	retlw	012h
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	04h
	retlw	020h
	retlw	0FCh
	retlw	022h
	retlw	02h
	retlw	04h
	retlw	03Ch
	retlw	02h
	retlw	02h
	retlw	04h
	retlw	03Eh
	retlw	038h
	retlw	04h
	retlw	02h
	retlw	04h
	retlw	038h
	retlw	03Ch
	retlw	02h
	retlw	0Ch
	retlw	02h
	retlw	03Ch
	retlw	022h
	retlw	014h
	retlw	08h
	retlw	014h
	retlw	022h
	retlw	030h
	retlw	0Ah
	retlw	0Ah
	retlw	0Ah
	retlw	03Ch
	retlw	022h
	retlw	026h
	retlw	02Ah
	retlw	032h
	retlw	022h
	retlw	07Ch
	retlw	08Ah
	retlw	092h
	retlw	0A2h
	retlw	07Ch
	retlw	0
	retlw	042h
	retlw	0FEh
	retlw	02h
	retlw	0
	retlw	042h
	retlw	086h
	retlw	08Ah
	retlw	092h
	retlw	062h
	retlw	084h
	retlw	082h
	retlw	0A2h
	retlw	0D2h
	retlw	08Ch
	retlw	018h
	retlw	028h
	retlw	048h
	retlw	0FEh
	retlw	08h
	retlw	0E4h
	retlw	0A2h
	retlw	0A2h
	retlw	0A2h
	retlw	09Ch
	retlw	03Ch
	retlw	052h
	retlw	092h
	retlw	092h
	retlw	0Ch
	retlw	080h
	retlw	08Eh
	retlw	090h
	retlw	0A0h
	retlw	0C0h
	retlw	06Ch
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	06Ch
	retlw	060h
	retlw	092h
	retlw	092h
	retlw	094h
	retlw	078h
	retlw	040h
	retlw	080h
	retlw	08Ah
	retlw	090h
	retlw	060h
	retlw	0
	retlw	0
	retlw	0F2h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	024h
	retlw	0
	retlw	0
	retlw	028h
	retlw	0FEh
	retlw	028h
	retlw	0FEh
	retlw	028h
	retlw	014h
	retlw	08h
	retlw	03Eh
	retlw	08h
	retlw	014h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	0C4h
	retlw	0C8h
	retlw	010h
	retlw	026h
	retlw	046h
	global	_bitmap_computador
psect	stringtext
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\bitmap.h"
	line	6
_bitmap_computador:
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0F0h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	081h
	retlw	077h
	retlw	025h
	retlw	0DCh
	retlw	010h
	retlw	083h
	retlw	055h
	retlw	06Dh
	retlw	054h
	retlw	010h
	retlw	081h
	retlw	055h
	retlw	025h
	retlw	054h
	retlw	010h
	retlw	081h
	retlw	077h
	retlw	025h
	retlw	0DCh
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	081h
	retlw	077h
	retlw	072h
	retlw	05Ch
	retlw	010h
	retlw	083h
	retlw	055h
	retlw	056h
	retlw	0D4h
	retlw	010h
	retlw	081h
	retlw	055h
	retlw	052h
	retlw	054h
	retlw	010h
	retlw	081h
	retlw	077h
	retlw	072h
	retlw	05Ch
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	080h
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0F0h
	retlw	0
	retlw	0
	retlw	0C0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0C0h
	retlw	0
	retlw	0
	retlw	0
	retlw	01h
	retlw	0E0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01h
	retlw	0FFh
	retlw	0FFh
	retlw	0F0h
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	01h
	retlw	055h
	retlw	055h
	retlw	050h
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	01h
	retlw	02Ah
	retlw	0AAh
	retlw	090h
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	01h
	retlw	0FFh
	retlw	0FFh
	retlw	0F0h
	retlw	0
	global	_alfabeto
	global	_bitmap_computador
	global	_PORTA
_PORTA	set	5
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	global	_pinos_display
psect	nvBANK1,class=BANK1,space=1
global __pnvBANK1
__pnvBANK1:
_pinos_display:
       ds      20

	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_TRISC
_TRISC	set	135
psect	stringtext
	
STR_1:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	76	;'L'
	retlw	67	;'C'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	103	;'g'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	102	;'f'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	0
psect	stringtext
	
STR_3:	
	retlw	76	;'L'
	retlw	101	;'e'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	70	;'F'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	122	;'z'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	110	;'n'
	retlw	0
psect	stringtext
	
STR_6:	
	retlw	50	;'2'
	retlw	48	;'0'
	retlw	50	;'2'
	retlw	50	;'2'
	retlw	47	;'/'
	retlw	48	;'0'
	retlw	55	;'7'
	retlw	47	;'/'
	retlw	49	;'1'
	retlw	50	;'2'
	retlw	0
psect	stringtext
	
STR_5:	
	retlw	86	;'V'
	retlw	49	;'1'
	retlw	46	;'.'
	retlw	48	;'0'
	retlw	0
psect	stringtext
STR_2	equ	STR_1+0
STR_4	equ	STR_3+0
STR_7	equ	STR_6+0
	file	"TesteUnitarioLCDGrafico.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_RST
?_RST:	; 0 bytes @ 0x0
	global	??_RST
??_RST:	; 0 bytes @ 0x0
	global	?_RW
?_RW:	; 0 bytes @ 0x0
	global	??_RW
??_RW:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_LigarDisplay
?_LigarDisplay:	; 0 bytes @ 0x0
	global	?_E
?_E:	; 0 bytes @ 0x0
	global	??_E
??_E:	; 0 bytes @ 0x0
	global	?_delayMicroseconds
?_delayMicroseconds:	; 0 bytes @ 0x0
	global	?_SelecionarArea
?_SelecionarArea:	; 0 bytes @ 0x0
	global	?_RS
?_RS:	; 0 bytes @ 0x0
	global	??_RS
??_RS:	; 0 bytes @ 0x0
	global	?_CS1
?_CS1:	; 0 bytes @ 0x0
	global	??_CS1
??_CS1:	; 0 bytes @ 0x0
	global	?_CS2
?_CS2:	; 0 bytes @ 0x0
	global	??_CS2
??_CS2:	; 0 bytes @ 0x0
	global	?_InverterCores
?_InverterCores:	; 0 bytes @ 0x0
	global	?_LimparDisplay
?_LimparDisplay:	; 0 bytes @ 0x0
	global	?_Clock
?_Clock:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_LerDado
?_LerDado:	; 1 bytes @ 0x0
	global	?_ClockComLeitura
?_ClockComLeitura:	; 1 bytes @ 0x0
	global	?_Centralizar
?_Centralizar:	; 1 bytes @ 0x0
	global	?_JustificarDireita
?_JustificarDireita:	; 1 bytes @ 0x0
	global	?_TamanhoFrase
?_TamanhoFrase:	; 1 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	TamanhoFrase@frase
TamanhoFrase@frase:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	delay@ms
delay@ms:	; 4 bytes @ 0x0
	global	delayMicroseconds@us
delayMicroseconds@us:	; 4 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	ds	1
	global	??_TamanhoFrase
??_TamanhoFrase:	; 0 bytes @ 0x2
	global	E@e
E@e:	; 1 bytes @ 0x2
	global	RW@rw
RW@rw:	; 1 bytes @ 0x2
	global	RS@rs
RS@rs:	; 1 bytes @ 0x2
	global	CS1@cs1
CS1@cs1:	; 1 bytes @ 0x2
	global	CS2@cs2
CS2@cs2:	; 1 bytes @ 0x2
	global	RST@rst
RST@rst:	; 1 bytes @ 0x2
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	1
	global	??_SelecionarArea
??_SelecionarArea:	; 0 bytes @ 0x3
	global	_SelecionarArea$204
_SelecionarArea$204:	; 1 bytes @ 0x3
	global	TamanhoFrase@tamanho
TamanhoFrase@tamanho:	; 1 bytes @ 0x3
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x3
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x4
	global	??_delayMicroseconds
??_delayMicroseconds:	; 0 bytes @ 0x4
	global	??_JustificarDireita
??_JustificarDireita:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	SelecionarArea@area
SelecionarArea@area:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	global	delayMicroseconds@t
delayMicroseconds@t:	; 4 bytes @ 0x4
	ds	1
	global	JustificarDireita@tamanho_frase
JustificarDireita@tamanho_frase:	; 1 bytes @ 0x5
	ds	1
	global	??_Centralizar
??_Centralizar:	; 0 bytes @ 0x6
	global	delay@t
delay@t:	; 4 bytes @ 0x6
	ds	2
	global	?_EnderecoX
?_EnderecoX:	; 0 bytes @ 0x8
	global	?_EnderecoY
?_EnderecoY:	; 0 bytes @ 0x8
	global	?_EnviarDado
?_EnviarDado:	; 0 bytes @ 0x8
	global	??_LigarDisplay
??_LigarDisplay:	; 0 bytes @ 0x8
	global	??_Clock
??_Clock:	; 0 bytes @ 0x8
	global	??_ClockComLeitura
??_ClockComLeitura:	; 0 bytes @ 0x8
	global	EnviarDado@area
EnviarDado@area:	; 1 bytes @ 0x8
	global	EnderecoX@area
EnderecoX@area:	; 1 bytes @ 0x8
	global	EnderecoY@area
EnderecoY@area:	; 1 bytes @ 0x8
	ds	1
	global	??_EnderecoX
??_EnderecoX:	; 0 bytes @ 0x9
	global	??_EnderecoY
??_EnderecoY:	; 0 bytes @ 0x9
	global	??_EnviarDado
??_EnviarDado:	; 0 bytes @ 0x9
	global	ClockComLeitura@leitura
ClockComLeitura@leitura:	; 1 bytes @ 0x9
	ds	1
	global	??_LerDado
??_LerDado:	; 0 bytes @ 0xA
	global	EnviarDado@dado
EnviarDado@dado:	; 1 bytes @ 0xA
	global	EnderecoX@x
EnderecoX@x:	; 1 bytes @ 0xA
	global	EnderecoY@y
EnderecoY@y:	; 1 bytes @ 0xA
	ds	1
	global	??_LimparDisplay
??_LimparDisplay:	; 0 bytes @ 0xB
	global	LerDado@area
LerDado@area:	; 1 bytes @ 0xB
	ds	1
	global	LimparDisplay@y
LimparDisplay@y:	; 1 bytes @ 0xC
	global	LerDado@leitura
LerDado@leitura:	; 1 bytes @ 0xC
	global	Centralizar@tamanho_frase
Centralizar@tamanho_frase:	; 1 bytes @ 0xC
	ds	1
	global	??_InverterCores
??_InverterCores:	; 0 bytes @ 0xD
	global	LimparDisplay@x
LimparDisplay@x:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_InicializarDisplay
?_InicializarDisplay:	; 0 bytes @ 0x0
	global	?_NovoX
?_NovoX:	; 1 bytes @ 0x0
	global	InverterCores@leitura
InverterCores@leitura:	; 1 bytes @ 0x0
	global	NovoX@area
NovoX@area:	; 1 bytes @ 0x0
	global	InicializarDisplay@pinos
InicializarDisplay@pinos:	; 20 bytes @ 0x0
	ds	1
	global	InverterCores@x
InverterCores@x:	; 1 bytes @ 0x1
	global	NovoX@cor
NovoX@cor:	; 1 bytes @ 0x1
	ds	1
	global	??_NovoX
??_NovoX:	; 0 bytes @ 0x2
	global	InverterCores@y
InverterCores@y:	; 1 bytes @ 0x2
	ds	1
	global	InverterCores@area
InverterCores@area:	; 1 bytes @ 0x3
	ds	3
	global	_NovoX$157
_NovoX$157:	; 2 bytes @ 0x6
	ds	2
	global	NovoX@x
NovoX@x:	; 1 bytes @ 0x8
	ds	1
	global	NovoX@leitura
NovoX@leitura:	; 1 bytes @ 0x9
	ds	1
	global	?_Ponto
?_Ponto:	; 0 bytes @ 0xA
	global	Ponto@y
Ponto@y:	; 1 bytes @ 0xA
	ds	1
	global	Ponto@cor
Ponto@cor:	; 1 bytes @ 0xB
	ds	1
	global	??_Ponto
??_Ponto:	; 0 bytes @ 0xC
	ds	3
	global	Ponto@pagina
Ponto@pagina:	; 1 bytes @ 0xF
	ds	1
	global	Ponto@x
Ponto@x:	; 1 bytes @ 0x10
	ds	1
	global	Ponto@area
Ponto@area:	; 1 bytes @ 0x11
	ds	1
	global	?_EscreveCaractere
?_EscreveCaractere:	; 0 bytes @ 0x12
	global	?_DesenharBitmap
?_DesenharBitmap:	; 0 bytes @ 0x12
	global	EscreveCaractere@x
EscreveCaractere@x:	; 1 bytes @ 0x12
	global	DesenharBitmap@bitmap
DesenharBitmap@bitmap:	; 2 bytes @ 0x12
	ds	1
	global	EscreveCaractere@y
EscreveCaractere@y:	; 1 bytes @ 0x13
	ds	1
	global	??_InicializarDisplay
??_InicializarDisplay:	; 0 bytes @ 0x14
	global	EscreveCaractere@cor
EscreveCaractere@cor:	; 1 bytes @ 0x14
	global	DesenharBitmap@x
DesenharBitmap@x:	; 1 bytes @ 0x14
	ds	1
	global	??_EscreveCaractere
??_EscreveCaractere:	; 0 bytes @ 0x15
	global	DesenharBitmap@y
DesenharBitmap@y:	; 1 bytes @ 0x15
	ds	1
	global	DesenharBitmap@cor
DesenharBitmap@cor:	; 1 bytes @ 0x16
	ds	1
	global	DesenharBitmap@altura_px
DesenharBitmap@altura_px:	; 1 bytes @ 0x17
	global	_EscreveCaractere$282
_EscreveCaractere$282:	; 2 bytes @ 0x17
	ds	1
	global	DesenharBitmap@largura_bytes
DesenharBitmap@largura_bytes:	; 1 bytes @ 0x18
	ds	1
	global	??_DesenharBitmap
??_DesenharBitmap:	; 0 bytes @ 0x19
	global	EscreveCaractere@ponto
EscreveCaractere@ponto:	; 1 bytes @ 0x19
	ds	1
	global	EscreveCaractere@mascara
EscreveCaractere@mascara:	; 1 bytes @ 0x1A
	ds	1
	global	EscreveCaractere@x_aux
EscreveCaractere@x_aux:	; 1 bytes @ 0x1B
	global	_DesenharBitmap$3225
_DesenharBitmap$3225:	; 2 bytes @ 0x1B
	ds	1
	global	EscreveCaractere@y_aux
EscreveCaractere@y_aux:	; 1 bytes @ 0x1C
	ds	1
	global	DesenharBitmap@altura
DesenharBitmap@altura:	; 1 bytes @ 0x1D
	global	EscreveCaractere@end_alfa
EscreveCaractere@end_alfa:	; 2 bytes @ 0x1D
	ds	1
	global	DesenharBitmap@largura
DesenharBitmap@largura:	; 1 bytes @ 0x1E
	ds	1
	global	EscreveCaractere@caractere
EscreveCaractere@caractere:	; 1 bytes @ 0x1F
	global	DesenharBitmap@novoY
DesenharBitmap@novoY:	; 1 bytes @ 0x1F
	ds	1
	global	?_EscreveFrase
?_EscreveFrase:	; 0 bytes @ 0x20
	global	DesenharBitmap@ponto
DesenharBitmap@ponto:	; 1 bytes @ 0x20
	global	EscreveFrase@frase
EscreveFrase@frase:	; 2 bytes @ 0x20
	ds	1
	global	DesenharBitmap@mascara
DesenharBitmap@mascara:	; 1 bytes @ 0x21
	ds	1
	global	EscreveFrase@x
EscreveFrase@x:	; 1 bytes @ 0x22
	global	DesenharBitmap@bits
DesenharBitmap@bits:	; 1 bytes @ 0x22
	ds	1
	global	EscreveFrase@y
EscreveFrase@y:	; 1 bytes @ 0x23
	ds	1
	global	EscreveFrase@cor
EscreveFrase@cor:	; 1 bytes @ 0x24
	ds	1
	global	??_EscreveFrase
??_EscreveFrase:	; 0 bytes @ 0x25
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x28
	ds	4
	global	main@latchb
main@latchb:	; 1 bytes @ 0x2C
	ds	1
	global	main@pinos
main@pinos:	; 20 bytes @ 0x2D
	ds	20
;;Data sizes: Strings 53, constant 540, data 0, bss 0, persistent 20 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     65      65
;; BANK1           80      0      20
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; DesenharBitmap@bitmap	PTR const unsigned char  size(2) Largest target is 175
;;		 -> bitmap_computador(CODE[175]), 
;;
;; pinos.latchDADOS.tris	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> TRISC(BITSFR1[1]), 
;;
;; pinos.latchDADOS.latch	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTC(BITSFR0[1]), 
;;
;; pinos.pinoRST.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRST.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoCS2.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoCS2.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoCS1.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoCS1.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoRS.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRS.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoRW.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRW.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoE.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoE.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; EscreveFrase@frase	PTR const unsigned char  size(2) Largest target is 19
;;		 -> STR_6(CODE[11]), STR_5(CODE[5]), STR_3(CODE[18]), STR_1(CODE[19]), 
;;
;; TamanhoFrase@frase	PTR const unsigned char  size(2) Largest target is 19
;;		 -> STR_7(CODE[11]), STR_4(CODE[18]), STR_2(CODE[19]), 
;;
;; pinos.latchDADOS.tris	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> TRISC(BITSFR1[1]), 
;;
;; pinos.latchDADOS.latch	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTC(BITSFR0[1]), 
;;
;; pinos.pinoRST.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRST.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoCS2.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoCS2.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoCS1.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoCS1.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoRS.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRS.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoRW.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoRW.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos.pinoE.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos.pinoE.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; S23$tris	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> TRISC(BITSFR1[1]), 
;;
;; pinos_display.latchDADOS.tris	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> TRISC(BITSFR1[1]), 
;;
;; S23$latch	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTC(BITSFR0[1]), 
;;
;; pinos_display.latchDADOS.latch	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTC(BITSFR0[1]), 
;;
;; pinos_display.pinoRST.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoRST.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos_display.pinoCS2.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoCS2.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos_display.pinoCS1.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoCS1.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos_display.pinoRS.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoRS.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos_display.pinoRW.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoRW.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; S19$latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; pinos_display.pinoE.latch_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> main@latchb(BANK0[1]), 
;;
;; S19$porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;
;; pinos_display.pinoE.porta_pino	PTR volatile unsigned char  size(1) Largest target is 1
;;		 -> PORTB(BITSFR0[1]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_InverterCores
;;   _EscreveFrase->_Centralizar
;;   _InicializarDisplay->_LimparDisplay
;;   _LimparDisplay->_EnderecoX
;;   _LimparDisplay->_EnviarDado
;;   _NovoX->_LerDado
;;   _InverterCores->_LerDado
;;   _LerDado->_ClockComLeitura
;;   _ClockComLeitura->_delayMicroseconds
;;   _Clock->_delayMicroseconds
;;   _JustificarDireita->___bmul
;;   _Centralizar->___wmul
;;   _SelecionarArea->_CS1
;;   _SelecionarArea->_CS2
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_EscreveFrase
;;   _EscreveFrase->_EscreveCaractere
;;   _DesenharBitmap->_Ponto
;;   _EscreveCaractere->_Ponto
;;   _Ponto->_NovoX
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                25    25      0    8501
;;                                             40 BANK0     25    25      0
;;                 _InicializarDisplay
;;                       _TamanhoFrase
;;                        _Centralizar
;;                       _EscreveFrase
;;                     _DesenharBitmap
;;                  _JustificarDireita
;;                              _delay
;;                      _InverterCores
;; ---------------------------------------------------------------------------------
;; (1) _EscreveFrase                                         8     3      5    2595
;;                                             32 BANK0      8     3      5
;;                   _EscreveCaractere
;;                        _Centralizar (ARG)
;;                       _TamanhoFrase (ARG)
;;                  _JustificarDireita (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _DesenharBitmap                                      17    10      7    2184
;;                                             18 BANK0     17    10      7
;;                              _Ponto
;; ---------------------------------------------------------------------------------
;; (2) _EscreveCaractere                                    14    11      3    2483
;;                                             18 BANK0     14    11      3
;;                             ___wmul
;;                              _Ponto
;; ---------------------------------------------------------------------------------
;; (1) _InicializarDisplay                                  24     4     20    1124
;;                                              0 BANK0     24     4     20
;;                                _RST
;;                                 _RW
;;                              _delay
;;                       _LigarDisplay
;;                      _LimparDisplay
;; ---------------------------------------------------------------------------------
;; (2) _Ponto                                                8     6      2    1817
;;                                             10 BANK0      8     6      2
;;                          _EnderecoX
;;                          _EnderecoY
;;                              _NovoX
;;                         _EnviarDado
;; ---------------------------------------------------------------------------------
;; (2) _LimparDisplay                                        3     3      0     742
;;                                             11 COMMON     3     3      0
;;                          _EnderecoX
;;                         _EnviarDado
;; ---------------------------------------------------------------------------------
;; (3) _NovoX                                               10     8      2     517
;;                                              0 BANK0     10     8      2
;;                            _LerDado
;; ---------------------------------------------------------------------------------
;; (1) _InverterCores                                        5     5      0    1639
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      4     4      0
;;                          _EnderecoX
;;                          _EnderecoY
;;                            _LerDado
;;                         _EnviarDado
;; ---------------------------------------------------------------------------------
;; (2) _LigarDisplay                                         1     1      0     270
;;                                              8 COMMON     1     1      0
;;                     _SelecionarArea
;;                                 _RS
;;                              _Clock
;; ---------------------------------------------------------------------------------
;; (2) _EnviarDado                                           3     2      1     314
;;                                              8 COMMON     3     2      1
;;                     _SelecionarArea
;;                                 _RS
;;                              _Clock
;; ---------------------------------------------------------------------------------
;; (2) _LerDado                                              3     3      0     360
;;                                             10 COMMON     3     3      0
;;                     _SelecionarArea
;;                                 _RS
;;                    _ClockComLeitura
;; ---------------------------------------------------------------------------------
;; (2) _EnderecoY                                            3     2      1     314
;;                                              8 COMMON     3     2      1
;;                     _SelecionarArea
;;                                 _RS
;;                              _Clock
;; ---------------------------------------------------------------------------------
;; (2) _EnderecoX                                            3     2      1     314
;;                                              8 COMMON     3     2      1
;;                     _SelecionarArea
;;                                 _RS
;;                              _Clock
;; ---------------------------------------------------------------------------------
;; (3) _ClockComLeitura                                      2     2      0     113
;;                                              8 COMMON     2     2      0
;;                                 _RW
;;                                  _E
;;                  _delayMicroseconds
;; ---------------------------------------------------------------------------------
;; (3) _Clock                                                0     0      0      68
;;                                  _E
;;                  _delayMicroseconds
;; ---------------------------------------------------------------------------------
;; (1) _JustificarDireita                                    2     2      0     114
;;                                              4 COMMON     2     2      0
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (1) _Centralizar                                          7     7      0     114
;;                                              6 COMMON     7     7      0
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (3) _SelecionarArea                                       2     2      0     180
;;                                              3 COMMON     2     2      0
;;                                _CS1
;;                                _CS2
;; ---------------------------------------------------------------------------------
;; (4) _delayMicroseconds                                    8     4      4      46
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _delay                                               10     6      4      46
;;                                              0 COMMON    10     6      4
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               4     3      1      92
;;                                              0 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (2) _TamanhoFrase                                         4     2      2      47
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (4) _CS2                                                  3     3      0      45
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _CS1                                                  3     3      0      45
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _RS                                                   3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _E                                                    3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _RW                                                   3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _RST                                                  3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InicializarDisplay
;;     _RST
;;     _RW
;;     _delay
;;     _LigarDisplay
;;       _SelecionarArea
;;         _CS1
;;         _CS2
;;       _RS
;;       _Clock
;;         _E
;;         _delayMicroseconds
;;     _LimparDisplay
;;       _EnderecoX
;;         _SelecionarArea
;;           _CS1
;;           _CS2
;;         _RS
;;         _Clock
;;           _E
;;           _delayMicroseconds
;;       _EnviarDado
;;         _SelecionarArea
;;           _CS1
;;           _CS2
;;         _RS
;;         _Clock
;;           _E
;;           _delayMicroseconds
;;   _TamanhoFrase
;;   _Centralizar
;;     ___wmul
;;   _EscreveFrase
;;     _EscreveCaractere
;;       ___wmul
;;       _Ponto
;;         _EnderecoX
;;           _SelecionarArea
;;             _CS1
;;             _CS2
;;           _RS
;;           _Clock
;;             _E
;;             _delayMicroseconds
;;         _EnderecoY
;;           _SelecionarArea
;;             _CS1
;;             _CS2
;;           _RS
;;           _Clock
;;             _E
;;             _delayMicroseconds
;;         _NovoX
;;           _LerDado
;;             _SelecionarArea
;;               _CS1
;;               _CS2
;;             _RS
;;             _ClockComLeitura
;;               _RW
;;               _E
;;               _delayMicroseconds
;;         _EnviarDado
;;           _SelecionarArea
;;             _CS1
;;             _CS2
;;           _RS
;;           _Clock
;;             _E
;;             _delayMicroseconds
;;     _Centralizar (ARG)
;;       ___wmul
;;     _TamanhoFrase (ARG)
;;     _JustificarDireita (ARG)
;;       ___bmul
;;   _DesenharBitmap
;;     _Ponto
;;       _EnderecoX
;;         _SelecionarArea
;;           _CS1
;;           _CS2
;;         _RS
;;         _Clock
;;           _E
;;           _delayMicroseconds
;;       _EnderecoY
;;         _SelecionarArea
;;           _CS1
;;           _CS2
;;         _RS
;;         _Clock
;;           _E
;;           _delayMicroseconds
;;       _NovoX
;;         _LerDado
;;           _SelecionarArea
;;             _CS1
;;             _CS2
;;           _RS
;;           _ClockComLeitura
;;             _RW
;;             _E
;;             _delayMicroseconds
;;       _EnviarDado
;;         _SelecionarArea
;;           _CS1
;;           _CS2
;;         _RS
;;         _Clock
;;           _E
;;           _delayMicroseconds
;;   _JustificarDireita
;;     ___bmul
;;   _delay
;;   _InverterCores
;;     _EnderecoX
;;       _SelecionarArea
;;         _CS1
;;         _CS2
;;       _RS
;;       _Clock
;;         _E
;;         _delayMicroseconds
;;     _EnderecoY
;;       _SelecionarArea
;;         _CS1
;;         _CS2
;;       _RS
;;       _Clock
;;         _E
;;         _delayMicroseconds
;;     _LerDado
;;       _SelecionarArea
;;         _CS1
;;         _CS2
;;       _RS
;;       _ClockComLeitura
;;         _RW
;;         _E
;;         _delayMicroseconds
;;     _EnviarDado
;;       _SelecionarArea
;;         _CS1
;;         _CS2
;;       _RS
;;       _Clock
;;         _E
;;         _delayMicroseconds
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;ABS                  0      0      63       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     41      41       5       81.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      14       7       25.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      6A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 13 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  pinos          20   45[BANK0 ] struct .
;;  latchb          1   44[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      21       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      25       0       0       0
;;Total ram usage:       25 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_InicializarDisplay
;;		_TamanhoFrase
;;		_Centralizar
;;		_EscreveFrase
;;		_DesenharBitmap
;;		_JustificarDireita
;;		_delay
;;		_InverterCores
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\unit_test.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	14
	
l5486:	
;unit_test.c: 14: unsigned char latchb = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@latchb)
	line	16
	
l5488:	
;unit_test.c: 16: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	17
;unit_test.c: 17: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	18
;unit_test.c: 18: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	21
;unit_test.c: 21: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	22
;unit_test.c: 22: PORTB = 0;
	clrf	(6)	;volatile
	line	23
;unit_test.c: 23: PORTC = 0;
	clrf	(7)	;volatile
	line	27
	
l5490:	
;unit_test.c: 26: MCUConfig pinos;
;unit_test.c: 27: pinos.pinoE.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@pinos)
	line	28
	
l5492:	
;unit_test.c: 28: pinos.pinoE.bit_pino = 7;
	movlw	(07h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+02h
	line	29
	
l5494:	
;unit_test.c: 29: pinos.pinoE.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+01h)
	line	30
	
l5496:	
;unit_test.c: 30: pinos.pinoRW.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+03h)
	line	31
	
l5498:	
;unit_test.c: 31: pinos.pinoRW.bit_pino = 6;
	movlw	(06h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+05h
	line	32
	
l5500:	
;unit_test.c: 32: pinos.pinoRW.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+04h)
	line	33
	
l5502:	
;unit_test.c: 33: pinos.pinoRS.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+06h)
	line	34
	
l5504:	
;unit_test.c: 34: pinos.pinoRS.bit_pino = 5;
	movlw	(05h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+08h
	line	35
	
l5506:	
;unit_test.c: 35: pinos.pinoRS.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+07h)
	line	36
	
l5508:	
;unit_test.c: 36: pinos.pinoCS1.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+09h)
	line	37
	
l5510:	
;unit_test.c: 37: pinos.pinoCS1.bit_pino = 3;
	movlw	(03h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+0Bh
	line	38
	
l5512:	
;unit_test.c: 38: pinos.pinoCS1.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+0Ah)
	line	39
	
l5514:	
;unit_test.c: 39: pinos.pinoCS2.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+0Ch)
	line	40
	
l5516:	
;unit_test.c: 40: pinos.pinoCS2.bit_pino = 4;
	movlw	(04h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+0Eh
	line	41
	
l5518:	
;unit_test.c: 41: pinos.pinoCS2.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+0Dh)
	line	42
	
l5520:	
;unit_test.c: 42: pinos.pinoRST.porta_pino = &PORTB;
	movlw	(6)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+0Fh)
	line	43
	
l5522:	
;unit_test.c: 43: pinos.pinoRST.bit_pino = 2;
	movlw	(02h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(main@pinos)+011h
	line	44
	
l5524:	
;unit_test.c: 44: pinos.pinoRST.latch_pino = &latchb;
	movlw	(main@latchb)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+010h)
	line	45
	
l5526:	
;unit_test.c: 45: pinos.latchDADOS.latch = &PORTC;
	movlw	(7)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+012h)
	line	46
	
l5528:	
;unit_test.c: 46: pinos.latchDADOS.tris = &TRISC;
	movlw	(135)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(0+main@pinos+013h)
	line	49
	
l5530:	
;unit_test.c: 49: InicializarDisplay(pinos);
	movlw	(?_InicializarDisplay)&0ffh
	movwf	fsr0
	movlw	low(main@pinos)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	20
	movwf	((??_main+0)+0+2)
u3610:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u3610
	fcall	_InicializarDisplay
	line	50
	
l5532:	
;unit_test.c: 50: EscreveFrase("Driver LCD grafico", 1, Centralizar(TamanhoFrase("Driver LCD grafico")), 1);
	movlw	low(STR_1|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_EscreveFrase)
	movlw	high(STR_1|8000h)
	movwf	((?_EscreveFrase))+1
	clrf	0+(?_EscreveFrase)+02h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+02h,f
	movlw	low(STR_2|8000h)
	movwf	(?_TamanhoFrase)
	movlw	high(STR_2|8000h)
	movwf	((?_TamanhoFrase))+1
	fcall	_TamanhoFrase
	fcall	_Centralizar
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EscreveFrase)+03h
	clrf	0+(?_EscreveFrase)+04h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+04h,f
	fcall	_EscreveFrase
	line	51
	
l5534:	
;unit_test.c: 51: EscreveFrase("Leonardo Felzmann", 9, Centralizar(TamanhoFrase("Leonardo Felzmann")), 1);
	movlw	low(STR_3|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_EscreveFrase)
	movlw	high(STR_3|8000h)
	movwf	((?_EscreveFrase))+1
	movlw	(09h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EscreveFrase)+02h
	movlw	low(STR_4|8000h)
	movwf	(?_TamanhoFrase)
	movlw	high(STR_4|8000h)
	movwf	((?_TamanhoFrase))+1
	fcall	_TamanhoFrase
	fcall	_Centralizar
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_EscreveFrase)+03h
	clrf	0+(?_EscreveFrase)+04h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+04h,f
	fcall	_EscreveFrase
	line	52
	
l5536:	
;unit_test.c: 52: DesenharBitmap(bitmap_computador, 17, 51, 1, 35, 5);
	movlw	low(_bitmap_computador|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_DesenharBitmap)
	movlw	high(_bitmap_computador|8000h)
	movwf	((?_DesenharBitmap))+1
	movlw	(011h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_DesenharBitmap)+02h
	movlw	(033h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_DesenharBitmap)+03h
	clrf	0+(?_DesenharBitmap)+04h
	bsf	status,0
	rlf	0+(?_DesenharBitmap)+04h,f
	movlw	(023h)
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	0+(?_DesenharBitmap)+05h
	movlw	(05h)
	movwf	(??_main+3)+0
	movf	(??_main+3)+0,w
	movwf	0+(?_DesenharBitmap)+06h
	fcall	_DesenharBitmap
	line	53
	
l5538:	
;unit_test.c: 53: EscreveFrase("V1.0", 57, 1, 1);
	movlw	low(STR_5|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_EscreveFrase)
	movlw	high(STR_5|8000h)
	movwf	((?_EscreveFrase))+1
	movlw	(039h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EscreveFrase)+02h
	clrf	0+(?_EscreveFrase)+03h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+03h,f
	clrf	0+(?_EscreveFrase)+04h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+04h,f
	fcall	_EscreveFrase
	line	54
	
l5540:	
;unit_test.c: 54: EscreveFrase("2022/07/12", 57, JustificarDireita(TamanhoFrase("2022/07/12")), 1);
	movlw	low(STR_6|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_EscreveFrase)
	movlw	high(STR_6|8000h)
	movwf	((?_EscreveFrase))+1
	movlw	(039h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EscreveFrase)+02h
	movlw	low(STR_7|8000h)
	movwf	(?_TamanhoFrase)
	movlw	high(STR_7|8000h)
	movwf	((?_TamanhoFrase))+1
	fcall	_TamanhoFrase
	fcall	_JustificarDireita
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_EscreveFrase)+03h
	clrf	0+(?_EscreveFrase)+04h
	bsf	status,0
	rlf	0+(?_EscreveFrase)+04h,f
	fcall	_EscreveFrase
	line	55
	
l5542:	
;unit_test.c: 55: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	56
	
l5544:	
;unit_test.c: 56: InverterCores();
	fcall	_InverterCores
	goto	l1190
	line	57
;unit_test.c: 57: while(1)
	
l1189:	
	line	59
;unit_test.c: 58: {
	
l1190:	
	line	57
	goto	l1190
	
l1191:	
	line	60
	
l1192:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_EscreveFrase
psect	text651,local,class=CODE,delta=2
global __ptext651
__ptext651:

;; *************** function _EscreveFrase *****************
;; Defined at:
;;		line 173 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
;; Parameters:    Size  Location     Type
;;  frase           2   32[BANK0 ] PTR const unsigned char 
;;		 -> STR_6(11), STR_5(5), STR_3(18), STR_1(19), 
;;  x               1   34[BANK0 ] unsigned char 
;;  y               1   35[BANK0 ] unsigned char 
;;  cor             1   36[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_EscreveCaractere
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text651
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
	line	173
	global	__size_of_EscreveFrase
	__size_of_EscreveFrase	equ	__end_of_EscreveFrase-_EscreveFrase
	
_EscreveFrase:	
	opt	stack 1
; Regs used in _EscreveFrase: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	174
	
l5476:	
;recursos_texto.c: 174: while(*frase)
	goto	l5484
	
l198:	
	line	176
	
l5478:	
;recursos_texto.c: 175: {
;recursos_texto.c: 176: EscreveCaractere(*frase, x, y, cor);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EscreveFrase@x),w
	movwf	(??_EscreveFrase+0)+0
	movf	(??_EscreveFrase+0)+0,w
	movwf	(?_EscreveCaractere)
	movf	(EscreveFrase@y),w
	movwf	(??_EscreveFrase+1)+0
	movf	(??_EscreveFrase+1)+0,w
	movwf	0+(?_EscreveCaractere)+01h
	movf	(EscreveFrase@cor),w
	movwf	(??_EscreveFrase+2)+0
	movf	(??_EscreveFrase+2)+0,w
	movwf	0+(?_EscreveCaractere)+02h
	movf	(EscreveFrase@frase+1),w
	movwf	btemp+1
	movf	(EscreveFrase@frase),w
	movwf	fsr0
	fcall	stringtab
	fcall	_EscreveCaractere
	line	177
	
l5480:	
;recursos_texto.c: 177: frase++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(EscreveFrase@frase),f
	skipnc
	incf	(EscreveFrase@frase+1),f
	movlw	high(01h)
	addwf	(EscreveFrase@frase+1),f
	line	178
	
l5482:	
;recursos_texto.c: 178: y += (5 + 1);
	movlw	(06h)
	movwf	(??_EscreveFrase+0)+0
	movf	(??_EscreveFrase+0)+0,w
	addwf	(EscreveFrase@y),f
	goto	l5484
	line	179
	
l197:	
	line	174
	
l5484:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EscreveFrase@frase+1),w
	movwf	btemp+1
	movf	(EscreveFrase@frase),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3601
	goto	u3600
u3601:
	goto	l5478
u3600:
	goto	l200
	
l199:	
	line	180
	
l200:	
	return
	opt stack 0
GLOBAL	__end_of_EscreveFrase
	__end_of_EscreveFrase:
;; =============== function _EscreveFrase ends ============

	signat	_EscreveFrase,16504
	global	_DesenharBitmap
psect	text652,local,class=CODE,delta=2
global __ptext652
__ptext652:

;; *************** function _DesenharBitmap *****************
;; Defined at:
;;		line 14 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\bitmap.c"
;; Parameters:    Size  Location     Type
;;  bitmap          2   18[BANK0 ] PTR const unsigned char 
;;		 -> bitmap_computador(175), 
;;  x               1   20[BANK0 ] unsigned char 
;;  y               1   21[BANK0 ] unsigned char 
;;  cor             1   22[BANK0 ] unsigned char 
;;  altura_px       1   23[BANK0 ] unsigned char 
;;  largura_byte    1   24[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  bits            1   34[BANK0 ] unsigned char 
;;  mascara         1   33[BANK0 ] unsigned char 
;;  ponto           1   32[BANK0 ] unsigned char 
;;  novoY           1   31[BANK0 ] unsigned char 
;;  largura         1   30[BANK0 ] unsigned char 
;;  altura          1   29[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       7       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      17       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Ponto
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text652
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\bitmap.c"
	line	14
	global	__size_of_DesenharBitmap
	__size_of_DesenharBitmap	equ	__end_of_DesenharBitmap-_DesenharBitmap
	
_DesenharBitmap:	
	opt	stack 2
; Regs used in _DesenharBitmap: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	21
	
l5436:	
;bitmap.c: 15: unsigned char altura;
;bitmap.c: 16: unsigned char largura;
;bitmap.c: 17: unsigned char mascara;
;bitmap.c: 18: unsigned char bits;
;bitmap.c: 19: unsigned char novoY;
;bitmap.c: 20: unsigned char ponto;
;bitmap.c: 21: for(altura = 0; altura < altura_px; altura++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(DesenharBitmap@altura)
	goto	l5474
	line	22
	
l2180:	
	line	23
	
l5438:	
;bitmap.c: 22: {
;bitmap.c: 23: novoY = y;
	movf	(DesenharBitmap@y),w
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	movwf	(DesenharBitmap@novoY)
	line	24
	
l5440:	
;bitmap.c: 24: for(largura = 0; largura < largura_bytes; largura++)
	clrf	(DesenharBitmap@largura)
	goto	l5470
	line	25
	
l2182:	
	line	26
	
l5442:	
;bitmap.c: 25: {
;bitmap.c: 26: mascara = 0b10000000;
	movlw	(080h)
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	movwf	(DesenharBitmap@mascara)
	line	27
	
l5444:	
;bitmap.c: 27: for(bits = 0; bits < 8; bits++)
	clrf	(DesenharBitmap@bits)
	movlw	(08h)
	subwf	(DesenharBitmap@bits),w
	skipc
	goto	u3551
	goto	u3550
u3551:
	goto	l5448
u3550:
	goto	l5466
	
l5446:	
	goto	l5466
	line	28
	
l2183:	
	line	29
	
l5448:	
;bitmap.c: 28: {
;bitmap.c: 29: ponto = *bitmap & mascara;
	movf	(DesenharBitmap@bitmap+1),w
	movwf	btemp+1
	movf	(DesenharBitmap@bitmap),w
	movwf	fsr0
	fcall	stringtab
	andwf	(DesenharBitmap@mascara),w
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	movwf	(DesenharBitmap@ponto)
	line	30
	
l5450:	
;bitmap.c: 30: Ponto(x, novoY, cor ? ponto : !ponto);
	movf	(DesenharBitmap@cor),f
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l5454
u3560:
	
l5452:	
	movf	(DesenharBitmap@ponto)
	movlw	0
	skipnz
	movlw	1
	movwf	(??_DesenharBitmap+0)+0
	clrf	(??_DesenharBitmap+0)+0+1
	movf	0+(??_DesenharBitmap+0)+0,w
	movwf	(_DesenharBitmap$3225)
	movf	1+(??_DesenharBitmap+0)+0,w
	movwf	(_DesenharBitmap$3225+1)
	goto	l5456
	
l2186:	
	
l5454:	
	movf	(DesenharBitmap@ponto),w
	movwf	(??_DesenharBitmap+0)+0
	clrf	(??_DesenharBitmap+0)+0+1
	movf	0+(??_DesenharBitmap+0)+0,w
	movwf	(_DesenharBitmap$3225)
	movf	1+(??_DesenharBitmap+0)+0,w
	movwf	(_DesenharBitmap$3225+1)
	goto	l5456
	
l2188:	
	
l5456:	
	movf	(DesenharBitmap@novoY),w
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	movwf	(?_Ponto)
	movf	(_DesenharBitmap$3225),w
	movwf	(??_DesenharBitmap+1)+0
	movf	(??_DesenharBitmap+1)+0,w
	movwf	0+(?_Ponto)+01h
	movf	(DesenharBitmap@x),w
	fcall	_Ponto
	line	31
	
l5458:	
;bitmap.c: 31: novoY++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	addwf	(DesenharBitmap@novoY),f
	line	32
	
l5460:	
;bitmap.c: 32: mascara = mascara >> 1;
	movf	(DesenharBitmap@mascara),w
	movwf	(??_DesenharBitmap+0)+0
	clrc
	rrf	(??_DesenharBitmap+0)+0,w
	movwf	(??_DesenharBitmap+1)+0
	movf	(??_DesenharBitmap+1)+0,w
	movwf	(DesenharBitmap@mascara)
	line	27
	
l5462:	
	movlw	(01h)
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	addwf	(DesenharBitmap@bits),f
	
l5464:	
	movlw	(08h)
	subwf	(DesenharBitmap@bits),w
	skipc
	goto	u3571
	goto	u3570
u3571:
	goto	l5448
u3570:
	goto	l5466
	
l2184:	
	line	34
	
l5466:	
;bitmap.c: 33: }
;bitmap.c: 34: bitmap++;
	movlw	low(01h)
	addwf	(DesenharBitmap@bitmap),f
	skipnc
	incf	(DesenharBitmap@bitmap+1),f
	movlw	high(01h)
	addwf	(DesenharBitmap@bitmap+1),f
	line	24
	
l5468:	
	movlw	(01h)
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	addwf	(DesenharBitmap@largura),f
	goto	l5470
	
l2181:	
	
l5470:	
	movf	(DesenharBitmap@largura_bytes),w
	subwf	(DesenharBitmap@largura),w
	skipc
	goto	u3581
	goto	u3580
u3581:
	goto	l5442
u3580:
	goto	l5472
	
l2189:	
	line	36
	
l5472:	
;bitmap.c: 35: }
;bitmap.c: 36: x++;
	movlw	(01h)
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	addwf	(DesenharBitmap@x),f
	line	21
	movlw	(01h)
	movwf	(??_DesenharBitmap+0)+0
	movf	(??_DesenharBitmap+0)+0,w
	addwf	(DesenharBitmap@altura),f
	goto	l5474
	
l2179:	
	
l5474:	
	movf	(DesenharBitmap@altura_px),w
	subwf	(DesenharBitmap@altura),w
	skipc
	goto	u3591
	goto	u3590
u3591:
	goto	l5438
u3590:
	goto	l2191
	
l2190:	
	line	38
	
l2191:	
	return
	opt stack 0
GLOBAL	__end_of_DesenharBitmap
	__end_of_DesenharBitmap:
;; =============== function _DesenharBitmap ends ============

	signat	_DesenharBitmap,24696
	global	_EscreveCaractere
psect	text653,local,class=CODE,delta=2
global __ptext653
__ptext653:

;; *************** function _EscreveCaractere *****************
;; Defined at:
;;		line 98 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
;; Parameters:    Size  Location     Type
;;  caractere       1    wreg     unsigned char 
;;  x               1   18[BANK0 ] unsigned char 
;;  y               1   19[BANK0 ] unsigned char 
;;  cor             1   20[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  caractere       1   31[BANK0 ] unsigned char 
;;  end_alfa        2   29[BANK0 ] unsigned int 
;;  y_aux           1   28[BANK0 ] unsigned char 
;;  x_aux           1   27[BANK0 ] unsigned char 
;;  mascara         1   26[BANK0 ] unsigned char 
;;  ponto           1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___wmul
;;		_Ponto
;; This function is called by:
;;		_EscreveFrase
;;		_EscreveVariavel
;; This function uses a non-reentrant model
;;
psect	text653
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
	line	98
	global	__size_of_EscreveCaractere
	__size_of_EscreveCaractere	equ	__end_of_EscreveCaractere-_EscreveCaractere
	
_EscreveCaractere:	
	opt	stack 1
; Regs used in _EscreveCaractere: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;EscreveCaractere@caractere stored from wreg
	line	105
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(EscreveCaractere@caractere)
	
l5366:	
;recursos_texto.c: 99: unsigned char ponto;
;recursos_texto.c: 100: unsigned char mascara;
;recursos_texto.c: 101: unsigned char x_aux, y_aux;
;recursos_texto.c: 102: unsigned int end_alfa;
;recursos_texto.c: 105: if(caractere >= '0' && caractere <= '9')
	movlw	(030h)
	subwf	(EscreveCaractere@caractere),w
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l5372
u3460:
	
l5368:	
	movlw	(03Ah)
	subwf	(EscreveCaractere@caractere),w
	skipnc
	goto	u3471
	goto	u3470
u3471:
	goto	l5372
u3470:
	line	106
	
l5370:	
;recursos_texto.c: 106: end_alfa = ((caractere - 48) * 5) + 260;
	movf	(EscreveCaractere@caractere),w
	addlw	low(-48)
	movwf	(?___wmul)
	movlw	high(-48)
	skipnc
	movlw	(high(-48)+1)&0ffh
	movwf	((?___wmul))+1
	movlw	low(05h)
	movwf	0+(?___wmul)+02h
	movlw	high(05h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addlw	low(0104h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(EscreveCaractere@end_alfa)
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(0104h)
	movwf	1+(EscreveCaractere@end_alfa)
	goto	l5410
	line	107
	
l165:	
	
l5372:	
;recursos_texto.c: 107: else if(caractere >= 'A' && caractere <= 'Z')
	movlw	(041h)
	subwf	(EscreveCaractere@caractere),w
	skipc
	goto	u3481
	goto	u3480
u3481:
	goto	l5378
u3480:
	
l5374:	
	movlw	(05Bh)
	subwf	(EscreveCaractere@caractere),w
	skipnc
	goto	u3491
	goto	u3490
u3491:
	goto	l5378
u3490:
	line	108
	
l5376:	
;recursos_texto.c: 108: end_alfa = (caractere - 'A') * 5;
	movf	(EscreveCaractere@caractere),w
	addlw	low(0FFBFh)
	movwf	(?___wmul)
	movlw	high(0FFBFh)
	skipnc
	movlw	(high(0FFBFh)+1)&0ffh
	movwf	((?___wmul))+1
	movlw	low(05h)
	movwf	0+(?___wmul)+02h
	movlw	high(05h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(EscreveCaractere@end_alfa+1)
	addwf	(EscreveCaractere@end_alfa+1)
	movf	(0+(?___wmul)),w
	clrf	(EscreveCaractere@end_alfa)
	addwf	(EscreveCaractere@end_alfa)

	goto	l5410
	line	109
	
l167:	
	
l5378:	
;recursos_texto.c: 109: else if(caractere >= 'a' && caractere <= 'z')
	movlw	(061h)
	subwf	(EscreveCaractere@caractere),w
	skipc
	goto	u3501
	goto	u3500
u3501:
	goto	l5408
u3500:
	
l5380:	
	movlw	(07Bh)
	subwf	(EscreveCaractere@caractere),w
	skipnc
	goto	u3511
	goto	u3510
u3511:
	goto	l5408
u3510:
	line	110
	
l5382:	
;recursos_texto.c: 110: end_alfa = ((caractere - 'a') + 26 ) * 5;
	movf	(EscreveCaractere@caractere),w
	addlw	low(0FFB9h)
	movwf	(?___wmul)
	movlw	high(0FFB9h)
	skipnc
	movlw	(high(0FFB9h)+1)&0ffh
	movwf	((?___wmul))+1
	movlw	low(05h)
	movwf	0+(?___wmul)+02h
	movlw	high(05h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(EscreveCaractere@end_alfa+1)
	addwf	(EscreveCaractere@end_alfa+1)
	movf	(0+(?___wmul)),w
	clrf	(EscreveCaractere@end_alfa)
	addwf	(EscreveCaractere@end_alfa)

	goto	l5410
	line	111
	
l169:	
	line	113
;recursos_texto.c: 111: else
;recursos_texto.c: 112: {
;recursos_texto.c: 113: switch(caractere)
	goto	l5408
	line	115
;recursos_texto.c: 114: {
;recursos_texto.c: 115: case '?':
	
l172:	
	line	116
	
l5384:	
;recursos_texto.c: 116: end_alfa = 310;
	movlw	low(0136h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0136h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	117
;recursos_texto.c: 117: break;
	goto	l5410
	line	118
;recursos_texto.c: 118: case '!':
	
l174:	
	line	119
	
l5386:	
;recursos_texto.c: 119: end_alfa = 315;
	movlw	low(013Bh)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(013Bh)
	movwf	((EscreveCaractere@end_alfa))+1
	line	120
;recursos_texto.c: 120: break;
	goto	l5410
	line	121
;recursos_texto.c: 121: case '.':
	
l175:	
	line	122
	
l5388:	
;recursos_texto.c: 122: end_alfa = 320;
	movlw	low(0140h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0140h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	123
;recursos_texto.c: 123: break;
	goto	l5410
	line	124
;recursos_texto.c: 124: case ',':
	
l176:	
	line	125
	
l5390:	
;recursos_texto.c: 125: end_alfa = 325;
	movlw	low(0145h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0145h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	126
;recursos_texto.c: 126: break;
	goto	l5410
	line	127
;recursos_texto.c: 127: case ':':
	
l177:	
	line	128
	
l5392:	
;recursos_texto.c: 128: end_alfa = 330;
	movlw	low(014Ah)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(014Ah)
	movwf	((EscreveCaractere@end_alfa))+1
	line	129
;recursos_texto.c: 129: break;
	goto	l5410
	line	130
;recursos_texto.c: 130: case '#':
	
l178:	
	line	131
	
l5394:	
;recursos_texto.c: 131: end_alfa = 335;
	movlw	low(014Fh)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(014Fh)
	movwf	((EscreveCaractere@end_alfa))+1
	line	132
;recursos_texto.c: 132: break;
	goto	l5410
	line	133
;recursos_texto.c: 133: case '*':
	
l179:	
	line	134
	
l5396:	
;recursos_texto.c: 134: end_alfa = 340;
	movlw	low(0154h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0154h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	135
;recursos_texto.c: 135: break;
	goto	l5410
	line	136
;recursos_texto.c: 136: case ' ':
	
l180:	
	line	137
	
l5398:	
;recursos_texto.c: 137: end_alfa = 345;
	movlw	low(0159h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0159h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	138
;recursos_texto.c: 138: break;
	goto	l5410
	line	139
;recursos_texto.c: 139: case '_':
	
l181:	
	line	140
	
l5400:	
;recursos_texto.c: 140: end_alfa = 350;
	movlw	low(015Eh)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(015Eh)
	movwf	((EscreveCaractere@end_alfa))+1
	line	141
;recursos_texto.c: 141: break;
	goto	l5410
	line	142
;recursos_texto.c: 142: case '/':
	
l182:	
	line	143
	
l5402:	
;recursos_texto.c: 143: end_alfa = 355;
	movlw	low(0163h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0163h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	144
;recursos_texto.c: 144: break;
	goto	l5410
	line	145
;recursos_texto.c: 145: case '%':
	
l183:	
	line	146
	
l5404:	
;recursos_texto.c: 146: end_alfa = 360;
	movlw	low(0168h)
	movwf	(EscreveCaractere@end_alfa)
	movlw	high(0168h)
	movwf	((EscreveCaractere@end_alfa))+1
	line	147
;recursos_texto.c: 147: break;
	goto	l5410
	line	148
	
l5406:	
;recursos_texto.c: 148: }
	goto	l5410
	line	113
	
l171:	
	
l5408:	
	movf	(EscreveCaractere@caractere),w
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 32 to 95
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           34    18 (average)
; direct_byte          203    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	32^0	; case 32
	skipnz
	goto	l5398
	xorlw	33^32	; case 33
	skipnz
	goto	l5386
	xorlw	35^33	; case 35
	skipnz
	goto	l5394
	xorlw	37^35	; case 37
	skipnz
	goto	l5404
	xorlw	42^37	; case 42
	skipnz
	goto	l5396
	xorlw	44^42	; case 44
	skipnz
	goto	l5390
	xorlw	46^44	; case 46
	skipnz
	goto	l5388
	xorlw	47^46	; case 47
	skipnz
	goto	l5402
	xorlw	58^47	; case 58
	skipnz
	goto	l5392
	xorlw	63^58	; case 63
	skipnz
	goto	l5384
	xorlw	95^63	; case 95
	skipnz
	goto	l5400
	goto	l5410
	opt asmopt_on

	line	148
	
l173:	
	goto	l5410
	line	149
	
l170:	
	goto	l5410
	
l168:	
	goto	l5410
	
l166:	
	line	151
	
l5410:	
;recursos_texto.c: 149: }
;recursos_texto.c: 151: for(y_aux = y; y_aux < (y + 5); y_aux++)
	movf	(EscreveCaractere@y),w
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	movwf	(EscreveCaractere@y_aux)
	goto	l5434
	line	152
	
l185:	
	line	153
	
l5412:	
;recursos_texto.c: 152: {
;recursos_texto.c: 153: mascara=0b10000000;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	movwf	(EscreveCaractere@mascara)
	line	154
;recursos_texto.c: 154: for(x_aux = x; x_aux < (x + 8); x_aux++)
	movf	(EscreveCaractere@x),w
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	movwf	(EscreveCaractere@x_aux)
	goto	l5428
	line	155
	
l187:	
	line	156
	
l5414:	
;recursos_texto.c: 155: {
;recursos_texto.c: 156: ponto = alfabeto[end_alfa] & mascara;
	movlw	high(_alfabeto|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(EscreveCaractere@end_alfa+1),w
	movwf	btemp+1
	movlw	low(_alfabeto|8000h)
	addwf	(EscreveCaractere@end_alfa),w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	andwf	(EscreveCaractere@mascara),w
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	movwf	(EscreveCaractere@ponto)
	line	157
	
l5416:	
;recursos_texto.c: 157: Ponto(x_aux, y_aux, cor ? ponto : !ponto);
	movf	(EscreveCaractere@cor),f
	skipz
	goto	u3521
	goto	u3520
u3521:
	goto	l5420
u3520:
	
l5418:	
	movf	(EscreveCaractere@ponto)
	movlw	0
	skipnz
	movlw	1
	movwf	(??_EscreveCaractere+0)+0
	clrf	(??_EscreveCaractere+0)+0+1
	movf	0+(??_EscreveCaractere+0)+0,w
	movwf	(_EscreveCaractere$282)
	movf	1+(??_EscreveCaractere+0)+0,w
	movwf	(_EscreveCaractere$282+1)
	goto	l5422
	
l189:	
	
l5420:	
	movf	(EscreveCaractere@ponto),w
	movwf	(??_EscreveCaractere+0)+0
	clrf	(??_EscreveCaractere+0)+0+1
	movf	0+(??_EscreveCaractere+0)+0,w
	movwf	(_EscreveCaractere$282)
	movf	1+(??_EscreveCaractere+0)+0,w
	movwf	(_EscreveCaractere$282+1)
	goto	l5422
	
l191:	
	
l5422:	
	movf	(EscreveCaractere@y_aux),w
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	movwf	(?_Ponto)
	movf	(_EscreveCaractere$282),w
	movwf	(??_EscreveCaractere+1)+0
	movf	(??_EscreveCaractere+1)+0,w
	movwf	0+(?_Ponto)+01h
	movf	(EscreveCaractere@x_aux),w
	fcall	_Ponto
	line	158
	
l5424:	
;recursos_texto.c: 158: mascara = mascara >> 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EscreveCaractere@mascara),w
	movwf	(??_EscreveCaractere+0)+0
	clrc
	rrf	(??_EscreveCaractere+0)+0,w
	movwf	(??_EscreveCaractere+1)+0
	movf	(??_EscreveCaractere+1)+0,w
	movwf	(EscreveCaractere@mascara)
	line	154
	
l5426:	
	movlw	(01h)
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	addwf	(EscreveCaractere@x_aux),f
	goto	l5428
	
l186:	
	
l5428:	
	movf	(EscreveCaractere@x),w
	addlw	low(08h)
	movwf	(??_EscreveCaractere+0)+0
	movlw	high(08h)
	skipnc
	movlw	(high(08h)+1)&0ffh
	movwf	((??_EscreveCaractere+0)+0)+1
	movf	1+(??_EscreveCaractere+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3535
	movf	0+(??_EscreveCaractere+0)+0,w
	subwf	(EscreveCaractere@x_aux),w
u3535:

	skipc
	goto	u3531
	goto	u3530
u3531:
	goto	l5414
u3530:
	goto	l5430
	
l192:	
	line	160
	
l5430:	
;recursos_texto.c: 159: }
;recursos_texto.c: 160: end_alfa++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(EscreveCaractere@end_alfa),f
	skipnc
	incf	(EscreveCaractere@end_alfa+1),f
	movlw	high(01h)
	addwf	(EscreveCaractere@end_alfa+1),f
	line	151
	
l5432:	
	movlw	(01h)
	movwf	(??_EscreveCaractere+0)+0
	movf	(??_EscreveCaractere+0)+0,w
	addwf	(EscreveCaractere@y_aux),f
	goto	l5434
	
l184:	
	
l5434:	
	movf	(EscreveCaractere@y),w
	addlw	low(05h)
	movwf	(??_EscreveCaractere+0)+0
	movlw	high(05h)
	skipnc
	movlw	(high(05h)+1)&0ffh
	movwf	((??_EscreveCaractere+0)+0)+1
	movf	1+(??_EscreveCaractere+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3545
	movf	0+(??_EscreveCaractere+0)+0,w
	subwf	(EscreveCaractere@y_aux),w
u3545:

	skipc
	goto	u3541
	goto	u3540
u3541:
	goto	l5412
u3540:
	goto	l194
	
l193:	
	line	162
	
l194:	
	return
	opt stack 0
GLOBAL	__end_of_EscreveCaractere
	__end_of_EscreveCaractere:
;; =============== function _EscreveCaractere ends ============

	signat	_EscreveCaractere,16504
	global	_InicializarDisplay
psect	text654,local,class=CODE,delta=2
global __ptext654
__ptext654:

;; *************** function _InicializarDisplay *****************
;; Defined at:
;;		line 89 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  pinos          20    0[BANK0 ] struct .
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0      20       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      24       0       0       0
;;Total ram usage:       24 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RST
;;		_RW
;;		_delay
;;		_LigarDisplay
;;		_LimparDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text654
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	89
	global	__size_of_InicializarDisplay
	__size_of_InicializarDisplay	equ	__end_of_InicializarDisplay-_InicializarDisplay
	
_InicializarDisplay:	
	opt	stack 3
; Regs used in _InicializarDisplay: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	90
	
l5352:	
;lcd_grafico.c: 90: pinos_display = pinos;
	movlw	(_pinos_display)&0ffh
	movwf	fsr0
	movlw	low(InicializarDisplay@pinos)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_InicializarDisplay+0)+0
	movf	fsr0,w
	movwf	((??_InicializarDisplay+0)+0+1)
	movlw	20
	movwf	((??_InicializarDisplay+0)+0+2)
u3450:
	movf	(??_InicializarDisplay+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_InicializarDisplay+0)+0+3)
	incf	(??_InicializarDisplay+0)+0,f
	movf	((??_InicializarDisplay+0)+0+1),w
	movwf	fsr0
	
	movf	((??_InicializarDisplay+0)+0+3),w
	movwf	indf
	incf	((??_InicializarDisplay+0)+0+1),f
	decfsz	((??_InicializarDisplay+0)+0+2),f
	goto	u3450
	line	91
	
l5354:	
;lcd_grafico.c: 91: RST(0);
	movlw	(0)
	fcall	_RST
	line	92
	
l5356:	
;lcd_grafico.c: 92: RW(0);
	movlw	(0)
	fcall	_RW
	line	93
;lcd_grafico.c: 93: *pinos_display.latchDADOS.tris = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+013h)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	94
	
l5358:	
;lcd_grafico.c: 94: RST(1);
	movlw	(01h)
	fcall	_RST
	line	95
	
l5360:	
;lcd_grafico.c: 95: delay(1);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	01h
	movwf	(?_delay)

	fcall	_delay
	line	96
	
l5362:	
;lcd_grafico.c: 96: LigarDisplay();
	fcall	_LigarDisplay
	line	97
	
l5364:	
;lcd_grafico.c: 97: LimparDisplay();
	fcall	_LimparDisplay
	line	98
	
l63:	
	return
	opt stack 0
GLOBAL	__end_of_InicializarDisplay
	__end_of_InicializarDisplay:
;; =============== function _InicializarDisplay ends ============

	signat	_InicializarDisplay,4216
	global	_Ponto
psect	text655,local,class=CODE,delta=2
global __ptext655
__ptext655:

;; *************** function _Ponto *****************
;; Defined at:
;;		line 36 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  y               1   10[BANK0 ] unsigned char 
;;  cor             1   11[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1   16[BANK0 ] unsigned char 
;;  area            1   17[BANK0 ] unsigned char 
;;  pagina          1   15[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_EnderecoX
;;		_EnderecoY
;;		_NovoX
;;		_EnviarDado
;; This function is called by:
;;		_EscreveCaractere
;;		_DesenharBitmap
;;		_Cursor
;; This function uses a non-reentrant model
;;
psect	text655
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	36
	global	__size_of_Ponto
	__size_of_Ponto	equ	__end_of_Ponto-_Ponto
	
_Ponto:	
	opt	stack 2
; Regs used in _Ponto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;Ponto@x stored from wreg
	line	39
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Ponto@x)
	
l5330:	
;lcd_grafico.c: 37: unsigned char area;
;lcd_grafico.c: 38: unsigned char pagina;
;lcd_grafico.c: 39: if(y < 64)
	movlw	(040h)
	subwf	(Ponto@y),w
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l5334
u3420:
	line	40
	
l5332:	
;lcd_grafico.c: 40: area = 1;
	clrf	(Ponto@area)
	bsf	status,0
	rlf	(Ponto@area),f
	goto	l5338
	line	41
	
l44:	
	line	43
	
l5334:	
;lcd_grafico.c: 41: else
;lcd_grafico.c: 42: {
;lcd_grafico.c: 43: y = y - 64;
	movf	(Ponto@y),w
	addlw	0C0h
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(Ponto@y)
	line	44
	
l5336:	
;lcd_grafico.c: 44: area = 2;
	movlw	(02h)
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(Ponto@area)
	goto	l5338
	line	45
	
l45:	
	line	46
	
l5338:	
;lcd_grafico.c: 45: }
;lcd_grafico.c: 46: pagina = x >> 3;
	movf	(Ponto@x),w
	movwf	(??_Ponto+0)+0
	movlw	03h
u3435:
	clrc
	rrf	(??_Ponto+0)+0,f
	addlw	-1
	skipz
	goto	u3435
	movf	0+(??_Ponto+0)+0,w
	movwf	(??_Ponto+1)+0
	movf	(??_Ponto+1)+0,w
	movwf	(Ponto@pagina)
	line	47
	
l5340:	
;lcd_grafico.c: 47: EnderecoX(pagina, area);
	movf	(Ponto@area),w
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(?_EnderecoX)
	movf	(Ponto@pagina),w
	fcall	_EnderecoX
	line	48
	
l5342:	
;lcd_grafico.c: 48: x = ((pagina + 1) << 3) - x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Ponto@pagina),w
	movwf	(??_Ponto+0)+0
	movlw	03h
u3445:
	clrc
	rlf	(??_Ponto+0)+0,f
	addlw	-1
	skipz
	goto	u3445
	decf	(Ponto@x),w
	xorlw	0ffh
	addwf	0+(??_Ponto+0)+0,w
	addlw	08h
	movwf	(??_Ponto+1)+0
	movf	(??_Ponto+1)+0,w
	movwf	(Ponto@x)
	line	49
	
l5344:	
;lcd_grafico.c: 49: EnderecoY(y, area);
	movf	(Ponto@area),w
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(?_EnderecoY)
	movf	(Ponto@y),w
	fcall	_EnderecoY
	line	50
	
l5346:	
;lcd_grafico.c: 50: x = NovoX(x, area, cor);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Ponto@area),w
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(?_NovoX)
	movf	(Ponto@cor),w
	movwf	(??_Ponto+1)+0
	movf	(??_Ponto+1)+0,w
	movwf	0+(?_NovoX)+01h
	movf	(Ponto@x),w
	fcall	_NovoX
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_Ponto+2)+0
	movf	(??_Ponto+2)+0,w
	movwf	(Ponto@x)
	line	51
	
l5348:	
;lcd_grafico.c: 51: EnderecoY(y, area);
	movf	(Ponto@area),w
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(?_EnderecoY)
	movf	(Ponto@y),w
	fcall	_EnderecoY
	line	52
	
l5350:	
;lcd_grafico.c: 52: EnviarDado(x, area);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Ponto@area),w
	movwf	(??_Ponto+0)+0
	movf	(??_Ponto+0)+0,w
	movwf	(?_EnviarDado)
	movf	(Ponto@x),w
	fcall	_EnviarDado
	line	53
	
l46:	
	return
	opt stack 0
GLOBAL	__end_of_Ponto
	__end_of_Ponto:
;; =============== function _Ponto ends ============

	signat	_Ponto,12408
	global	_LimparDisplay
psect	text656,local,class=CODE,delta=2
global __ptext656
__ptext656:

;; *************** function _LimparDisplay *****************
;; Defined at:
;;		line 74 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               1   13[COMMON] unsigned char 
;;  y               1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_EnderecoX
;;		_EnviarDado
;; This function is called by:
;;		_InicializarDisplay
;; This function uses a non-reentrant model
;;
psect	text656
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	74
	global	__size_of_LimparDisplay
	__size_of_LimparDisplay	equ	__end_of_LimparDisplay-_LimparDisplay
	
_LimparDisplay:	
	opt	stack 3
; Regs used in _LimparDisplay: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	76
	
l5306:	
;lcd_grafico.c: 75: unsigned char x, y;
;lcd_grafico.c: 76: for(x = 0; x < 8; x++)
	clrf	(LimparDisplay@x)
	
l5308:	
	movlw	(08h)
	subwf	(LimparDisplay@x),w
	skipc
	goto	u3381
	goto	u3380
u3381:
	goto	l5312
u3380:
	goto	l60
	
l5310:	
	goto	l60
	line	77
	
l56:	
	line	78
	
l5312:	
;lcd_grafico.c: 77: {
;lcd_grafico.c: 78: EnderecoX(x, 3);
	movlw	(03h)
	movwf	(??_LimparDisplay+0)+0
	movf	(??_LimparDisplay+0)+0,w
	movwf	(?_EnderecoX)
	movf	(LimparDisplay@x),w
	fcall	_EnderecoX
	line	79
	
l5314:	
;lcd_grafico.c: 79: for(y = 0; y < 64; y++)
	clrf	(LimparDisplay@y)
	
l5316:	
	movlw	(040h)
	subwf	(LimparDisplay@y),w
	skipc
	goto	u3391
	goto	u3390
u3391:
	goto	l5320
u3390:
	goto	l5326
	
l5318:	
	goto	l5326
	line	80
	
l58:	
	
l5320:	
;lcd_grafico.c: 80: EnviarDado(0, 3);
	movlw	(03h)
	movwf	(??_LimparDisplay+0)+0
	movf	(??_LimparDisplay+0)+0,w
	movwf	(?_EnviarDado)
	movlw	(0)
	fcall	_EnviarDado
	line	79
	
l5322:	
	movlw	(01h)
	movwf	(??_LimparDisplay+0)+0
	movf	(??_LimparDisplay+0)+0,w
	addwf	(LimparDisplay@y),f
	
l5324:	
	movlw	(040h)
	subwf	(LimparDisplay@y),w
	skipc
	goto	u3401
	goto	u3400
u3401:
	goto	l5320
u3400:
	goto	l5326
	
l59:	
	line	76
	
l5326:	
	movlw	(01h)
	movwf	(??_LimparDisplay+0)+0
	movf	(??_LimparDisplay+0)+0,w
	addwf	(LimparDisplay@x),f
	
l5328:	
	movlw	(08h)
	subwf	(LimparDisplay@x),w
	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l5312
u3410:
	goto	l60
	
l57:	
	line	82
	
l60:	
	return
	opt stack 0
GLOBAL	__end_of_LimparDisplay
	__end_of_LimparDisplay:
;; =============== function _LimparDisplay ends ============

	signat	_LimparDisplay,88
	global	_NovoX
psect	text657,local,class=CODE,delta=2
global __ptext657
__ptext657:

;; *************** function _NovoX *****************
;; Defined at:
;;		line 64 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  area            1    0[BANK0 ] unsigned char 
;;  cor             1    1[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    8[BANK0 ] unsigned char 
;;  leitura         1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LerDado
;; This function is called by:
;;		_Ponto
;; This function uses a non-reentrant model
;;
psect	text657
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	64
	global	__size_of_NovoX
	__size_of_NovoX	equ	__end_of_NovoX-_NovoX
	
_NovoX:	
	opt	stack 2
; Regs used in _NovoX: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;NovoX@x stored from wreg
	line	66
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(NovoX@x)
	
l5294:	
;lcd_grafico.c: 65: unsigned char leitura;
;lcd_grafico.c: 66: leitura = LerDado(area);
	movf	(NovoX@area),w
	fcall	_LerDado
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_NovoX+0)+0
	movf	(??_NovoX+0)+0,w
	movwf	(NovoX@leitura)
	line	67
	
l5296:	
;lcd_grafico.c: 67: return cor ? leitura |= (1 << (7 - x)) : leitura &= ~(1 << (7 - x));
	movf	(NovoX@cor),f
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l5300
u3350:
	
l5298:	
	movlw	(01h)
	movwf	(??_NovoX+0)+0
	decf	(NovoX@x),w
	xorlw	0ffh
	addlw	07h
	addlw	1
	goto	u3364
u3365:
	clrc
	rlf	(??_NovoX+0)+0,f
u3364:
	addlw	-1
	skipz
	goto	u3365
	movf	0+(??_NovoX+0)+0,w
	xorlw	0ffh
	movwf	(??_NovoX+1)+0
	movf	(??_NovoX+1)+0,w
	andwf	(NovoX@leitura),f
	movf	((NovoX@leitura)),w
	movwf	(??_NovoX+2)+0
	clrf	(??_NovoX+2)+0+1
	movf	0+(??_NovoX+2)+0,w
	movwf	(_NovoX$157)
	movf	1+(??_NovoX+2)+0,w
	movwf	(_NovoX$157+1)
	goto	l5302
	
l50:	
	
l5300:	
	movlw	(01h)
	movwf	(??_NovoX+0)+0
	decf	(NovoX@x),w
	xorlw	0ffh
	addlw	07h
	addlw	1
	goto	u3374
u3375:
	clrc
	rlf	(??_NovoX+0)+0,f
u3374:
	addlw	-1
	skipz
	goto	u3375
	movf	0+(??_NovoX+0)+0,w
	movwf	(??_NovoX+1)+0
	movf	(??_NovoX+1)+0,w
	iorwf	(NovoX@leitura),f
	movf	((NovoX@leitura)),w
	movwf	(??_NovoX+2)+0
	clrf	(??_NovoX+2)+0+1
	movf	0+(??_NovoX+2)+0,w
	movwf	(_NovoX$157)
	movf	1+(??_NovoX+2)+0,w
	movwf	(_NovoX$157+1)
	goto	l5302
	
l52:	
	
l5302:	
	movf	(_NovoX$157),w
	goto	l53
	
l5304:	
	line	68
	
l53:	
	return
	opt stack 0
GLOBAL	__end_of_NovoX
	__end_of_NovoX:
;; =============== function _NovoX ends ============

	signat	_NovoX,12409
	global	_InverterCores
psect	text658,local,class=CODE,delta=2
global __ptext658
__ptext658:

;; *************** function _InverterCores *****************
;; Defined at:
;;		line 8 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  area            1    3[BANK0 ] unsigned char 
;;  y               1    2[BANK0 ] unsigned char 
;;  x               1    1[BANK0 ] unsigned char 
;;  leitura         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       4       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_EnderecoX
;;		_EnderecoY
;;		_LerDado
;;		_EnviarDado
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text658
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	8
	global	__size_of_InverterCores
	__size_of_InverterCores	equ	__end_of_InverterCores-_InverterCores
	
_InverterCores:	
	opt	stack 4
; Regs used in _InverterCores: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l5262:	
;lcd_grafico.c: 9: unsigned char leitura;
;lcd_grafico.c: 10: unsigned char x, y;
;lcd_grafico.c: 11: unsigned char area;
;lcd_grafico.c: 12: for(area = 1; area < 3; area++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(InverterCores@area)
	bsf	status,0
	rlf	(InverterCores@area),f
	
l5264:	
	movlw	(03h)
	subwf	(InverterCores@area),w
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l35
u3290:
	goto	l41
	
l5266:	
	goto	l41
	line	13
	
l35:	
	line	14
;lcd_grafico.c: 13: {
;lcd_grafico.c: 14: for(x = 0; x < 8; x++)
	clrf	(InverterCores@x)
	
l5268:	
	movlw	(08h)
	subwf	(InverterCores@x),w
	skipc
	goto	u3301
	goto	u3300
u3301:
	goto	l5272
u3300:
	goto	l5290
	
l5270:	
	goto	l5290
	line	15
	
l37:	
	line	16
	
l5272:	
;lcd_grafico.c: 15: {
;lcd_grafico.c: 16: EnderecoX(x, area);
	movf	(InverterCores@area),w
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	movwf	(?_EnderecoX)
	movf	(InverterCores@x),w
	fcall	_EnderecoX
	line	17
	
l5274:	
;lcd_grafico.c: 17: for(y = 0; y < 64; y++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(InverterCores@y)
	
l5276:	
	movlw	(040h)
	subwf	(InverterCores@y),w
	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l5280
u3310:
	goto	l5286
	
l5278:	
	goto	l5286
	line	18
	
l39:	
	line	19
	
l5280:	
;lcd_grafico.c: 18: {
;lcd_grafico.c: 19: EnderecoY(y, area);
	movf	(InverterCores@area),w
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	movwf	(?_EnderecoY)
	movf	(InverterCores@y),w
	fcall	_EnderecoY
	line	20
;lcd_grafico.c: 20: leitura=LerDado(area);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(InverterCores@area),w
	fcall	_LerDado
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(InverterCores@leitura)
	line	21
;lcd_grafico.c: 21: EnderecoY(y, area);
	movf	(InverterCores@area),w
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	movwf	(?_EnderecoY)
	movf	(InverterCores@y),w
	fcall	_EnderecoY
	line	22
;lcd_grafico.c: 22: EnviarDado(~leitura, area);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(InverterCores@area),w
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	movwf	(?_EnviarDado)
	comf	(InverterCores@leitura),w
	fcall	_EnviarDado
	line	17
	
l5282:	
	movlw	(01h)
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(InverterCores@y),f
	
l5284:	
	movlw	(040h)
	subwf	(InverterCores@y),w
	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l5280
u3320:
	goto	l5286
	
l40:	
	line	14
	
l5286:	
	movlw	(01h)
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	addwf	(InverterCores@x),f
	
l5288:	
	movlw	(08h)
	subwf	(InverterCores@x),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l5272
u3330:
	goto	l5290
	
l38:	
	line	12
	
l5290:	
	movlw	(01h)
	movwf	(??_InverterCores+0)+0
	movf	(??_InverterCores+0)+0,w
	addwf	(InverterCores@area),f
	
l5292:	
	movlw	(03h)
	subwf	(InverterCores@area),w
	skipc
	goto	u3341
	goto	u3340
u3341:
	goto	l35
u3340:
	goto	l41
	
l36:	
	line	26
	
l41:	
	return
	opt stack 0
GLOBAL	__end_of_InverterCores
	__end_of_InverterCores:
;; =============== function _InverterCores ends ============

	signat	_InverterCores,88
	global	_LigarDisplay
psect	text659,local,class=CODE,delta=2
global __ptext659
__ptext659:

;; *************** function _LigarDisplay *****************
;; Defined at:
;;		line 149 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SelecionarArea
;;		_RS
;;		_Clock
;; This function is called by:
;;		_InicializarDisplay
;; This function uses a non-reentrant model
;;
psect	text659
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	149
	global	__size_of_LigarDisplay
	__size_of_LigarDisplay	equ	__end_of_LigarDisplay-_LigarDisplay
	
_LigarDisplay:	
	opt	stack 4
; Regs used in _LigarDisplay: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	150
	
l5254:	
;lcd_grafico.c: 150: SelecionarArea(3);
	movlw	(03h)
	fcall	_SelecionarArea
	line	151
;lcd_grafico.c: 151: RS(0);
	movlw	(0)
	fcall	_RS
	line	152
	
l5256:	
;lcd_grafico.c: 152: *pinos_display.latchDADOS.latch = 0b00111111;
	movlw	(03Fh)
	movwf	(??_LigarDisplay+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+012h)^080h,w
	movwf	fsr0
	movf	(??_LigarDisplay+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	153
	
l5258:	
;lcd_grafico.c: 153: Clock();
	fcall	_Clock
	line	154
	
l5260:	
;lcd_grafico.c: 154: SelecionarArea(0);
	movlw	(0)
	fcall	_SelecionarArea
	line	155
	
l75:	
	return
	opt stack 0
GLOBAL	__end_of_LigarDisplay
	__end_of_LigarDisplay:
;; =============== function _LigarDisplay ends ============

	signat	_LigarDisplay,88
	global	_EnviarDado
psect	text660,local,class=CODE,delta=2
global __ptext660
__ptext660:

;; *************** function _EnviarDado *****************
;; Defined at:
;;		line 164 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  dado            1    wreg     unsigned char 
;;  area            1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dado            1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SelecionarArea
;;		_RS
;;		_Clock
;; This function is called by:
;;		_InverterCores
;;		_Ponto
;;		_LimparDisplay
;; This function uses a non-reentrant model
;;
psect	text660
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	164
	global	__size_of_EnviarDado
	__size_of_EnviarDado	equ	__end_of_EnviarDado-_EnviarDado
	
_EnviarDado:	
	opt	stack 4
; Regs used in _EnviarDado: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EnviarDado@dado stored from wreg
	movwf	(EnviarDado@dado)
	line	165
	
l5246:	
;lcd_grafico.c: 165: SelecionarArea(area);
	movf	(EnviarDado@area),w
	fcall	_SelecionarArea
	line	166
;lcd_grafico.c: 166: RS(1);
	movlw	(01h)
	fcall	_RS
	line	167
	
l5248:	
;lcd_grafico.c: 167: *pinos_display.latchDADOS.latch = dado;
	movf	(EnviarDado@dado),w
	movwf	(??_EnviarDado+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+012h)^080h,w
	movwf	fsr0
	movf	(??_EnviarDado+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	168
	
l5250:	
;lcd_grafico.c: 168: Clock();
	fcall	_Clock
	line	169
	
l5252:	
;lcd_grafico.c: 169: SelecionarArea(0);
	movlw	(0)
	fcall	_SelecionarArea
	line	170
	
l78:	
	return
	opt stack 0
GLOBAL	__end_of_EnviarDado
	__end_of_EnviarDado:
;; =============== function _EnviarDado ends ============

	signat	_EnviarDado,8312
	global	_LerDado
psect	text661,local,class=CODE,delta=2
global __ptext661
__ptext661:

;; *************** function _LerDado *****************
;; Defined at:
;;		line 189 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  area            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  area            1   11[COMMON] unsigned char 
;;  leitura         1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SelecionarArea
;;		_RS
;;		_ClockComLeitura
;; This function is called by:
;;		_InverterCores
;;		_NovoX
;; This function uses a non-reentrant model
;;
psect	text661
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	189
	global	__size_of_LerDado
	__size_of_LerDado	equ	__end_of_LerDado-_LerDado
	
_LerDado:	
	opt	stack 4
; Regs used in _LerDado: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LerDado@area stored from wreg
	line	191
	movwf	(LerDado@area)
	
l5240:	
;lcd_grafico.c: 190: unsigned char leitura;
;lcd_grafico.c: 191: SelecionarArea(area);
	movf	(LerDado@area),w
	fcall	_SelecionarArea
	line	192
;lcd_grafico.c: 192: RS(1);
	movlw	(01h)
	fcall	_RS
	line	193
;lcd_grafico.c: 193: leitura = ClockComLeitura();
	fcall	_ClockComLeitura
	movwf	(??_LerDado+0)+0
	movf	(??_LerDado+0)+0,w
	movwf	(LerDado@leitura)
	line	194
;lcd_grafico.c: 194: SelecionarArea(0);
	movlw	(0)
	fcall	_SelecionarArea
	line	195
	
l5242:	
;lcd_grafico.c: 195: return leitura;
	movf	(LerDado@leitura),w
	goto	l84
	
l5244:	
	line	196
	
l84:	
	return
	opt stack 0
GLOBAL	__end_of_LerDado
	__end_of_LerDado:
;; =============== function _LerDado ends ============

	signat	_LerDado,4217
	global	_EnderecoY
psect	text662,local,class=CODE,delta=2
global __ptext662
__ptext662:

;; *************** function _EnderecoY *****************
;; Defined at:
;;		line 235 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  y               1    wreg     unsigned char 
;;  area            1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  y               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SelecionarArea
;;		_RS
;;		_Clock
;; This function is called by:
;;		_InverterCores
;;		_Ponto
;; This function uses a non-reentrant model
;;
psect	text662
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	235
	global	__size_of_EnderecoY
	__size_of_EnderecoY	equ	__end_of_EnderecoY-_EnderecoY
	
_EnderecoY:	
	opt	stack 4
; Regs used in _EnderecoY: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EnderecoY@y stored from wreg
	movwf	(EnderecoY@y)
	line	236
	
l5232:	
;lcd_grafico.c: 236: SelecionarArea(area);
	movf	(EnderecoY@area),w
	fcall	_SelecionarArea
	line	237
;lcd_grafico.c: 237: RS(0);
	movlw	(0)
	fcall	_RS
	line	238
	
l5234:	
;lcd_grafico.c: 238: *pinos_display.latchDADOS.latch = 0b1000000 | y;
	movf	(EnderecoY@y),w
	iorlw	040h
	movwf	(??_EnderecoY+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+012h)^080h,w
	movwf	fsr0
	movf	(??_EnderecoY+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	239
	
l5236:	
;lcd_grafico.c: 239: Clock();
	fcall	_Clock
	line	240
	
l5238:	
;lcd_grafico.c: 240: SelecionarArea(0);
	movlw	(0)
	fcall	_SelecionarArea
	line	241
	
l95:	
	return
	opt stack 0
GLOBAL	__end_of_EnderecoY
	__end_of_EnderecoY:
;; =============== function _EnderecoY ends ============

	signat	_EnderecoY,8312
	global	_EnderecoX
psect	text663,local,class=CODE,delta=2
global __ptext663
__ptext663:

;; *************** function _EnderecoX *****************
;; Defined at:
;;		line 220 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  area            1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SelecionarArea
;;		_RS
;;		_Clock
;; This function is called by:
;;		_InverterCores
;;		_Ponto
;;		_LimparDisplay
;; This function uses a non-reentrant model
;;
psect	text663
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	220
	global	__size_of_EnderecoX
	__size_of_EnderecoX	equ	__end_of_EnderecoX-_EnderecoX
	
_EnderecoX:	
	opt	stack 4
; Regs used in _EnderecoX: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EnderecoX@x stored from wreg
	movwf	(EnderecoX@x)
	line	221
	
l5224:	
;lcd_grafico.c: 221: SelecionarArea(area);
	movf	(EnderecoX@area),w
	fcall	_SelecionarArea
	line	222
;lcd_grafico.c: 222: RS(0);
	movlw	(0)
	fcall	_RS
	line	223
	
l5226:	
;lcd_grafico.c: 223: *pinos_display.latchDADOS.latch = 0b10111000 | x;
	movf	(EnderecoX@x),w
	iorlw	0B8h
	movwf	(??_EnderecoX+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+012h)^080h,w
	movwf	fsr0
	movf	(??_EnderecoX+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	224
	
l5228:	
;lcd_grafico.c: 224: Clock();
	fcall	_Clock
	line	225
	
l5230:	
;lcd_grafico.c: 225: SelecionarArea(0);
	movlw	(0)
	fcall	_SelecionarArea
	line	226
	
l92:	
	return
	opt stack 0
GLOBAL	__end_of_EnderecoX
	__end_of_EnderecoX:
;; =============== function _EnderecoX ends ============

	signat	_EnderecoX,8312
	global	_ClockComLeitura
psect	text664,local,class=CODE,delta=2
global __ptext664
__ptext664:

;; *************** function _ClockComLeitura *****************
;; Defined at:
;;		line 116 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  leitura         1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_RW
;;		_E
;;		_delayMicroseconds
;; This function is called by:
;;		_LerDado
;;		_ReceberStatus
;; This function uses a non-reentrant model
;;
psect	text664
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	116
	global	__size_of_ClockComLeitura
	__size_of_ClockComLeitura	equ	__end_of_ClockComLeitura-_ClockComLeitura
	
_ClockComLeitura:	
	opt	stack 4
; Regs used in _ClockComLeitura: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	118
	
l5194:	
;lcd_grafico.c: 117: unsigned char leitura;
;lcd_grafico.c: 118: *pinos_display.latchDADOS.tris = 0xFF;
	movlw	(0FFh)
	movwf	(??_ClockComLeitura+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+013h)^080h,w
	movwf	fsr0
	movf	(??_ClockComLeitura+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	119
	
l5196:	
;lcd_grafico.c: 119: RW(1);
	movlw	(01h)
	fcall	_RW
	line	121
	
l5198:	
;lcd_grafico.c: 121: E(1);
	movlw	(01h)
	fcall	_E
	line	122
	
l5200:	
;lcd_grafico.c: 122: delayMicroseconds(2);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	02h
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	123
	
l5202:	
;lcd_grafico.c: 123: E(0);
	movlw	(0)
	fcall	_E
	line	124
	
l5204:	
;lcd_grafico.c: 124: delayMicroseconds(2);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	02h
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	125
	
l5206:	
;lcd_grafico.c: 125: E(1);
	movlw	(01h)
	fcall	_E
	line	126
	
l5208:	
;lcd_grafico.c: 126: delayMicroseconds(5);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	05h
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	127
	
l5210:	
;lcd_grafico.c: 127: leitura = *pinos_display.latchDADOS.latch;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+012h)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ClockComLeitura+0)+0
	movf	(??_ClockComLeitura+0)+0,w
	movwf	(ClockComLeitura@leitura)
	line	128
	
l5212:	
;lcd_grafico.c: 128: E(0);
	movlw	(0)
	fcall	_E
	line	129
	
l5214:	
;lcd_grafico.c: 129: RW(0);
	movlw	(0)
	fcall	_RW
	line	130
	
l5216:	
;lcd_grafico.c: 130: *pinos_display.latchDADOS.tris = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+_pinos_display+013h)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	131
	
l5218:	
;lcd_grafico.c: 131: delayMicroseconds(15);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	0Fh
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	132
	
l5220:	
;lcd_grafico.c: 132: return leitura;
	movf	(ClockComLeitura@leitura),w
	goto	l69
	
l5222:	
	line	133
	
l69:	
	return
	opt stack 0
GLOBAL	__end_of_ClockComLeitura
	__end_of_ClockComLeitura:
;; =============== function _ClockComLeitura ends ============

	signat	_ClockComLeitura,89
	global	_Clock
psect	text665,local,class=CODE,delta=2
global __ptext665
__ptext665:

;; *************** function _Clock *****************
;; Defined at:
;;		line 104 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_E
;;		_delayMicroseconds
;; This function is called by:
;;		_LigarDisplay
;;		_EnviarDado
;;		_EnderecoX
;;		_EnderecoY
;;		_DesligarDisplay
;; This function uses a non-reentrant model
;;
psect	text665
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	104
	global	__size_of_Clock
	__size_of_Clock	equ	__end_of_Clock-_Clock
	
_Clock:	
	opt	stack 4
; Regs used in _Clock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	105
	
l5188:	
;lcd_grafico.c: 105: E(1);
	movlw	(01h)
	fcall	_E
	line	106
	
l5190:	
;lcd_grafico.c: 106: delayMicroseconds(2);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	02h
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	107
	
l5192:	
;lcd_grafico.c: 107: E(0);
	movlw	(0)
	fcall	_E
	line	108
;lcd_grafico.c: 108: delayMicroseconds(10);
	movlw	0
	movwf	(?_delayMicroseconds+3)
	movlw	0
	movwf	(?_delayMicroseconds+2)
	movlw	0
	movwf	(?_delayMicroseconds+1)
	movlw	0Ah
	movwf	(?_delayMicroseconds)

	fcall	_delayMicroseconds
	line	109
	
l66:	
	return
	opt stack 0
GLOBAL	__end_of_Clock
	__end_of_Clock:
;; =============== function _Clock ends ============

	signat	_Clock,88
	global	_JustificarDireita
psect	text666,local,class=CODE,delta=2
global __ptext666
__ptext666:

;; *************** function _JustificarDireita *****************
;; Defined at:
;;		line 23 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
;; Parameters:    Size  Location     Type
;;  tamanho_fras    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  tamanho_fras    1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___bmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text666
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
	line	23
	global	__size_of_JustificarDireita
	__size_of_JustificarDireita	equ	__end_of_JustificarDireita-_JustificarDireita
	
_JustificarDireita:	
	opt	stack 6
; Regs used in _JustificarDireita: [wreg+status,2+status,0+pclath+cstack]
;JustificarDireita@tamanho_frase stored from wreg
	movwf	(JustificarDireita@tamanho_frase)
	line	24
	
l5184:	
;recursos_texto.c: 24: return 128 - (tamanho_frase * (5 + 1));
	movlw	(06h)
	movwf	(??_JustificarDireita+0)+0
	movf	(??_JustificarDireita+0)+0,w
	movwf	(?___bmul)
	movf	(JustificarDireita@tamanho_frase),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addlw	080h
	goto	l139
	
l5186:	
	line	25
	
l139:	
	return
	opt stack 0
GLOBAL	__end_of_JustificarDireita
	__end_of_JustificarDireita:
;; =============== function _JustificarDireita ends ============

	signat	_JustificarDireita,4217
	global	_Centralizar
psect	text667,local,class=CODE,delta=2
global __ptext667
__ptext667:

;; *************** function _Centralizar *****************
;; Defined at:
;;		line 12 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
;; Parameters:    Size  Location     Type
;;  tamanho_fras    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  tamanho_fras    1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text667
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
	line	12
	global	__size_of_Centralizar
	__size_of_Centralizar	equ	__end_of_Centralizar-_Centralizar
	
_Centralizar:	
	opt	stack 6
; Regs used in _Centralizar: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;Centralizar@tamanho_frase stored from wreg
	movwf	(Centralizar@tamanho_frase)
	line	13
	
l5180:	
;recursos_texto.c: 13: return (128 - (tamanho_frase * (5 + 1))) >> 1;
	movf	(Centralizar@tamanho_frase),w
	movwf	(??_Centralizar+0)+0
	clrf	(??_Centralizar+0)+0+1
	movf	0+(??_Centralizar+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_Centralizar+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(06h)
	movwf	0+(?___wmul)+02h
	movlw	high(06h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	comf	(0+(?___wmul)),w
	movwf	(??_Centralizar+2)+0
	comf	(1+(?___wmul)),w
	movwf	((??_Centralizar+2)+0+1)
	incf	(??_Centralizar+2)+0,f
	skipnz
	incf	((??_Centralizar+2)+0+1),f
	movf	0+(??_Centralizar+2)+0,w
	addlw	low(080h)
	movwf	(??_Centralizar+4)+0
	movf	1+(??_Centralizar+2)+0,w
	skipnc
	addlw	1
	addlw	high(080h)
	movwf	1+(??_Centralizar+4)+0
	movlw	01h
	movwf	btemp+1
u3285:
	rlf	(??_Centralizar+4)+1,w
	rrf	(??_Centralizar+4)+1,f
	rrf	(??_Centralizar+4)+0,f
	decfsz	btemp+1,f
	goto	u3285
	movf	0+(??_Centralizar+4)+0,w
	goto	l136
	
l5182:	
	line	14
	
l136:	
	return
	opt stack 0
GLOBAL	__end_of_Centralizar
	__end_of_Centralizar:
;; =============== function _Centralizar ends ============

	signat	_Centralizar,4217
	global	_SelecionarArea
psect	text668,local,class=CODE,delta=2
global __ptext668
__ptext668:

;; *************** function _SelecionarArea *****************
;; Defined at:
;;		line 208 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  area            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  area            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_CS1
;;		_CS2
;; This function is called by:
;;		_LigarDisplay
;;		_EnviarDado
;;		_LerDado
;;		_EnderecoX
;;		_EnderecoY
;;		_DesligarDisplay
;; This function uses a non-reentrant model
;;
psect	text668
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	208
	global	__size_of_SelecionarArea
	__size_of_SelecionarArea	equ	__end_of_SelecionarArea-_SelecionarArea
	
_SelecionarArea:	
	opt	stack 4
; Regs used in _SelecionarArea: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;SelecionarArea@area stored from wreg
	movwf	(SelecionarArea@area)
	line	209
	
l5170:	
;lcd_grafico.c: 209: CS1(area == 1 || area == 3);
	clrf	(_SelecionarArea$204)
	bsf	status,0
	rlf	(_SelecionarArea$204),f
	
l5172:	
	movf	(SelecionarArea@area),w
	xorlw	01h
	skipnz
	goto	u3261
	goto	u3260
u3261:
	goto	l5178
u3260:
	
l5174:	
	movf	(SelecionarArea@area),w
	xorlw	03h
	skipnz
	goto	u3271
	goto	u3270
u3271:
	goto	l5178
u3270:
	
l5176:	
	clrf	(_SelecionarArea$204)
	goto	l5178
	
l88:	
	
l5178:	
	movf	(_SelecionarArea$204),w
	fcall	_CS1
	line	210
;lcd_grafico.c: 210: CS2(area >= 2);
	movlw	(02h)
	subwf	(SelecionarArea@area),w
	movlw	0
	skipnc
	movlw	1
	fcall	_CS2
	line	211
	
l89:	
	return
	opt stack 0
GLOBAL	__end_of_SelecionarArea
	__end_of_SelecionarArea:
;; =============== function _SelecionarArea ends ============

	signat	_SelecionarArea,4216
	global	_delayMicroseconds
psect	text669,local,class=CODE,delta=2
global __ptext669
__ptext669:

;; *************** function _delayMicroseconds *****************
;; Defined at:
;;		line 23 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\delays.c"
;; Parameters:    Size  Location     Type
;;  us              4    0[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  t               4    4[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Clock
;;		_ClockComLeitura
;; This function uses a non-reentrant model
;;
psect	text669
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\delays.c"
	line	23
	global	__size_of_delayMicroseconds
	__size_of_delayMicroseconds	equ	__end_of_delayMicroseconds-_delayMicroseconds
	
_delayMicroseconds:	
	opt	stack 4
; Regs used in _delayMicroseconds: [wreg]
	line	26
	
l5166:	
;delays.c: 25: unsigned long t;
;delays.c: 26: for(t = 0; t < us; t++)
	movlw	0
	movwf	(delayMicroseconds@t+3)
	movlw	0
	movwf	(delayMicroseconds@t+2)
	movlw	0
	movwf	(delayMicroseconds@t+1)
	movlw	0
	movwf	(delayMicroseconds@t)

	goto	l2167
	line	27
	
l2168:	
;delays.c: 27: _delay((unsigned long)((1)*(20000000/4000000.0)));
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	26
	
l5168:	
	movlw	01h
	addwf	(delayMicroseconds@t),f
	movlw	0
	skipnc
movlw 1
	addwf	(delayMicroseconds@t+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(delayMicroseconds@t+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(delayMicroseconds@t+3),f
	
l2167:	
	movf	(delayMicroseconds@us+3),w
	subwf	(delayMicroseconds@t+3),w
	skipz
	goto	u3255
	movf	(delayMicroseconds@us+2),w
	subwf	(delayMicroseconds@t+2),w
	skipz
	goto	u3255
	movf	(delayMicroseconds@us+1),w
	subwf	(delayMicroseconds@t+1),w
	skipz
	goto	u3255
	movf	(delayMicroseconds@us),w
	subwf	(delayMicroseconds@t),w
u3255:
	skipc
	goto	u3251
	goto	u3250
u3251:
	goto	l2168
u3250:
	goto	l2170
	
l2169:	
	line	28
	
l2170:	
	return
	opt stack 0
GLOBAL	__end_of_delayMicroseconds
	__end_of_delayMicroseconds:
;; =============== function _delayMicroseconds ends ============

	signat	_delayMicroseconds,4216
	global	_delay
psect	text670,local,class=CODE,delta=2
global __ptext670
__ptext670:

;; *************** function _delay *****************
;; Defined at:
;;		line 10 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\delays.c"
;; Parameters:    Size  Location     Type
;;  ms              4    0[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  t               4    6[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InicializarDisplay
;;		_main
;; This function uses a non-reentrant model
;;
psect	text670
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\delays.c"
	line	10
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	13
	
l5162:	
;delays.c: 12: unsigned long t;
;delays.c: 13: for(t = 0; t < ms; t++)
	movlw	0
	movwf	(delay@t+3)
	movlw	0
	movwf	(delay@t+2)
	movlw	0
	movwf	(delay@t+1)
	movlw	0
	movwf	(delay@t)

	goto	l2161
	line	14
	
l2162:	
	
l5164:	
;delays.c: 14: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay+0)+0+1),f
	movlw	125
movwf	((??_delay+0)+0),f
u3627:
	decfsz	((??_delay+0)+0),f
	goto	u3627
	decfsz	((??_delay+0)+0+1),f
	goto	u3627
opt asmopt_on

	line	13
	movlw	01h
	addwf	(delay@t),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@t+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@t+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@t+3),f
	
l2161:	
	movf	(delay@ms+3),w
	subwf	(delay@t+3),w
	skipz
	goto	u3245
	movf	(delay@ms+2),w
	subwf	(delay@t+2),w
	skipz
	goto	u3245
	movf	(delay@ms+1),w
	subwf	(delay@t+1),w
	skipz
	goto	u3245
	movf	(delay@ms),w
	subwf	(delay@t),w
u3245:
	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l5164
u3240:
	goto	l2164
	
l2163:	
	line	15
	
l2164:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	___wmul
psect	text671,local,class=CODE,delta=2
global __ptext671
__ptext671:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Centralizar
;;		_EscreveCaractere
;; This function uses a non-reentrant model
;;
psect	text671
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l5150:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l5152
	line	6
	
l3126:	
	line	7
	
l5152:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l3127
u3200:
	line	8
	
l5154:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l3127:	
	line	9
	movlw	01h
	
u3215:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u3215
	line	10
	
l5156:	
	movlw	01h
	
u3225:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u3225
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l5152
u3230:
	goto	l5158
	
l3128:	
	line	12
	
l5158:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l3129
	
l5160:	
	line	13
	
l3129:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	___bmul
psect	text672,local,class=CODE,delta=2
global __ptext672
__ptext672:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    3[COMMON] unsigned char 
;;  product         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_JustificarDireita
;; This function uses a non-reentrant model
;;
psect	text672
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l5136:	
	clrf	(___bmul@product)
	line	6
	
l3120:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l5140
u3180:
	line	8
	
l5138:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l5140
	
l3121:	
	line	9
	
l5140:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l5142:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l5144:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l3120
u3190:
	goto	l5146
	
l3122:	
	line	12
	
l5146:	
	movf	(___bmul@product),w
	goto	l3123
	
l5148:	
	line	13
	
l3123:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_TamanhoFrase
psect	text673,local,class=CODE,delta=2
global __ptext673
__ptext673:

;; *************** function _TamanhoFrase *****************
;; Defined at:
;;		line 34 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
;; Parameters:    Size  Location     Type
;;  frase           2    0[COMMON] PTR const unsigned char 
;;		 -> STR_7(11), STR_4(18), STR_2(19), 
;; Auto vars:     Size  Location     Type
;;  tamanho         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text673
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\recursos_texto.c"
	line	34
	global	__size_of_TamanhoFrase
	__size_of_TamanhoFrase	equ	__end_of_TamanhoFrase-_TamanhoFrase
	
_TamanhoFrase:	
	opt	stack 6
; Regs used in _TamanhoFrase: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
	line	35
	
l5076:	
;recursos_texto.c: 35: unsigned char tamanho = 0;
	clrf	(TamanhoFrase@tamanho)
	line	36
;recursos_texto.c: 36: while(*frase)
	goto	l5082
	
l143:	
	line	38
	
l5078:	
;recursos_texto.c: 37: {
;recursos_texto.c: 38: tamanho++;
	movlw	(01h)
	movwf	(??_TamanhoFrase+0)+0
	movf	(??_TamanhoFrase+0)+0,w
	addwf	(TamanhoFrase@tamanho),f
	line	39
	
l5080:	
;recursos_texto.c: 39: frase++;
	movlw	low(01h)
	addwf	(TamanhoFrase@frase),f
	skipnc
	incf	(TamanhoFrase@frase+1),f
	movlw	high(01h)
	addwf	(TamanhoFrase@frase+1),f
	goto	l5082
	line	40
	
l142:	
	line	36
	
l5082:	
	movf	(TamanhoFrase@frase+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(TamanhoFrase@frase),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l5078
u3070:
	goto	l5084
	
l144:	
	line	41
	
l5084:	
;recursos_texto.c: 40: }
;recursos_texto.c: 41: return tamanho;
	movf	(TamanhoFrase@tamanho),w
	goto	l145
	
l5086:	
	line	42
	
l145:	
	return
	opt stack 0
GLOBAL	__end_of_TamanhoFrase
	__end_of_TamanhoFrase:
;; =============== function _TamanhoFrase ends ============

	signat	_TamanhoFrase,4217
	global	_CS2
psect	text674,local,class=CODE,delta=2
global __ptext674
__ptext674:

;; *************** function _CS2 *****************
;; Defined at:
;;		line 328 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  cs2             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cs2             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SelecionarArea
;; This function uses a non-reentrant model
;;
psect	text674
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	328
	global	__size_of_CS2
	__size_of_CS2	equ	__end_of_CS2-_CS2
	
_CS2:	
	opt	stack 4
; Regs used in _CS2: [wreg-fsr0h+status,2+status,0]
;CS2@cs2 stored from wreg
	movwf	(CS2@cs2)
	line	329
	
l5068:	
;lcd_grafico.c: 329: cs2 = !cs2;
	movf	(CS2@cs2)
	movlw	0
	skipnz
	movlw	1
	movwf	(??_CS2+0)+0
	movf	(??_CS2+0)+0,w
	movwf	(CS2@cs2)
	line	330
;lcd_grafico.c: 330: if(cs2)
	movf	(CS2@cs2),w
	skipz
	goto	u3040
	goto	l5072
u3040:
	line	331
	
l5070:	
;lcd_grafico.c: 331: *pinos_display.pinoCS2.latch_pino |= (1 << pinos_display.pinoCS2.bit_pino);
	movlw	(01h)
	movwf	(??_CS2+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+0Eh,w
	goto	u3054
u3055:
	clrc
	rlf	(??_CS2+0)+0,f
u3054:
	addlw	-1
	skipz
	goto	u3055
	movf	0+(??_CS2+0)+0,w
	movwf	(??_CS2+1)+0
	movf	(0+_pinos_display+0Dh)^080h,w
	movwf	fsr0
	movf	(??_CS2+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5074
	line	332
	
l118:	
	line	333
	
l5072:	
;lcd_grafico.c: 332: else
;lcd_grafico.c: 333: *pinos_display.pinoCS2.latch_pino &= (~(1 << pinos_display.pinoCS2.bit_pino));
	movlw	(01h)
	movwf	(??_CS2+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+0Eh,w
	goto	u3064
u3065:
	clrc
	rlf	(??_CS2+0)+0,f
u3064:
	addlw	-1
	skipz
	goto	u3065
	movf	0+(??_CS2+0)+0,w
	xorlw	0ffh
	movwf	(??_CS2+1)+0
	movf	(0+_pinos_display+0Dh)^080h,w
	movwf	fsr0
	movf	(??_CS2+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5074
	
l119:	
	line	334
	
l5074:	
;lcd_grafico.c: 334: *pinos_display.pinoCS2.porta_pino = *pinos_display.pinoCS2.latch_pino;
	movf	(0+_pinos_display+0Dh)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_CS2+0)+0
	movf	(0+_pinos_display+0Ch)^080h,w
	movwf	fsr0
	movf	(??_CS2+0)+0,w
	movwf	indf
	line	335
	
l120:	
	return
	opt stack 0
GLOBAL	__end_of_CS2
	__end_of_CS2:
;; =============== function _CS2 ends ============

	signat	_CS2,4216
	global	_CS1
psect	text675,local,class=CODE,delta=2
global __ptext675
__ptext675:

;; *************** function _CS1 *****************
;; Defined at:
;;		line 308 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  cs1             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cs1             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SelecionarArea
;; This function uses a non-reentrant model
;;
psect	text675
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	308
	global	__size_of_CS1
	__size_of_CS1	equ	__end_of_CS1-_CS1
	
_CS1:	
	opt	stack 4
; Regs used in _CS1: [wreg-fsr0h+status,2+status,0]
;CS1@cs1 stored from wreg
	movwf	(CS1@cs1)
	line	309
	
l5060:	
;lcd_grafico.c: 309: cs1 = !cs1;
	movf	(CS1@cs1)
	movlw	0
	skipnz
	movlw	1
	movwf	(??_CS1+0)+0
	movf	(??_CS1+0)+0,w
	movwf	(CS1@cs1)
	line	310
;lcd_grafico.c: 310: if(cs1)
	movf	(CS1@cs1),w
	skipz
	goto	u3010
	goto	l5064
u3010:
	line	311
	
l5062:	
;lcd_grafico.c: 311: *pinos_display.pinoCS1.latch_pino |= (1 << pinos_display.pinoCS1.bit_pino);
	movlw	(01h)
	movwf	(??_CS1+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+0Bh,w
	goto	u3024
u3025:
	clrc
	rlf	(??_CS1+0)+0,f
u3024:
	addlw	-1
	skipz
	goto	u3025
	movf	0+(??_CS1+0)+0,w
	movwf	(??_CS1+1)+0
	movf	(0+_pinos_display+0Ah)^080h,w
	movwf	fsr0
	movf	(??_CS1+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5066
	line	312
	
l113:	
	line	313
	
l5064:	
;lcd_grafico.c: 312: else
;lcd_grafico.c: 313: *pinos_display.pinoCS1.latch_pino &= (~(1 << pinos_display.pinoCS1.bit_pino));
	movlw	(01h)
	movwf	(??_CS1+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+0Bh,w
	goto	u3034
u3035:
	clrc
	rlf	(??_CS1+0)+0,f
u3034:
	addlw	-1
	skipz
	goto	u3035
	movf	0+(??_CS1+0)+0,w
	xorlw	0ffh
	movwf	(??_CS1+1)+0
	movf	(0+_pinos_display+0Ah)^080h,w
	movwf	fsr0
	movf	(??_CS1+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5066
	
l114:	
	line	314
	
l5066:	
;lcd_grafico.c: 314: *pinos_display.pinoCS1.porta_pino = *pinos_display.pinoCS1.latch_pino;
	movf	(0+_pinos_display+0Ah)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_CS1+0)+0
	movf	(0+_pinos_display+09h)^080h,w
	movwf	fsr0
	movf	(??_CS1+0)+0,w
	movwf	indf
	line	315
	
l115:	
	return
	opt stack 0
GLOBAL	__end_of_CS1
	__end_of_CS1:
;; =============== function _CS1 ends ============

	signat	_CS1,4216
	global	_RS
psect	text676,local,class=CODE,delta=2
global __ptext676
__ptext676:

;; *************** function _RS *****************
;; Defined at:
;;		line 289 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  rs              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rs              1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LigarDisplay
;;		_EnviarDado
;;		_LerDado
;;		_EnderecoX
;;		_EnderecoY
;;		_DesligarDisplay
;;		_ReceberStatus
;; This function uses a non-reentrant model
;;
psect	text676
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	289
	global	__size_of_RS
	__size_of_RS	equ	__end_of_RS-_RS
	
_RS:	
	opt	stack 5
; Regs used in _RS: [wreg-fsr0h+status,2+status,0]
;RS@rs stored from wreg
	movwf	(RS@rs)
	line	290
	
l5048:	
;lcd_grafico.c: 290: if(rs)
	movf	(RS@rs),w
	skipz
	goto	u2980
	goto	l5052
u2980:
	line	291
	
l5050:	
;lcd_grafico.c: 291: *pinos_display.pinoRS.latch_pino |= (1 << pinos_display.pinoRS.bit_pino);
	movlw	(01h)
	movwf	(??_RS+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+08h,w
	goto	u2994
u2995:
	clrc
	rlf	(??_RS+0)+0,f
u2994:
	addlw	-1
	skipz
	goto	u2995
	movf	0+(??_RS+0)+0,w
	movwf	(??_RS+1)+0
	movf	(0+_pinos_display+07h)^080h,w
	movwf	fsr0
	movf	(??_RS+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5054
	line	292
	
l108:	
	line	293
	
l5052:	
;lcd_grafico.c: 292: else
;lcd_grafico.c: 293: *pinos_display.pinoRS.latch_pino &= (~(1 << pinos_display.pinoRS.bit_pino));
	movlw	(01h)
	movwf	(??_RS+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+08h,w
	goto	u3004
u3005:
	clrc
	rlf	(??_RS+0)+0,f
u3004:
	addlw	-1
	skipz
	goto	u3005
	movf	0+(??_RS+0)+0,w
	xorlw	0ffh
	movwf	(??_RS+1)+0
	movf	(0+_pinos_display+07h)^080h,w
	movwf	fsr0
	movf	(??_RS+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5054
	
l109:	
	line	294
	
l5054:	
;lcd_grafico.c: 294: *pinos_display.pinoRS.porta_pino = *pinos_display.pinoRS.latch_pino;
	movf	(0+_pinos_display+07h)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_RS+0)+0
	movf	(0+_pinos_display+06h)^080h,w
	movwf	fsr0
	movf	(??_RS+0)+0,w
	movwf	indf
	line	295
	
l110:	
	return
	opt stack 0
GLOBAL	__end_of_RS
	__end_of_RS:
;; =============== function _RS ends ============

	signat	_RS,4216
	global	_E
psect	text677,local,class=CODE,delta=2
global __ptext677
__ptext677:

;; *************** function _E *****************
;; Defined at:
;;		line 253 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  e               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  e               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Clock
;;		_ClockComLeitura
;; This function uses a non-reentrant model
;;
psect	text677
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	253
	global	__size_of_E
	__size_of_E	equ	__end_of_E-_E
	
_E:	
	opt	stack 4
; Regs used in _E: [wreg-fsr0h+status,2+status,0]
;E@e stored from wreg
	movwf	(E@e)
	line	254
	
l5032:	
;lcd_grafico.c: 254: if(e)
	movf	(E@e),w
	skipz
	goto	u2950
	goto	l5036
u2950:
	line	255
	
l5034:	
;lcd_grafico.c: 255: *pinos_display.pinoE.latch_pino |= (1 << pinos_display.pinoE.bit_pino);
	movlw	(01h)
	movwf	(??_E+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+02h,w
	goto	u2964
u2965:
	clrc
	rlf	(??_E+0)+0,f
u2964:
	addlw	-1
	skipz
	goto	u2965
	movf	0+(??_E+0)+0,w
	movwf	(??_E+1)+0
	movf	(0+_pinos_display+01h)^080h,w
	movwf	fsr0
	movf	(??_E+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5038
	line	256
	
l98:	
	line	257
	
l5036:	
;lcd_grafico.c: 256: else
;lcd_grafico.c: 257: *pinos_display.pinoE.latch_pino &= (~(1 << pinos_display.pinoE.bit_pino));
	movlw	(01h)
	movwf	(??_E+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+02h,w
	goto	u2974
u2975:
	clrc
	rlf	(??_E+0)+0,f
u2974:
	addlw	-1
	skipz
	goto	u2975
	movf	0+(??_E+0)+0,w
	xorlw	0ffh
	movwf	(??_E+1)+0
	movf	(0+_pinos_display+01h)^080h,w
	movwf	fsr0
	movf	(??_E+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5038
	
l99:	
	line	258
	
l5038:	
;lcd_grafico.c: 258: *pinos_display.pinoE.porta_pino = *pinos_display.pinoE.latch_pino;
	movf	(0+_pinos_display+01h)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_E+0)+0
	movf	(_pinos_display)^080h,w
	movwf	fsr0
	movf	(??_E+0)+0,w
	movwf	indf
	line	259
	
l100:	
	return
	opt stack 0
GLOBAL	__end_of_E
	__end_of_E:
;; =============== function _E ends ============

	signat	_E,4216
	global	_RW
psect	text678,local,class=CODE,delta=2
global __ptext678
__ptext678:

;; *************** function _RW *****************
;; Defined at:
;;		line 271 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  rw              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rw              1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InicializarDisplay
;;		_ClockComLeitura
;; This function uses a non-reentrant model
;;
psect	text678
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	271
	global	__size_of_RW
	__size_of_RW	equ	__end_of_RW-_RW
	
_RW:	
	opt	stack 4
; Regs used in _RW: [wreg-fsr0h+status,2+status,0]
;RW@rw stored from wreg
	movwf	(RW@rw)
	line	272
	
l5024:	
;lcd_grafico.c: 272: if(rw)
	movf	(RW@rw),w
	skipz
	goto	u2920
	goto	l5028
u2920:
	line	273
	
l5026:	
;lcd_grafico.c: 273: *pinos_display.pinoRW.latch_pino |= (1 << pinos_display.pinoRW.bit_pino);
	movlw	(01h)
	movwf	(??_RW+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+05h,w
	goto	u2934
u2935:
	clrc
	rlf	(??_RW+0)+0,f
u2934:
	addlw	-1
	skipz
	goto	u2935
	movf	0+(??_RW+0)+0,w
	movwf	(??_RW+1)+0
	movf	(0+_pinos_display+04h)^080h,w
	movwf	fsr0
	movf	(??_RW+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5030
	line	274
	
l103:	
	line	275
	
l5028:	
;lcd_grafico.c: 274: else
;lcd_grafico.c: 275: *pinos_display.pinoRW.latch_pino &= (~(1 << pinos_display.pinoRW.bit_pino));
	movlw	(01h)
	movwf	(??_RW+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+05h,w
	goto	u2944
u2945:
	clrc
	rlf	(??_RW+0)+0,f
u2944:
	addlw	-1
	skipz
	goto	u2945
	movf	0+(??_RW+0)+0,w
	xorlw	0ffh
	movwf	(??_RW+1)+0
	movf	(0+_pinos_display+04h)^080h,w
	movwf	fsr0
	movf	(??_RW+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5030
	
l104:	
	line	276
	
l5030:	
;lcd_grafico.c: 276: *pinos_display.pinoRW.porta_pino = *pinos_display.pinoRW.latch_pino;
	movf	(0+_pinos_display+04h)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_RW+0)+0
	movf	(0+_pinos_display+03h)^080h,w
	movwf	fsr0
	movf	(??_RW+0)+0,w
	movwf	indf
	line	277
	
l105:	
	return
	opt stack 0
GLOBAL	__end_of_RW
	__end_of_RW:
;; =============== function _RW ends ============

	signat	_RW,4216
	global	_RST
psect	text679,local,class=CODE,delta=2
global __ptext679
__ptext679:

;; *************** function _RST *****************
;; Defined at:
;;		line 347 in file "C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
;; Parameters:    Size  Location     Type
;;  rst             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rst             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InicializarDisplay
;; This function uses a non-reentrant model
;;
psect	text679
	file	"C:\OD\OneDrive\Pessoal\Projetos para o GitHub\LCD Gráfico\lcd_grafico.c"
	line	347
	global	__size_of_RST
	__size_of_RST	equ	__end_of_RST-_RST
	
_RST:	
	opt	stack 6
; Regs used in _RST: [wreg-fsr0h+status,2+status,0]
;RST@rst stored from wreg
	movwf	(RST@rst)
	line	348
	
l5016:	
;lcd_grafico.c: 348: if(rst)
	movf	(RST@rst),w
	skipz
	goto	u2890
	goto	l5020
u2890:
	line	349
	
l5018:	
;lcd_grafico.c: 349: *pinos_display.pinoRST.latch_pino |= (1 << pinos_display.pinoRST.bit_pino);
	movlw	(01h)
	movwf	(??_RST+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+011h,w
	goto	u2904
u2905:
	clrc
	rlf	(??_RST+0)+0,f
u2904:
	addlw	-1
	skipz
	goto	u2905
	movf	0+(??_RST+0)+0,w
	movwf	(??_RST+1)+0
	movf	(0+_pinos_display+010h)^080h,w
	movwf	fsr0
	movf	(??_RST+1)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	goto	l5022
	line	350
	
l123:	
	line	351
	
l5020:	
;lcd_grafico.c: 350: else
;lcd_grafico.c: 351: *pinos_display.pinoRST.latch_pino &= (~(1 << pinos_display.pinoRST.bit_pino));
	movlw	(01h)
	movwf	(??_RST+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	0+(_pinos_display)^080h+011h,w
	goto	u2914
u2915:
	clrc
	rlf	(??_RST+0)+0,f
u2914:
	addlw	-1
	skipz
	goto	u2915
	movf	0+(??_RST+0)+0,w
	xorlw	0ffh
	movwf	(??_RST+1)+0
	movf	(0+_pinos_display+010h)^080h,w
	movwf	fsr0
	movf	(??_RST+1)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	goto	l5022
	
l124:	
	line	352
	
l5022:	
;lcd_grafico.c: 352: *pinos_display.pinoRST.porta_pino = *pinos_display.pinoRST.latch_pino;
	movf	(0+_pinos_display+010h)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_RST+0)+0
	movf	(0+_pinos_display+0Fh)^080h,w
	movwf	fsr0
	movf	(??_RST+0)+0,w
	movwf	indf
	line	353
	
l125:	
	return
	opt stack 0
GLOBAL	__end_of_RST
	__end_of_RST:
;; =============== function _RST ends ============

	signat	_RST,4216
psect	text680,local,class=CODE,delta=2
global __ptext680
__ptext680:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
