#include p16f84a.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

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
movlw d'243'
movwf TMR0
bcf INTCON, T0IF
goto start

check10
btfss PORTB, 1
goto autoreset
movlw d'236'
movwf TMR0
bcf INTCON, T0IF
goto start

check01
movlw d'216'
movwf TMR0
bcf INTCON, T0IF
goto start

start
btfss INTCON, T0IF
goto start
movlw b'00000001'
xorwf PORTA, F
call setoutput
goto check11

setoutput
btfss PORTA,0
bcf PORTB,2
btfsc PORTA,0
bsf PORTB,2
return

autoreset
bcf PORTA,0
bcf PORTB,2
goto check11

end
