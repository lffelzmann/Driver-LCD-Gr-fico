#include "lcd_grafico.h";
#include "recursos_texto.h";
#include "caracteres.h";
#include "bitmap.h";
#include "delays.h";
#include <htc.h>;

//Bits de configuração da MCU.
__CONFIG(FOSC_HS & WDTE_OFF & PWRTE_ON & MCLRE_ON & CP_ON & CPD_ON & BOREN_ON & IESO_OFF & FCMEN_ON & LVP_OFF & DEBUG_OFF);
__CONFIG(BOR4V_BOR21V & WRT_OFF);

void main(void)
{
	unsigned char latchb = 0; //Variável usada para operações de leitura_escrita em registradores que só permitem escrita.
	//Todos os pinos da MCU como saída.
	TRISA = 0;
	TRISB = 0;
	TRISC = 0;
	
	//Todos os pinos iniciando em nível baixo.
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
	
	//Mapeamento dos registradores da MCU associados aos registradores do display.
	MCUConfig pinos;
	pinos.pinoE.porta_pino = &PORTB;
	pinos.pinoE.bit_pino = 7;
	pinos.pinoE.latch_pino = &latchb;
	pinos.pinoRW.porta_pino = &PORTB;
	pinos.pinoRW.bit_pino = 6;
	pinos.pinoRW.latch_pino = &latchb;
	pinos.pinoRS.porta_pino = &PORTB;
	pinos.pinoRS.bit_pino = 5;
	pinos.pinoRS.latch_pino = &latchb;
	pinos.pinoCS1.porta_pino = &PORTB;
	pinos.pinoCS1.bit_pino = 3;
	pinos.pinoCS1.latch_pino = &latchb;
	pinos.pinoCS2.porta_pino = &PORTB;
	pinos.pinoCS2.bit_pino = 4;
	pinos.pinoCS2.latch_pino = &latchb;
	pinos.pinoRST.porta_pino = &PORTB;
	pinos.pinoRST.bit_pino = 2;
	pinos.pinoRST.latch_pino = &latchb;
	pinos.latchDADOS.latch = &PORTC;
	pinos.latchDADOS.tris = &TRISC;
	
	//Exemplo de uso do driver.
	InicializarDisplay(pinos);
	EscreveFrase("Driver LCD grafico", 1, Centralizar(TamanhoFrase("Driver LCD grafico")), FONTE_ESC_FUNDO_CLR);
	EscreveFrase("Leonardo Felzmann", 9, Centralizar(TamanhoFrase("Leonardo Felzmann")), FONTE_ESC_FUNDO_CLR);
	DesenharBitmap(bitmap_computador, 17, 51, FONTE_ESC_FUNDO_CLR, 35, 5);
	EscreveFrase("V1.0", 57, 1, FONTE_ESC_FUNDO_CLR);
	EscreveFrase("2022/07/12", 57, JustificarDireita(TamanhoFrase("2022/07/12")), FONTE_ESC_FUNDO_CLR);
	delay(2000);
	InverterCores();
	while(1)
	{
	}
}
