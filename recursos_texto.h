#ifndef RECURSOS_TEXTO_H
	#define RECURSOS_TEXTO_H
	
	//Defini��es gerais
	#define TAM_MAX_VAR 10 //Quantidade m�xima de algarismos que a fun��o EscreveVariavel deve suportar. Ex.: 10 significa que a fun��o poder� escrever de 0 a 9999999999.
	#define MASCARA_INICIAL 1000000000 //Essa m�scara deve ser ajustada junto com o n�mero acima. Deve ser 1 seguido de (TAM_MAX_VAR - 1) zeros � direita.
	#define FONTE_ESC_FUNDO_CLR 1
	#define FONTE_CLR_FUNDO_ESC 0
	
	//Prot�tipos
	unsigned char Centralizar(unsigned char tamanho_frase);
	unsigned char JustificarDireita(unsigned char tamanho_frase);
	unsigned char TamanhoFrase(const char* frase);
	void Cursor(unsigned char x, unsigned char y, unsigned char cor);
	void EscreveVariavel(unsigned long variavel, unsigned char x, unsigned char y, unsigned char cor);
	void EscreveCaractere(unsigned char caractere, unsigned char x, unsigned char y, unsigned char cor);
	void EscreveFrase(const char* frase, unsigned char x, unsigned char y, unsigned char cor);
#endif
