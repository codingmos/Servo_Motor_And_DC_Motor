{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 6.3.9600}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang9 int ON = 1;\par
 unsigned servoPOTT;\par
 unsigned int pot;\par
 unsigned int timer_value;\par
 unsigned int servoPOT;\par
 unsigned int error;\par
void main() \{\par
       trisa = 0xff ;\par
       trisb = 0x00 ;\par
       ADCON1 = 0x80;\par
       option_reg= 0x80 ;\par
\par
       while (1)\{\par
        pot = Adc_Read(0);\par
       timer_value = pot/4;\par
       portb.f3 = 1;\par
       tmr0 = 255- timer_value;\par
       while(INTCON.T0IF != 1)\par
       \{\}\par
          portb.f3 = 0;\par
          INTCON.T0IF = 0;\par
          tmr0 = timer_value;\par
          while(INTCON.T0IF!=1)\par
          \{\}\par
          INTCON.T0IF =0;\par
       \}\par
\}\par
}
 