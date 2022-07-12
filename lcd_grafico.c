#include "lcd_grafico.h";
#include "delays.h";

/*
Faz o que era claro ficar escuro e vice-versa.
*/
void InverterCores(void)
{
	unsigned char leitura;
	unsigned char x, y;
	unsigned char area;
	for(area = AREA_1; area < TODAS_AREAS; area++)
	{
		for(x = 0; x < TOTAL_PAGINAS_X; x++)
		{  
			EnderecoX(x, area);
			for(y = 0; y < Y_MAX_AREA; y++)
			{
				EnderecoY(y, area);
				leitura=LerDado(area);
				EnderecoY(y, area);
				EnviarDado(~leitura, area);
			}
		}
	}
}

/*
Pinta ou apaga 1 pixel na tela.
Parâmetros:
x: Coordenada x onde o ponto deve ser renderizado.
y: Coorenada y onde o ponto deve ser renderizado.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONTE_CLR_FUNDO_ESC.
*/
void Ponto(unsigned char x, unsigned char y, unsigned char cor)
{
	unsigned char area;
	unsigned char pagina;
	if(y < Y_MAX_AREA)
		area = AREA_1;
	else
	{
		y = y - Y_MAX_AREA;
		area = AREA_2; 
	}
	pagina = x >> 3;  //x >> 3 é o mesmo que x / 8.
	EnderecoX(pagina, area);
	x = ((pagina + 1) << 3) - x; //(pagina + 1) << 3 é o mesmo que (pagina + 1) * 8.
	EnderecoY(y, area);
	x = NovoX(x, area, cor);
	EnderecoY(y, area);
	EnviarDado(x, area);
}

/*
Calcula o byte que deve ser enviado de modo a setar ou apagar somente o bit desejado.
Parâmetros:
x: Coordenada x a ser modificada.
area: Área do display onde está localizada a coordenada X. Deve ser AREA_1 ou AREA_2.
cor: Pode ser FONTE_ESC_FUNDO_CLR ou FONT_CLR_FUNDO_ESC.
Retorno: Página de X com os bits que já estavam presentes no display e com o bit solicitado modificado.
*/
unsigned char NovoX(unsigned char x, unsigned char area, unsigned char cor)
{
	unsigned char leitura; //VariÃ¡vel usada para receber a leitura do display.
	leitura = LerDado(area); //LÃª o display para nÃ£o apagar o que jÃ¡ estÃ¡ escrito.
	return cor ? leitura |= (1 << (7 - x)) : leitura &= ~(1 << (7 - x)); //Seta ou reseta o ponto solicitado sem afetar os demais.
}

/*
Apaga o conteúdo do display.
*/
void LimparDisplay(void)
{
	unsigned char x, y;
	for(x = 0; x < TOTAL_PAGINAS_X; x++)
	{
		EnderecoX(x, TODAS_AREAS);
		for(y = 0; y < Y_MAX_AREA; y++)
			EnviarDado(0, TODAS_AREAS);
	}
}

/*
Recebe quais pinos do microcontrolador serão usados para controlar o display e executa o procedimento de inicialização do display.
Para mais informações sobre como mapear a estrutura MCUConfig, veja o arquivo lcd_grafico.h.
*/
void InicializarDisplay(MCUConfig pinos)
{
	pinos_display = pinos;
	RST(0); //Executa um reset no display para incialização.
	RW_ESCRITA(); //Registrador RW configurado como escrita (MCU -> display).
	DADOS_SAIDA(); //Latch de dados configurados como saída (MCU -> display).
	RST(1); //Sai do modo reset.
	delay(1);
	LigarDisplay();
	LimparDisplay();
}

/*
Realiza um clock para que o display receba o dado enviado. O clock é realizado por setar e resetar o pino E (enable).
*/
void Clock(void)
{
	E(1);
	delayMicroseconds(2);
	E(0);
	delayMicroseconds(10); //Tempo necessário para o display processar o que foi enviado antes do clock.
}

/*
Realiza um clock e obtém uma leitura no nível alto do segundo ciclo de clock.
Retorno: byte lido do display.
*/
unsigned char ClockComLeitura(void)
{
	unsigned char leitura;
	DADOS_ENTRADA(); //Latch de dados configurado como leitura (display -> MCU).
	RW_LEITURA(); //Registrador RW configurado como leitura (display -> MCU).
	//Realiza 2 ciclos de clock e lê o latch de dados no nível alto do segundo ciclo.
	E(1);
	delayMicroseconds(2);
	E(0);
	delayMicroseconds(2);
	E(1);
	delayMicroseconds(5);
	leitura = LER_DADOS();
	E(0);
	RW_ESCRITA(); //Registrador RW configurado como escrita (MCU -> display).
	DADOS_SAIDA(); //Latch de dados configurado como escrita (MCU -> display).
	delayMicroseconds(15); //Tempo necessário para o display processar dados.
	return leitura;
}

