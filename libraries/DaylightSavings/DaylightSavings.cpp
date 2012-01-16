/*
	DaylightSavings.cpp
*/


#include "DaylightSavings.h"


DaylightSavingsClass::DaylightSavingsClass()
{
    initialize(NULL);
}


DaylightSavingsClass::DaylightSavingsClass(DateTimeClass * dt)
{
    initialize(dt);
}


void DaylightSavingsClass::initialize(DateTimeClass * dt)
{
    springForward = 0;
    fallBack = 0;
    winterOffset = 0;
    summerOffset = SECS_PER_HOUR;
    
    dateTime = dt;
}


boolean DaylightSavingsClass::check()
{
    if (dateTime == NULL) 
        return false;
    
    if (!dateTime->available()) 
        return false;
    
    time_t time = dateTime->nowRaw(); // without offsets (DST) added
    byte year = dateTime->Year;
    
    if (time > fallBack) 
        getTimesFor(year); // calculate current year, will update fallBack
    
    if (time > fallBack) 
        getTimesFor(year + 1); // calculate next year
    
    if (time < springForward) 
    {
        dateTime->setDSToffset(winterOffset);
        return false;
    }
    else 
    {
        dateTime->setDSToffset(summerOffset);
        return true;
    }
}


time_t DaylightSavingsClass::getSpringForward()
{
    return springForward;
}


time_t DaylightSavingsClass::getFallBack()
{
    return fallBack;
}


DaylightSavingsClass DaylightSavings = DaylightSavingsClass(&DateTime); // create an instance
