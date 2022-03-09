#include p16f84a.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC


CBLOCK 0x0c
COUNT_TMP
ENDC


org 0x00
bsf STATUS,RP0
movlw 0x00
movwf TRISA
movlw 0x03
movwf TRISB
movlw b'00000110'
movwf OPTION_REG
bcf STATUS, RP0
bcf PORTA,0
bcf PORTB,2

check11
btfss PORTB, 0
goto check10
btfss PORTB, 1
goto check01
goto result11

result11
movlw d'243'
movwf TMR0
bcf INTCON, T0IF
goto start3

start3
btfss INTCON, T0IF
goto start3
movlw b'00000001'
xorwf PORTA, F
call setoutput
goto result11


check10
btfss PORTB, 1
goto check11
goto result10

result10
movlw d'236'
movwf TMR0
bcf INTCON, T0IF
goto start2

start2
btfss INTCON, T0IF
goto start2
movlw b'00000001'
xorwf PORTA, F
call setoutput
goto result10


check01
movlw d'216'
movwf TMR0
bcf INTCON, T0IF
goto start1

start1
btfss INTCON, T0IF
goto start1
movlw b'00000001'
xorwf PORTA, F
call setoutput
goto check01

setoutput
btfss PORTA,0
bcf PORTB,2
btfsc PORTA,0
bsf PORTB,2
return

end
