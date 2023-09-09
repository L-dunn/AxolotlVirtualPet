import processing.serial.*;
import cc.arduino.*;
import java.util.Random;
Arduino arduino;

public void setup() {
  size(500, 500);
  arduino = new Arduino(this, Arduino.list()[2], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}

float rot = 0; //for rotation

//drawing axolotl
void draw(){
  translate(250,250);
  float audioLvl = arduino.analogRead(4); //reads audio sensor
  float x = arduino.analogRead(5)*1.1; //reads light levels to determine how to move legs later
  float y;

  System.out.println("Light: "+x+"     "+"Audio: "+audioLvl+"   "+"rot: "+rot);

  background(#6EC0FC);

  //rotate axolotl clockwise about the center of window by a magnitude depending on the audio level if audio level exceeds 350
  //can gently blow on arduino microphone to produce higher audio level without making actual loud noises
  //the harder the blow, the fatser the axolotl spins
  if(audioLvl > 350){
    rot += (audioLvl*0.001);
  }
  rotate(rot);
 
 
  //calculates numbers used to determine how far to move legs up and down based on ligth levels
  x = (x * 0.25) + 50; 
  y = x / 10;
  
  if(x >= 110){
    x = -x * 0.25;
  }
  
  //backward layer limbs
  stroke(#F278A5);
  strokeWeight(30);
  line(-25,30,-70+(0.01*x*x),70+y);
  line(70,40,110-(0.2*x),80+y);
  
  //tail
  noStroke();
  fill(#F784AF);
  ellipse(-50,10,300,110);
  
  //body*
  noStroke();
  fill(#FAB8D0);
  ellipse(25,10,300,110);
  
  //frontward layer limbs
  stroke(#FAB8D0);
  strokeWeight(30);
  line(-35,30,-100-(0.002*x*x),70+y);
  line(40,40,30+(0.005*x*x),80+y);
  
  //backward layer gills
  fill(#F784AF);
  noStroke();
  arc(150, -30, 100, 50, -PI/4,  PI/2);
  arc(160, -10, 110, 70, 0, PI);

  //frontward layer gills
  fill(#F784AF);
  noStroke();
  arc(10, -30, 100, 50, PI/4, 5*PI/4);
  arc(0, -10, 110, 70, 0, PI);
  arc(10, 20, 100, 50, -PI/4, 3*PI/4);
  
  
  //head
  noStroke();
  fill(#FCC9DC);
  ellipse(100,0,160,120);
  ellipse(125,30,140,60);
  
  //eyes
  noStroke();
  fill(0,0,0);
  ellipse(100,15,10,20);
  ellipse(165,15,10,20);
  
  //smile
  stroke(#F784AF);
  strokeWeight(5);
  noFill();
  arc(135, 30, 30, 10, 0, PI);

}
