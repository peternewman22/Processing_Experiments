/* 
This sketch was inspired by Matt Parker's Standup Maths video: Synchronisation of Pendulums in Excel
It uses the K something model to take sine waves out of phase and, through the interaction co-efficient K,
K/N * Sum(sin(theta_j- theta_i)
*/

//Start with 3 out of phase sine waves
Wave wave1, wave2, wave3;
float[] phaseDiffs;
float yScale, offset, iterator, omega;


int arrayLength = 1000;

void setup(){
     size(1080, 720, P2D);
     phaseDiffs = new float[arrayLength];
     yScale = 100;
     offset = 40;
     iterator = 0.01;
     wave1 = new Wave(0);
     wave2 = new Wave(PI/3);
     wave3 = new Wave(2*PI/3);

     omega = 5.0;
     noFill();
     strokeWeight(2);
}

void draw(){
  background(0);
  wave1.render(color(255,0,0));
  wave2.render(color(0,255,0));
  wave3.render(color(0,0,255));
}
