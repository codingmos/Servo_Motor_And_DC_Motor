#include p16f84a.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

CBLOCK 0x0c
       COUNT_I
       COUNT_J
ENDC


org 0x00
bsf STATUS, 5
movlw 0x00
movwf TRISB
movlw 0xff
movwf TRISA
bcf STATUS, 5
bcf PORTB, 7

start
btfss PORTA, 2
goto checkturnoff
btfsc PORTA, 3
goto start
call delay
btfss PORTA, 2
goto start
btfsc PORTA, 3
goto start
bsf PORTB, 7
goto start

checkturnoff
btfss PORTA, 3
goto start
call delay
btfss PORTA, 3
goto start
bcf PORTB, 7 
goto start

delay
movlw 200
movwf COUNT_I
LOOP_I
movlw 166
movwf COUNT_J
LOOP_J
decfsz COUNT_J,F
goto LOOP_J
decfsz COUNT_I,F
goto LOOP_I
return


end



