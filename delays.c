#include "htc.h"
#include "delays.h"

/*
Aguarda um tempo em milissegundos.
Par�metros:
ms: O tempo em milissegundos que deve ser aguardado.
*/
void delay(unsigned long ms)
{
	//Visto que a macro __delay_ms pode ocupar bastante mem�ria, vamos utiliz�-la encapsulada em uma fun��o.
	unsigned long t;
	for(t = 0; t < ms; t++)
		__delay_ms(1);
}

/*
Aguarda um tempo em microssegundos.
Par�metros:
us: O tempo em microssegundos que deve ser aguardado.
*/
void delayMicroseconds(unsigned long us)
{
	//Visto que a macro __delay_us pode ocupar bastante mem�ria, vamos utiliz�-la encapsulada em uma fun��o.
	unsigned long t;
	for(t = 0; t < us; t++)
		__delay_us(1);
}
		