/*

Author: Pete Newman
*/

float G;
Body[] bodies;
PVector[] stars;
int starCount;
System system;
int planetCount;
int traceSteps;


void setup(){
  size(1500, 1500);
  G = 0.2;
  starCount = 500;
  stars = new PVector[starCount];
  initStars();
  planetCount = 2;
  traceSteps = 20;
  system = new System();

  
}

void draw(){
  background(0);
  drawStars();
  system.updateSystem();
  system.showBodies();
}

void initStars(){
  for(int i = 0; i < starCount; i ++){
    stars[i] = new PVector(random(width), random(height), random(4));
  }
}

void drawStars(){
  for(PVector p : stars){
    stroke(255);
    strokeWeight(p.z);
    point(p.x, p.y);
  }
}
