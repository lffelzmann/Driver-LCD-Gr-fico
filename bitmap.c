#include "bitmap.h"
#include "lcd_grafico.h"

/*Desenha um bitmap na tela por pintar cada bit de cada byte que compõe o bitmap. 
Inicia a renderização no bit superior esquerdo e termina no bit inferior direito.
Parâmetros:
bitmap: Endereço inicial do vetor do bitmap.
x: Coordenada x do display onde o bitmap deve começar a ser impresso.
y: Coordenada y do display onde o bitmap deve começar a ser impresso.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
altura_px: A altura do bitmap em pixels.
largura_bytes: A largura do bitmap em bytes.*/
void DesenharBitmap(const unsigned char* bitmap, unsigned char x, unsigned char y, unsigned char cor, unsigned char altura_px, unsigned char largura_bytes)
{
	unsigned char altura;
	unsigned char largura;
	unsigned char mascara;
	unsigned char bits;
	unsigned char novoY;
	unsigned char ponto;
	for(altura = 0; altura < altura_px; altura++)
	{
		novoY = y;
		for(largura = 0; largura < largura_bytes; largura++)
		{
			mascara = 0b10000000;
			for(bits = 0; bits < 8; bits++)
			{
				ponto = *bitmap & mascara;
				Ponto(x, novoY, cor ? ponto : !ponto);
				novoY++;
				mascara = mascara >> 1;
			}
			bitmap++;
		}
		x++;	
	}	
}
	