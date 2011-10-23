*********************************************************************
Open Access Control for Hacker Spaces - Power Board v2.10
*********************************************************************


This is an optional UPS/power management board, designed for use with Open Access
v2.00 or higher. In operation, it allows a 13-15V adjustable power supply of up to 
5A to maintain a 12V SLA battery and provide uninterrupted power to the access board
and external door hardware or sensors.

The latest version of this file and more can be found at:
http://code.google.com/p/open-access-control


Open Access Control by Arclight is licensed under a Creative Commons Attribution 
3.0 Unported License. Based on a work at code.google.com/p/open-access-control



*********************************************************************
Hardware notes and assembly instructions
*********************************************************************
Important notes:
1. You must use a 13-15V power source that can be adjusted to provide
   13.5 - 13.8V at the battery terminals. This assumes a sealed Lead 
   Acid (SLA) type battery. Other battery chemistries will require
   different float voltages.

2. The circuit as shown will limit the charging current to 1A in case a
   very dead battery is connected to the circuit. You may vary the value
   of R3 to match the C/10 value for your battery.

3. Your power supply needs to be fused or otherwise protected from over-
   current.

Changes since v1.00:
1.  Eliminated output fuse, as v2.00 of the Access Control board has this already.
2.  Changed to .140" diameter mounting holes to accomodate 6-32 mounting screws
3.  Larger traces on all power nets - .150 @ 1oz copper, rated for 5A+ continuous.
4.  Added an input and output status LED




*********************************************************************
Build notes and pre-requisites
*********************************************************************
To make this work, you will need the following:

-13-15V adjustable power supply (5A recommended)
-Assembled Open Access Control v2.00 board or similar device
-Multimeter (volts/ohms) for testing
-25w soldering pencil 
-60/40 rosin core solder or equivalent
-Small needle-nose pliers
-Flush cutters
-Small Philips screwdriver
-Flux remover (optional)

*********************************************************************
Bill of Materials
*********************************************************************
(3) Silicon power diodes, P6-15 or similar, 6A rating
(2) Green LEDs, 20ma current spec
(2) 2.2k resistors, 1/4w
(1) 15ohm, 5w sandblock resistor or equivalent. 
    Adjust value for C/10 rating of battery.
(3) 2-position Screw terminals, W237-102, Mouser p/n:651-1935161


*********************************************************************
Step-by-step building and testing instructions
*********************************************************************

1. Assemble the components listed in the bill of materials and populate them into the board. Observe the 
orientation of the diodes, and place the stripe side in the position indicated on the board. The screw 
terminals snap together like Lego's, and they should be assembled prior to soldering.  Solder the components
and clip off the excess leads.


2. When finished, attach a 13-15V power source to the terminals marked "12V IN." For each pair of power terminals, the
left side is (-) and the terminal to the right is (+). Measure the voltage at the "BATT" terminals and adjust
your power supply until this voltage reads 13.5-13.8VDC. If using a battery type other than SLA, adjust according
to the manufacturers data. 

3. Check to see that both LEDs at lit up.

4. Attach a 12V SLA battery of 7-15AH to the BATT pins. 

5. Turn off the power source. The left LED should go out, and the righe one should stay lit.


Congratulations, you're done!


Updated 2/6/2011 by arclight@gmail.com
