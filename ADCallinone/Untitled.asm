#include P16F84A.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

org 0x00
goto MAIN

org 0x04
goto ISR

MAIN
bsf STATUS,RP0
movlw 0x10
movwf TRISA
movlw 0x00
movwf TRISB
bcf STATUS, RP0

clock
bsf PORTA, 0
nop
nop
bcf PORTA, 0
goto clock

LOOP goto LOOP ;  wait for interrupt
ISR

Automate
bsf PORTA, 2 ;start/ale = 1
bcf PORTA, 2 ;start/ale = 0
goto CHECKOFF

CHECKOFF
btfsc PORTA, 4
goto CHECKOFF

CHECKON
btfss PORTA, 4 ;EOC 
goto CHECKON
bsf PORTA, 3 ;OUTPUT ENABLE = 1
bcf PORTA, 3 ;OUTPUT ENABLE = 0
RETFIE
goto Automate

end