float r, e, a, b, t;
void setup() {
  size(1000, 1000);
  ellipseMode(RADIUS);
  a = 700;
  e = 0.5;
  t = 0;
  b = sqrt(sq(a)*(1-sq(e)));
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  //draw the sun
  fill(0xFFf9d71c);
  noStroke();
  ellipse(0,0,50,50);
  //ellipse(0, 0, a, b);
  PVector loc = getLoc();
  stroke(255);
  noFill();
  ellipse(loc.x, loc.y, 10, 10);
  popMatrix();

  t+= 0.01;
}

float getR(){
  return (a*(1-sq(e)))/(1+e*cos(t));
}

PVector getLoc() {
  return new PVector(r*cos(t), r*sin(t));
  
}
