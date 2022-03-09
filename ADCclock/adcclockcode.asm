#include P16F84A.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

org 0x00
bsf STATUS,RP0
movlw 0xff
movwf TRISA
movlw 0x00
movwf TRISB
bcf STATUS, RP0
bsf PORTB, 4


Clock
bsf PORTB, 4
nop
nop
bcf PORTB, 4
goto Clock

end