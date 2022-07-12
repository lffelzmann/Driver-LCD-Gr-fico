#include "recursos_texto.h";
#include "caracteres.h"
#include "lcd_grafico.h";

/*
Calcula a coordenada y para que o texto fique centralizado.
Parâmetros:
tamanho_frase: O tamanho da frase a ser centralizada.
Retorno: Valor da coordenada y a ser utilizado.
*/
unsigned char Centralizar(unsigned char tamanho_frase)
{
	return (LARGURA_DISPLAY - (tamanho_frase * (LARGURA_CARACTERE + 1))) >> 1; // Deslocar 1 para a direita é o mesmo que dividir por 2.
}

/*
Calcula a coordenada y para que o texto fique alinhado à direita.
Parâmetros:
tamanho_frase: O tamanho da frase a ser centralizada.
Retorno: Valor da coordenada y a ser utilizado.
*/
unsigned char JustificarDireita(unsigned char tamanho_frase) 
{
	return LARGURA_DISPLAY - (tamanho_frase * (LARGURA_CARACTERE + 1));
}

/*
Calcula o tamanho de uma frase. Visto que não temos muita memória, pode não ser viável utilizar strlen.
Parâmetros:
frase: A frase cujo tamanho precisa ser calculado.
Retorno: O tamanho da frase.
*/
unsigned char TamanhoFrase(const char* frase)
{
	unsigned char tamanho = 0;
	while(*frase)
	{
		tamanho++;
		frase++;
	}
	return tamanho;
}

/*
Cria um cursor na tela.
Parâmetros:
x: Coordenada x onde o cursor deve ser posicionado (referente ao pixel superior).
y: Coordenada y onde o cursor deve ser posicionado.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
*/
void Cursor(unsigned char x, unsigned char y, unsigned char cor)
{
	unsigned char x_aux;
	for(x_aux = x; x_aux < (x + 7); x_aux++)
		Ponto(x_aux, y, cor);
}

/*
Escreve um número na tela.
Parâmetros:
variavel: O número a ser escrito.
x: Coordenada x onde o número deve ser escrito.
y: Coordenada y onde o número deve ser escrito.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
*/
void EscreveVariavel(unsigned long variavel, unsigned char x, unsigned char y, unsigned char cor)
{
	unsigned long multiplicacoes[TAM_MAX_VAR];
	unsigned char i, j;
	unsigned long resultado;
	unsigned long mascara = MASCARA_INICIAL;
	unsigned char escreveu=0;
	for(i = 0; i < TAM_MAX_VAR; i++, mascara /= 10)
	{
		resultado = variavel;
		for(j = 0; j < i; j++)
			resultado -= multiplicacoes[j];
		resultado /= mascara;
		multiplicacoes[i] = resultado * mascara;
		if(resultado || escreveu || i == (TAM_MAX_VAR - 1))
		{
			EscreveCaractere(resultado + 0x30, x, y, cor);
			y += (LARGURA_CARACTERE + ESPACO_ENTRE_CARACTERES);
			escreveu = 1;
		}
	}
}

/*
Escreve um caractere ASCII na tela.
Parâmetros:
caractere: O caractere a ser escrito.
x: Coordenada x onde o caractere deve ser escrito.
y: Coordenada y onde o caractere deve ser escrito.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
*/
void EscreveCaractere(unsigned char caractere, unsigned char x, unsigned char y, unsigned char cor)
{
	unsigned char ponto;
	unsigned char mascara;
	unsigned char x_aux, y_aux;
	unsigned int end_alfa;
	//Embora usar ifs, elses e um switch possa ser feio e não ter boa performance, precisamos lembrar que estamos num ambiente com pouquíssima memória.
	//Criar uma tabela de conversão ocuparia muito mais memória sem um ganho de performance justificável.
	if(caractere >= '0' && caractere <= '9')
		end_alfa = ((caractere - 48) * LARGURA_CARACTERE) + 260;
	else if(caractere >= 'A' && caractere <= 'Z')
		end_alfa = (caractere - 'A') * LARGURA_CARACTERE;
	else if(caractere >= 'a' && caractere <= 'z')
		end_alfa = ((caractere - 'a') + 26 ) * LARGURA_CARACTERE;
	else
	{
		switch(caractere)
		{
			case '?':
				end_alfa = 310;
				break;
			case '!':
				end_alfa = 315;
				break;
			case '.':
				end_alfa = 320;
				break;
			case ',':
				end_alfa = 325;
				break;
			case ':':
				end_alfa = 330;
				break;
			case '#':
				end_alfa = 335;
				break;
			case '*':
				end_alfa = 340;
				break;
			case ' ':
				end_alfa = 345;
				break;
			case '_':
				end_alfa = 350;
				break;
			case '/':
				end_alfa = 355;
				break;
			case '%':
				end_alfa = 360;
				break;
		}
	}
	//Renderização do caractere
	for(y_aux = y; y_aux < (y + LARGURA_CARACTERE); y_aux++)
	{
		mascara=0b10000000;
		for(x_aux = x; x_aux < (x + ALTURA_CARACTERE); x_aux++)
		{
			ponto = alfabeto[end_alfa] & mascara;
			Ponto(x_aux, y_aux, cor ? ponto : !ponto);
			mascara = mascara >> 1;
		}
		end_alfa++;
	}
}

/*
Escreve uma frase na tela.
Parâmetros:
frase: A frase a ser escrita.
x: A coordenada x onde a frase deve começar a ser escrita.
y: A coordenada y onde a frase deve começar a ser escrita.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
*/
void EscreveFrase(const char* frase, unsigned char x, unsigned char y, unsigned char cor)
{
	while(*frase)
	{
		EscreveCaractere(*frase, x, y, cor);
		frase++;
		y += (LARGURA_CARACTERE + ESPACO_ENTRE_CARACTERES);
  }
}