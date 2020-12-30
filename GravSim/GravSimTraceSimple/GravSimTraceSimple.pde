/*
In this experiment, we're going to try and get a simple trace going on with the following assumptions
 1. The gravitational force on the sun is negligible
 2. Interplanetary forces are negligible
 3. Planets can't collide
 */

float G;
int starCount = 500;
PVector sunPos, earthPos, earthVel;
Starfield stars;
Sun sun;
Planet earth;
int traceSteps, showEvery;
Trace trace;



void setup() {
  size(900, 900);
  stars = new Starfield();
  sunPos = new PVector(width/2, height/2);
  sun = new Sun(100000, 150, color(253, 184, 19), sunPos);
  G = 0.05;
  earthPos = new PVector(100, height/2);
  earthVel = new PVector(0, -3.5);
  showEvery = 10;
  traceSteps = showEvery*20;
  
  earth = new Planet(100, 50, earthPos, earthVel, color(0, 89, 179));
  trace = new Trace(earth);
}

void draw() {
  background(0);
  stars.drawStars();
  sun.show();
  trace.update();
  trace.show();
  //earth.update();
  //earth.show();
}
