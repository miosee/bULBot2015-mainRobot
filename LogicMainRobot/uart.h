#define UART1 1
#define UART2 2

void uartInit(void);
void uartEnvoiMessage(unsigned char* message, unsigned char taille, unsigned char id, int canal);
void uartEnvoiHexa(unsigned char nombre, int canal);
void uartEnvoiTemps();

