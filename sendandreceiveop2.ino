String incomingString;
float dato;
float y;

void setup(){
  // Initialize serial port
  Serial.begin(9600);
  Serial.setTimeout(3);
}

void loop(){
  if (Serial.available() > 0) {
    incomingString = Serial.readString();
    dato=incomingString.toFloat(); 
    y=sin(dato); 
    //delay(100);
    Serial.println(y);
  }
}
