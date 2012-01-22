/*

 Udp NTP Client
 
 Get the time from a Network Time Protocol (NTP) time server
 Demonstrates use of UDP sendPacket and ReceivePacket 
 For more on NTP time servers and the messages needed to communicate with them, 
 see http://en.wikipedia.org/wiki/Network_Time_Protocol
 
 created 4 Sep 2010 
 by Michael Margolis
 modified 17 Sep 2010
 by Tom Igoe
 
 This code is in the public domain.

 */

#include <SPI.h>         
#include <Ethernet.h>
#include <Udp.h>


#include <PN532.h>

// Enter a MAC address and IP address for your controller below.
// The IP address will be dependent on your local network:
uint8_t mac[] = {  
  0x90, 0xA2, 0xDA, 0x00, 0x3F, 0x78 };
uint8_t ip[] = { 
  10,0,1,15 };


unsigned int localPort = 8888;      // local port to listen for UDP packets

uint8_t timeServer[] = { 
  216, 171, 124, 36}; // NTP server

const int NTP_PACKET_SIZE= 48; // NTP time stamp is in the first 48 uint8_ts of the message

uint8_t packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets 

#define SCK 13
#define MOSI 11
#define NFC_SS 5
#define MISO 12

PN532 nfc(SCK, MISO, MOSI, NFC_SS);

void setup() 
{
  Serial.begin(57600);
  Serial.println("Setup starting");
  pinMode(NFC_SS, OUTPUT);
  digitalWrite(NFC_SS, HIGH); //deselect

  // TODO this is just temp until nfc.begin works
  //pinMode(NFC_SS, OUTPUT);
  //digitalWrite(NFC_SS, HIGH); //deselect
  // start Ethernet and UDP
  Ethernet.begin(mac,ip);
  Serial.println("Ethernet begin complete");
  Udp.begin(localPort);
  Serial.println("Udp begin complete");

  //nfc.begin();
  Serial.println("NFC begin complete");

  Serial.println("Setup complete");

}

void loop()
{
  Serial.println("Start loop");
  // Ethernet.select();
  Serial.println("Ethernet selected");
  sendNTPpacket(timeServer); // send an NTP packet to a time server
  Serial.println("Packet Sent");

    // wait to see if a reply is available
  delay(1000);
  if ( Udp.available() ) {  
      Serial.println("UDP Packet received");
      Udp.readPacket(packetBuffer,NTP_PACKET_SIZE);  // read the packet into the buffer

    //the timestamp starts at uint8_t 40 of the received packet and is four uint8_ts,
    // or two words, long. First, extract the two words:

    unsigned long highWord = word(packetBuffer[40], packetBuffer[41]);
    unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);  
    // combine the four uint8_ts (two words) into a long integer
    // this is NTP time (seconds since Jan 1 1900):
    unsigned long secsSince1900 = highWord << 16 | lowWord;  
    Serial.print("Seconds since Jan 1 1900 = " );
    Serial.println(secsSince1900);               

    // now convert NTP time into everyday time:
    Serial.print("Unix time = ");
    // Unix time starts on Jan 1 1970. In seconds, that's 2208988800:
    const unsigned long seventyYears = 2208988800UL;     
    // subtract seventy years:
    unsigned long epoch = secsSince1900 - seventyYears;  
    // print Unix time:
    Serial.println(epoch);                               


    // print the hour, minute and second:
    Serial.print("The UTC time is ");       // UTC is the time at Greenwich Meridian (GMT)
    Serial.print((epoch  % 86400L) / 3600); // print the hour (86400 equals secs per day)
    Serial.print(':');  
    Serial.print((epoch  % 3600) / 60); // print the minute (3600 equals secs per minute)
    Serial.print(':'); 
    Serial.println(epoch %60); // print the second
  }
  else
  {
    Serial.println("No reply from time server");
  }
  // wait thirty seconds before asking for the time again
  delay(30000); 
}

// send an NTP request to the time server at the given address 
unsigned long sendNTPpacket(uint8_t *address)
{
  // set all uint8_ts in the buffer to 0
  memset(packetBuffer, 0, NTP_PACKET_SIZE); 
  // Initialize values needed to form NTP request
  // (see URL above for details on the packets)
  packetBuffer[0] = 0b11100011;   // LI, Version, Mode
  packetBuffer[1] = 0;     // Stratum, or type of clock
  packetBuffer[2] = 6;     // Polling Interval
  packetBuffer[3] = 0xEC;  // Peer Clock Precision
  // 8 uint8_ts of zero for Root Delay & Root Dispersion
  packetBuffer[12]  = 49; 
  packetBuffer[13]  = 0x4E;
  packetBuffer[14]  = 49;
  packetBuffer[15]  = 52;

  // all NTP fields have been given values, now
  // you can send a packet requesting a timestamp: 		   
  Udp.sendPacket( packetBuffer,NTP_PACKET_SIZE,  address, 123); //NTP requests are to port 123
}