//Limpa o display, sem apagar a RAM do display. 
void DesligarDisplay(void)
{
	SelecionarArea(TODAS_AREAS);
	RS_INSTRUCAO();
	ENVIAR_DADOS(0b00111110); //Byte de instrução para desligar o display.
	Clock();
	SelecionarArea(NENHUMA_AREA); 
}

/*
Liga o display, avisando que o conteúdo da RAM do mesmo deve ser mostrado na tela.
*/
void LigarDisplay(void)
{
	SelecionarArea(TODAS_AREAS);
	RS_INSTRUCAO();
	ENVIAR_DADOS(0b00111111); //Byte de instrução para ligar o display.
	Clock();
	SelecionarArea(NENHUMA_AREA);
}

/*
Envia um byte de dados para o display.
Parâmetros:
dado: Dado a ser enviado para o display.
area: Área do display onde o dado deve ser escrito. Pode ser AREA_1, AREA_2 ou TODAS_AREAS.
*/
void EnviarDado(unsigned char dado, unsigned char area)
{
	SelecionarArea(area); //Seleciona a Ã¡rea a qual o dado deve ser enviado.
	RS_DADO(); //Configura o prÃ³ximo byte como dado.
	ENVIAR_DADOS(dado); //Envia o dado desejado para o display.
	Clock(); //Realiza o clock para que o display receba o dado enviado.
	SelecionarArea(NENHUMA_AREA); //Desabilita o display para evitar exibição de lixo.
}

/*
Recebe o status do display (ocupado ou livre).
Retorno: Byte de status do display.
*/
unsigned char ReceberStatus(void)
{
	RS_INSTRUCAO();
	return ClockComLeitura();
}

/*
Recebe o conteúdo da página x do display, na coordenada y previamente enviadas através das funções EnderecoX e EnderecoY.
Parâmetros:
area: Área onde o dado deve ser lido. Pode ser AREA_1 ou AREA_2.
Retorno: Byte de dados lido do display.
*/
unsigned char LerDado(unsigned char area)
{
	unsigned char leitura;
	SelecionarArea(area);
	RS_DADO();
	leitura = ClockComLeitura();
	SelecionarArea(NENHUMA_AREA);
	return leitura;
}

/*
Indica ao display se deve ler/escrever no lado direito ou no lado esquerdo (y=0 a 63 ou y=64 a 127).
Parâmetros:
area: Área a ser selecionada. 
		Pode ser AREA_1 (lado esquerdo), 
				 AREA_2 (lado direito), 
				 TODAS_AREAS (somente para escrita e duplica os dados em ambos os lados)
				 NENHUMA_AREA (protege o display contra escritas indesejadas causadas por ruídos).
*/
void SelecionarArea(unsigned char area)
{
	CS1(area == AREA_1 || area == TODAS_AREAS);
	CS2(area >= AREA_2);
}

/*
Seleciona uma página de x no display.
Parâmetros:
x: Página de x a ser selecionada.
area: Determina se a página será selecionada do lado esquerdo, direito ou ambos. Pode ser AREA_1, AREA_2 ou TODAS_AREAS.
*/
void EnderecoX(unsigned char x, unsigned char area)
{
	SelecionarArea(area);
	RS_INSTRUCAO();
	ENVIAR_DADOS(0b10111000 | x); //Instrução de página x concatenada com a coordenada x informada no parâmetro.
	Clock();
	SelecionarArea(NENHUMA_AREA);
}

/*
Seleciona uma coordenada y no display.
Parâmetros:
y: Coordenada y a ser selecionada.
area: Determina se a coordenada y será selecionada do lado esquerdo, direito ou ambos. Pode ser AREA_1, AREA_2 ou TODAS_AREAS.
*/
void EnderecoY(unsigned char y, unsigned char area)
{
	SelecionarArea(area);
	RS_INSTRUCAO();
	ENVIAR_DADOS(0b1000000 | y); //Instrução para setar a coordenada y concacatenada com a coordenada y informada no parâmetro.
	Clock();
	SelecionarArea(NENHUMA_AREA);
}

