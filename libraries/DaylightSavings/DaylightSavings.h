/*
	DaylightSavings.h
*/

#ifndef DaylightSavings_h
#define DaylightSavings_h

#include "DateTime.h"

#if !defined(NULL) 
#define NULL 0
#endif

#include <inttypes.h>

typedef uint8_t boolean;
typedef unsigned long time_t;


class DaylightSavingsClass
{
private:
    time_t springForward;
    time_t fallBack;
    time_t winterOffset;
    time_t summerOffset;
    
    DateTimeClass * dateTime;
    
    void initialize(DateTimeClass * dt);
    void getTimesFor(byte year); // only this needs to change for different implementations

public:
	DaylightSavingsClass();
    DaylightSavingsClass(DateTimeClass * dt);
    
    boolean check(); // 
    time_t getSpringForward();
    time_t getFallBack();
};


extern DaylightSavingsClass DaylightSavings;  // create an instance

#endif
