/*
	DaylightSavingsUS.cpp
 
 Contains the calculation for US DST as of 2007
*/


#include "DaylightSavings.h"


void DaylightSavingsClass::getTimesFor(byte year)
{
    byte dow, day = 1;
    time_t temp = dateTime->makeTime(0, 0, 2, day, 2, year + 1900); // March 1st
    dateTime->localTime(&temp, NULL, NULL, NULL, NULL, &dow, NULL, NULL);
    day += 7 + ((dow == 0) ? 0 : 7 - dow); // 2nd Sunday
    springForward = dateTime->makeTime(0, 0, 2, day, 2, year + 1900);
    day = 1;
    temp = dateTime->makeTime(0, 0, 2, day, 10, year + 1900); // November 1st
    dateTime->localTime(&temp, NULL, NULL, NULL, NULL, &dow, NULL, NULL);
    day += 0 + ((dow == 0) ? 0 : 7 - dow); // 1st Sunday
    fallBack = dateTime->makeTime(0, 0, 2, day, 10, year + 1900);
}
