#include <SPI.h>
#include <PN532.h>

#define SCK 13
#define MOSI 11
#define NFC_SS 4
#define MISO 12

PN532 nfc(SCK, MISO, MOSI, NFC_SS);

void setup(void) {
    Serial.begin(57600);
    Serial.println("Hello!");

    nfc.begin();

    uint32_t versiondata = nfc.getFirmwareVersion();
    if (! versiondata) {
        Serial.print("Didn't find PN53x board");
        while (1); // halt
    }
    // Got ok data, print it out!
    Serial.print("Found chip PN5"); Serial.println((versiondata>>24) & 0xFF, HEX);
    Serial.print("Firmware ver. "); Serial.print((versiondata>>16) & 0xFF, DEC);
    Serial.print('.'); Serial.println((versiondata>>8) & 0xFF, DEC);
    Serial.print("Supports "); Serial.println(versiondata & 0xFF, HEX);

    // configure board to read RFID tags and cards
    nfc.SAMConfig();
}


void loop(void) {
    uint32_t id;
    // look for MiFare type cards
    id = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A);

    if (id != 0) {
        Serial.print("Read card #"); Serial.println(id);
    }
}


