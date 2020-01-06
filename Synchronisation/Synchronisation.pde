/* 
This sketch was inspired by Matt Parker's Standup Maths video: Synchronisation of Pendulums in Excel
It uses the K something model to take sine waves out of phase and, through the interaction co-efficient K,
K/N * Sum(sin(theta_j- theta_i)
*/

//Start with 3 out of phase sine waves

float[] phaseDiffs;
float yScale, offset, iterator, omega;
PVector[] wave1, wave2, wave3;

int arrayLength = 1000;

void setup(){
     size(1080, 720, P2D);
     phaseDiffs = new float[arrayLength];
     yScale = 100;
     offset = 40;
     iterator = 0.01;
     wave1 = generatePoints(0);
     wave2 = generatePoints(PI/3);
     wave3 = generatePoints(2*PI/3);
     omega = 5.0;
     noFill();
     strokeWeight(2);
}

void draw(){
  background(0);
  pushMatrix();
  translate(0, height/2);
  stroke(255,0,0);
  render(wave1);
  stroke(0,255,0);
  render(wave2);
  stroke(0,0,255);
  render(wave3);
  popMatrix();  
}

void render(PVector[] pointArray){
  beginShape();
  for(int i = 0; i < pointArray.length; i++){
    vertex(pointArray[i].x, pointArray[i].y);
  }
  endShape();
}

PVector[] generatePoints(float phaseDiff){
  //init pointArray
  PVector[] pointArray = new PVector[arrayLength];
  
  // store all the points in the point array
    for(int i = 0; i < pointArray.length; i++){
      //p = x, sin(x+offset)
    PVector p = new PVector(i+offset, yScale*sin(5*i*iterator + phaseDiff));
    pointArray[i] = p;
  }
  
  return pointArray;
}
