
#include <Servo.h>
Servo myservo; 

int photocellPin = 0;     // the cell and 10K pulldown are connected to a0
int photocellReading;     // the analog reading from the sensor divider


void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);   
  myservo.attach(9);
}
 
void loop(void) {
  photocellReading = analogRead(photocellPin);  
 
  Serial.print("Analog reading = ");
  Serial.println(photocellReading);     // the raw analog reading
 
   
  delay(100);
  
  if (photocellReading > 400) {
     myservo.write(0);
    delay(100);
    myservo.write(180);
    delay(1000);
  }
  
}
