float a, c, e, t;
ArrayList<PVector> trace;

void setup() {
  size(1000, 1000);
  e = 0.9;
  a = 300;
  c = a*e;
  t = 0;
  trace = new ArrayList<PVector>();
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  
  for(PVector eachLoc : trace){
    fill(255, 255, 255, 100);
    ellipse(eachLoc.x, eachLoc.y, 25, 25);
  }
  
  float r = (a*(1-sq(e)))/(1+e*cos(t));
  PVector loc = new PVector(c+r*cos(t), r*sin(t));
  fill(255);
  ellipse(0, 0, 100, 100);
  ellipse(loc.x, loc.y, 25, 25);
  
  if(frameCount%15 == 0){
    trace.add(loc);
  }
  
  

  popMatrix();
  t+=0.02;
}
