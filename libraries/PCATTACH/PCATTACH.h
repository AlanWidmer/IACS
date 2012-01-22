/*
 *
 * From http://www.arduino.cc/playground/Main/PcInt
 *
*/

#ifndef	_PCATTACH_H_ 
#define	_PCATTACH_H_ 
#endif

//#include <WProgram.h>
#define uint_8 uint8_t

class PCATTACH {

public:
PCATTACH();
~PCATTACH();



void PCattachInterrupt(uint8_t pin, void (*userFunc)(void), int mode);
void PCdetachInterrupt(uint8_t pin);


static void PCint(uint8_t);

/*
volatile uint8_t *port_to_pcmask[];
typedef void (*voidFuncPtr)(void);
volatile static voidFuncPtr PCintFunc[];
volatile static uint8_t PCintLast[];
*/


};

