#include <Servo.h>

Servo servo1,servo2;

void setup() {

  pinMode(1,OUTPUT);
  servo1.attach(9); //analog pin 0
  servo2.attach(10); //analog pin 0
  servo1.write(90);
  servo2.write(90);
  // servo1.setMaximumPulse(2200);
  //servo1.setMinimumPulse(700);


  Serial.begin(19200);
  Serial.println("Ready");

}

void loop() {

  static int v = 0 ,t = 0 ;
  if ( Serial.available())
  {
    char ch = Serial.read();
    switch(ch)
    {
    case '0'...'9':
      v = v * 10 + ch - '0';
      //t = t * 10 + ch - '0';
      break;
    case 's':
      servo1.write(v/2+45);//Y
      v = 0;
      break;
    case 'e':
      if((180-v)>120){
        v=60;
      }  
      if((180-v)<80){
        v=120;  
      }
      servo2.write(180-v);//X
      v = 0;
      break;
    }//end switch(ch)
  }//end if
}//end loop


