#include P16F84A.inc
__CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

CBLOCK 0x0c
       COUNT_LED2
       COUNT_I
       COUNT_J
ENDC

org 0x00
bsf STATUS,RP0
movlw 0x00
movwf TRISA
movlw 0x81
movwf TRISB
movlw 0x05
movwf COUNT_LED2
bcf STATUS, RP0

 
bcf PORTA, 1 ;added
;bcf PORTA, 2
;bcf PORTB, 6
;bcf PORTB, 5
;bcf PORTB, 4
;bcf PORTB, 3
;bcf PORTB, 2
;bcf PORTB, 1


start
bcf PORTA, 0 ; added
;bcf PORTA, 3
;bcf PORTA, 4

begin
btfss PORTB, 0 ;btfss PORTB, 7
call Delay
btfss PORTB, 0 ;btfss PORTB, 7 
goto begin
bsf PORTA, 0
;bsf PORTA, 1
;bsf PORTA, 3
;bsf PORTA, 4
;bsf PORTB, 6
;bsf PORTB, 5
;bsf PORTB, 4
;bsf PORTB, 3
;bsf PORTB, 2
;bsf PORTB, 1
;bsf PORTB, 0

wait
btfsc PORTB, 0
;btfsc PORTB, 7
goto wait

decfsz COUNT_LED2
goto start
bsf PORTA, 1
;bsf PORTA, 2
goto start

Delay
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
