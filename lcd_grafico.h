#ifndef LCD_GRAFICO_H
	#define LCD_GRAFICO_H
	
	//Estruturas para defini��es de hardware.
	typedef struct
	{
		volatile unsigned char* porta_pino; //Registrador que controla a porta do microcontrolador onde est� localizado o pino em quest�o.
		volatile unsigned char* latch_pino; //Buffer usado como c�pia do valor da porta para realizar opera��es de leitura/escrita.
		unsigned char bit_pino; //Bit do registrador da porta correspondente ao pino em quest�o.
	}
	InfoPino;
	
	typedef struct
	{
		volatile unsigned char* latch; //Porta de 8 bits usada para ler/escrever dados no display.
		volatile unsigned char* tris; //Registrador que controla a dire��o da porta (entrada ou sa�da).
	}
	InfoLatch;
	
	typedef struct
	{
		InfoPino pinoE; //Configura��es do pino enable.
		InfoPino pinoRW; //Configura��es do pino read write.
		InfoPino pinoRS; //Configura��es do pino register select.
		InfoPino pinoCS1; //Configura��es do pino chip select 1.
		InfoPino pinoCS2; //Configura��es do pino chip select 2.
		InfoPino pinoRST; //Configura��es do pino reset.
		InfoLatch latchDADOS; //Configura��es do latch de dados.
	}
	MCUConfig;
	
	MCUConfig pinos_display; //Vari�vel global utilizada para controlar os pinos do microcontrolador associados aos registradores do display.
	
	//Defini��es gerais
	#define TOTAL_PAGINAS_X 8
	#define Y_MAX_AREA 64
	#define LARGURA_DISPLAY 128
	#define NENHUMA_AREA 0
	#define AREA_1 1
	#define AREA_2 2
	#define TODAS_AREAS 3
	
	//Macros
	#define RW_LEITURA() RW(1)
	#define RW_ESCRITA() RW(0)
	#define RS_INSTRUCAO() RS(0)
	#define RS_DADO() RS(1)
	#define LER_DADOS() *pinos_display.latchDADOS.latch
	#define ENVIAR_DADOS(x) *pinos_display.latchDADOS.latch = x
	#define DADOS_ENTRADA() *pinos_display.latchDADOS.tris = 0xFF
	#define DADOS_SAIDA() *pinos_display.latchDADOS.tris = 0x00

	//Prot�tipos
	void InverterCores(void);
	void Ponto(unsigned char x,unsigned char y,unsigned char apaga);
	unsigned char NovoX(unsigned char x,unsigned char area,unsigned char apaga);
	void LimparDisplay(void);
	void InicializarDisplay(MCUConfig pinos);
	void Clock(void);
	unsigned char ClockComLeitura(void);
	void DesligarDisplay(void);
	void LigarDisplay(void);
	void EnviarDado(unsigned char dado,unsigned char area);
	unsigned char ReceberStatus(void);
	unsigned char LerDado(unsigned char area);
	void SelecionarArea(unsigned char area);
	void EnderecoX(unsigned char x,unsigned char area);
	void EnderecoY(unsigned char y,unsigned char area);
	void E(unsigned char e);
	void RW(unsigned char rw);
	void RS(unsigned char rs);
	void CS1(unsigned char cs1);
	void CS2(unsigned char cs2);
	void RST(unsigned char rst);
	
#endif
