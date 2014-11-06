typedef enum {
	PATINAGE_DETECTED = 1,
	NO_PATINAGE = 0
} regType;

void regInit(void);
regType regCompute(void);
