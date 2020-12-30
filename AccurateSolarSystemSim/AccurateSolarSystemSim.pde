/*
This project uses the mathematics of the following link to get near exact elliptical orbits of the planets in our solar system
https://www.hilarispublisher.com/open-access/mathematically-describing-planetary-orbits-in-two-dimensions-2168-9679-1000414.pdf

Accurate in the eccentricity of the orbits. Not in relative distances and sizes of the planets.
Orbital parametric equation: r = (b^2)/(a-c*cos(theta))

Note: this is NOT a physics simulation. Hopefuly this can be a stepping stone to rederiving the initial states to recreate our solar system
*/

float theta, sunRadius, AU;
System system;


void setup(){
  size(750, 750);
  initSystem();
  AU = 200;
  theta = 0;
  system = new System();
  initSystem();
}

void draw(){
  background(0);
  drawSun();
  system.show();
 
  
  theta += 0.01;
}

void drawSun(){
  fill(253, 184, 19);
  ellipse(width/2, height/2, 100, 100);
}

void initSystem(){
  //earth
  system.planets.add(new Planet(1.0027, 1.0025, 0.0167,50,color(0, 47, 75)));
  //mars
  system.planets.add(new Planet(1.5241, 1.0025, 0.1424,50,color(188, 42, 58)));
}
