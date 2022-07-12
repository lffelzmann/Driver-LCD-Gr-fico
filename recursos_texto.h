#ifndef RECURSOS_TEXTO_H
	#define RECURSOS_TEXTO_H
	
	//Definições gerais
	#define TAM_MAX_VAR 10 //Quantidade máxima de algarismos que a função EscreveVariavel deve suportar. Ex.: 10 significa que a função poderá escrever de 0 a 9999999999.
	#define MASCARA_INICIAL 1000000000 //Essa máscara deve ser ajustada junto com o número acima. Deve ser 1 seguido de (TAM_MAX_VAR - 1) zeros à direita.
	#define FONTE_ESC_FUNDO_CLR 1
	#define FONTE_CLR_FUNDO_ESC 0
	
	//Protótipos
	unsigned char Centralizar(unsigned char tamanho_frase);
	unsigned char JustificarDireita(unsigned char tamanho_frase);
	unsigned char TamanhoFrase(const char* frase);
	void Cursor(unsigned char x, unsigned char y, unsigned char cor);
	void EscreveVariavel(unsigned long variavel, unsigned char x, unsigned char y, unsigned char cor);
	void EscreveCaractere(unsigned char caractere, unsigned char x, unsigned char y, unsigned char cor);
	void EscreveFrase(const char* frase, unsigned char x, unsigned char y, unsigned char cor);
#endif
