/* Open Access Control for Hacker Spaces
 * Created by 23B Shop Hacker Space
 * http://blog.shop.23b.org
 * by John Norman and Dan Lozano
 * Readme updated 4/3/2011
*/

For the latest version of this software, visit:
http://code.google.com/p/open-access-control/

New features in v1.32:
-Serial console password with bad attempts lockout
-Fixed minor bugs, remove some unused functions

Note: Unpack the libraries (WIEGAND26, DS1307, PCATTACH) into your arduino
libraries directory.  This is usually:

~/arduino/hardware/libraries/



The hardware design for the Open Access Control for Hacker Spaces uses the Arduino 
board with Atmega 328. It has been tested with:

-Arduino Uno
-Arduino Duemilanove
-Freeduino through hole (NKC)

The software has the following features:
-Shield compatible with Arduino
-Designed for use with Wiegand26 format readers (up to 3 support in software)
-DS1307 Real-time clock support
-(2) Wiegand26 reader inputs (optoisolated)
-(4) Alarm zone monitor ports using Analog0..3
-(4) Relay outputs


The following pin assignments are assumed by this software:

-Pins 2,3 for Reader 1
-Pins 4,5 for Reader 2
-Pins 5,6,7,8 for Relays
-Pins A0,A1,A2,A3 for alarm sensors
-Pins A4,A5 for SDA,SCL (I2C)
 