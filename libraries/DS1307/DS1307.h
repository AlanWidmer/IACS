/* Adds support for the DS1307 real-time clock chip (RTC)
*/

#ifndef	_DS1307_H_
#define	_DS1307_H_
#endif

#ifndef	_Wire_H_
#define	_Wire_H_
#endif

//#include <WProgram.h>

#define DS1307_I2C_ADDRESS 0x68
  

extern uint8_t second, minute, hour, dayOfWeek, dayOfMonth, month, year;

class DS1307 {
public:
DS1307();
~DS1307();

void setDateDs1307(uint8_t second,        // 0-59
                   uint8_t minute,        // 0-59
                   uint8_t hour,          // 1-23
                   uint8_t dayOfWeek,     // 1-7
                   uint8_t dayOfMonth,    // 1-28/29/30/31
                   uint8_t month,         // 1-12
                   uint8_t year);          // 0-99

void getDateDs1307(uint8_t *second,
          uint8_t *minute,
          uint8_t *hour,
          uint8_t *dayOfWeek,
          uint8_t *dayOfMonth,
          uint8_t *month,
          uint8_t *year);

private:
uint8_t decToBcd(uint8_t val);
uint8_t bcdToDec(uint8_t val);

};