/*
Modifica o pino da MCU que controla o registrador E (enable) do display.
O registrador E é usado para clock para avisar ao display que um dado está pronto no latch de dados ou então que o microcontrolador está pronto para ler dados do display.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Parâmetros:
e: Nível de tensão do pino.
	0 -> GND
	Diferente de 0 -> Nível alto (geralmente 5V ou 3.3V). 
*/
void E(unsigned char e)
{
	if(e)
		*pinos_display.pinoE.latch_pino |= (1 << pinos_display.pinoE.bit_pino);
	else
		*pinos_display.pinoE.latch_pino &= (~(1 << pinos_display.pinoE.bit_pino));
	*pinos_display.pinoE.porta_pino = *pinos_display.pinoE.latch_pino;
}

/*
Modifica o pino da MCU que controla o registrador RW (read/write) do display.
O registrador RW é usado para informar se queremos enviar dados do microcontrolador para o display ou se queremos receber dados do display para o microcontrolador.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Parâmetros:
rw: Nível de tensão do pino.
	0 -> GND
	Diferente de 0 -> Nível alto (geralmente 5V ou 3.3V). 
*/
void RW(unsigned char rw)
{
	if(rw)
		*pinos_display.pinoRW.latch_pino |= (1 << pinos_display.pinoRW.bit_pino);
	else
		*pinos_display.pinoRW.latch_pino &= (~(1 << pinos_display.pinoRW.bit_pino));
	*pinos_display.pinoRW.porta_pino = *pinos_display.pinoRW.latch_pino;
}

/*
Modifica o pino da MCU que controla o registrador RS (register select) do display.
O registrador RA é usado para informar se o byte enviado é um dado ou uma instrução.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Parâmetros:
rs: Nível de tensão do pino.
	0 -> GND
	Diferente de 0 -> Nível alto (geralmente 5V ou 3.3V). 
*/
void RS(unsigned char rs)
{
	if(rs)
		*pinos_display.pinoRS.latch_pino |= (1 << pinos_display.pinoRS.bit_pino);
	else
		*pinos_display.pinoRS.latch_pino &= (~(1 << pinos_display.pinoRS.bit_pino));
	*pinos_display.pinoRS.porta_pino = *pinos_display.pinoRS.latch_pino;
}

/*
Modifica o pino da MCU que controla o registrador CS1 (chip select 1) do display.
O registrador CS1 é usado para habilitar a leitura/escrita no lado esquerdo do display.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Visto que esse registrador possui uma porta NOT associada via hardware, foi adicionado uma inversão do valor do parâmetro.
Parâmetros:
cs1: Nível de tensão do pino negado.
	0 -> Nível alto (geralmente 5V ou 3.3V)
	Diferente de 0 -> GND 
*/
void CS1(unsigned char cs1)
{
	cs1 = !cs1;
	if(cs1)
		*pinos_display.pinoCS1.latch_pino |= (1 << pinos_display.pinoCS1.bit_pino);
	else
		*pinos_display.pinoCS1.latch_pino &= (~(1 << pinos_display.pinoCS1.bit_pino));
	*pinos_display.pinoCS1.porta_pino = *pinos_display.pinoCS1.latch_pino;
}

/*
Modifica o pino da MCU que controla o registrador CS2 (chip select 2) do display.
O registrador CS2 é usado para habilitar a leitura/escrita no lado direito do display.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Visto que esse registrador possui uma porta NOT associada via hardware, foi adicionado uma inversão do valor do parâmetro.
Parâmetros:
cs1: Nível de tensão do pino negado.
	0 -> Nível alto (geralmente 5V ou 3.3V)
	Diferente de 0 -> GND
*/
void CS2(unsigned char cs2)
{
	cs2 = !cs2;
	if(cs2)
		*pinos_display.pinoCS2.latch_pino |= (1 << pinos_display.pinoCS2.bit_pino);
	else
		*pinos_display.pinoCS2.latch_pino &= (~(1 << pinos_display.pinoCS2.bit_pino));
	*pinos_display.pinoCS2.porta_pino = *pinos_display.pinoCS2.latch_pino;
}

/*
Modifica o pino da MCU que controla o registrador RST (reset) do display.
O registrador RST é usado para reiniciar o display.
Visto que o registrador não pode ser lido antes da escrita, a escrita primeiro é realizada em um latch e posteriormente esse valor é atribuído ao registrador associado ao pino.
Parâmetros:
rst: Nível de tensão do pino.
	0 -> GND
	Diferente de 0 -> Nível alto (geralmente 5V ou 3.3V)
*/
void RST(unsigned char rst) //Atribui um valor ao pino RST (reset).
{
	if(rst)
		*pinos_display.pinoRST.latch_pino |= (1 << pinos_display.pinoRST.bit_pino);
	else
		*pinos_display.pinoRST.latch_pino &= (~(1 << pinos_display.pinoRST.bit_pino));
	*pinos_display.pinoRST.porta_pino = *pinos_display.pinoRST.latch_pino;
}
