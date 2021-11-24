// Declare variables
String incomingString;
float dato;
float F,m=1,b=1,k=0.2;
float x1=0,x2=0,T=0.0311;
void setup(){
  // Initialize serial port
  Serial.begin(9600);
  Serial.setTimeout(3);
}

void loop(){
  if (Serial.available() > 0){
    incomingString = Serial.readString();
    dato=incomingString.toFloat(); 
    F=10*sin(dato); 
    x1=x1+T*x2;
    x2=x2+T*(-(k/m)*x1-(b/m)*x2+F/m);
    Serial.println(x1);
  }
}
