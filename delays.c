#include "htc.h"
#include "delays.h"

/*
Aguarda um tempo em milissegundos.
Parâmetros:
ms: O tempo em milissegundos que deve ser aguardado.
*/
void delay(unsigned long ms)
{
	//Visto que a macro __delay_ms pode ocupar bastante memória, vamos utilizá-la encapsulada em uma função.
	unsigned long t;
	for(t = 0; t < ms; t++)
		__delay_ms(1);
}

/*
Aguarda um tempo em microssegundos.
Parâmetros:
us: O tempo em microssegundos que deve ser aguardado.
*/
void delayMicroseconds(unsigned long us)
{
	//Visto que a macro __delay_us pode ocupar bastante memória, vamos utilizá-la encapsulada em uma função.
	unsigned long t;
	for(t = 0; t < us; t++)
		__delay_us(1);
}
		