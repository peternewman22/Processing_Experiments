/*
Involute of a circle is the path of a point being pulled tangentially out from around a circle
1. Draw circle with diam D
2. Draw a radius: keep track of where in the rotation we're up to
3. Get the line to rotate
4. Set up an array to hold the involute values

*/
float D, r, circum, angle;
ArrayList<PVector> involute_values;

void settings(){
  size(720, 720);
}

void setup(){
  D = 25;
  r = D/2;
  circum = PI*D;
  angle = 0;
  involute_values = new ArrayList<PVector>();
  
}



void draw(){
background(0);
stroke(255);
strokeWeight(1);
noFill();

float R = r+(angle/TWO_PI)*circum;
PVector onInvol = new PVector(R*cos(angle), R*sin(angle));
PVector onCirc = new PVector(r*cos(angle+PI/2), r*sin(angle+PI/2));

if (frameCount % 2 == 0){
  involute_values.add(onInvol);
}
pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, D, D);
  //line(0,0,onCirc.x, onCirc.y);
  stroke(255,200);
  line(onCirc.x,onCirc.y,onInvol.x, onInvol.y);
  stroke(255);
  beginShape();
  for (PVector loc : involute_values){
    vertex(loc.x, loc.y);
  }
  endShape();
  strokeWeight(5);
  point(onCirc.x, onCirc.y);
  point(onInvol.x, onInvol.y);
  
  
  
popMatrix();

angle += 0.01;
}
