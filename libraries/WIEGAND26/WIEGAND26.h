/* Wiegand26 library - adapted from Crazy People by Mike Cook
 *  http://www.thebox.myzen.co.uk/Hardware/Crazy_People.html
 *
 *  Version 1.0 - Last updated 4/12/2010 by arclight@gmail.com
*/

#ifndef	_WIEGAND26_H_ 
#define	_WIEGAND26_H_ 
#endif

#include <WProgram.h>

class WIEGAND26 {
public:
WIEGAND26();
~WIEGAND26();


void initReaderOne(void);
void initReaderTwo(void);
void reader1One(void);
void reader1Zero(void);
void reader2One(void);
void reader2Zero(void);
void initReaderThree(void);
void reader3One(void);
void reader3Zero(void);

private:

};
