#include P16F84A.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

org 0x00
bsf STATUS,RP0
movlw 0xff
movwf TRISA
movlw 0x00
movwf TRISB
bcf STATUS, RP0
bcf PORTB, 1
bcf PORTB, 2
bcf PORTB, 3

Automate
bsf PORTB, 2 ;start/ale = 1
nop
bcf PORTB, 2 ;start/ale = 0
goto CHECKOFF

CHECKOFF
btfsc PORTA, 0 ;EOC OFF
goto CHECKOFF
goto CHECKON

CHECKON
btfss PORTA, 0 ;EOC ON
goto CHECKON
bsf PORTB, 3 ;OUTPUT ENABLE = 0
bsf PORTB, 1 ;DOUBLE CHECK CODE IS WORKING WELL
bcf PORTB, 3 ;OUTPUT ENABLE = 1
goto Automate

end