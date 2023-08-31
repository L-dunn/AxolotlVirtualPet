import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

public void setup() {
  size(500, 500);
  arduino = new Arduino(this, Arduino.list()[1], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}

//drawing axolotl
void draw(){
  float x = arduino.analogRead(5)*1.1;
  float y;
  background(#6EC0FC);
  System.out.println(x);
  x = (x * 0.25) + 50; 
  y = x / 10;
  
  if(x >= 110){
    x = -x * 0.25;
  }
  
  //backward layer limbs
  stroke(#F278A5);
  strokeWeight(30);
  line(225,280,180+(0.01*x*x),320+y);
  line(320,290,360-(0.2*x),330+y);
  
  //tail
  noStroke();
  fill(#F784AF);
  ellipse(200,260,300,110);
  
  //body
  noStroke();
  fill(#FAB8D0);
  ellipse(275,260,300,110);
  
  //frontward layer limbs
  stroke(#FAB8D0);
  strokeWeight(30);
  line(215,280,150+(0.005*x*x),320+y);
  line(290,290,280+(0.005*x*x),330+y);
  
  //backward layer gills
  fill(#F784AF);
  noStroke();
  arc(400, 220, 100, 50, -PI/4,  PI/2);
  arc(410, 240, 110, 70, 0, PI);

  //frontward layer gills
  fill(#F784AF);
  noStroke();
  arc(260, 220, 100, 50, PI/4, 5*PI/4);
  arc(250, 240, 110, 70, 0, PI);
  arc(260, 270, 100, 50, -PI/4, 3*PI/4);
  
  
  //head
  noStroke();
  fill(#FCC9DC);
  ellipse(350,250,160,120);
  ellipse(375,280,140,60);
  
  //eyes
  noStroke();
  fill(0,0,0);
  ellipse(350,265,10,20);
  ellipse(415,265,10,20);
  
  //smile
  stroke(#F784AF);
  strokeWeight(5);
  noFill();
  arc(385, 280, 30, 10, 0, PI);
}
