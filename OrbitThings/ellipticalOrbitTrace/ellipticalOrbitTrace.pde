float t, a, e, c;
ArrayList<PVector> trace;
int traceNumber, eachFrame;

void setup() {
  size(1000, 1000);
  t = 0;
  e = 0.8;
  a = 300;
  c = e*a;
  traceNumber = 10;
  trace = new ArrayList<PVector>();
  eachFrame = 30;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  float r = (a*(1-sq(e)))/(1+e*cos(t));
  PVector loc = new PVector(c + r*cos(t), r*sin(t));
  noStroke();

  //draw the sun
  fill(0xFFf9d71c);
  ellipse(0, 0, 100, 100);

  //draw the planet
  fill(255);
  ellipse(loc.x, loc.y, 50, 50);

  //store that location on mod eachFrame
  if (frameCount%eachFrame == 0) {
    trace.add(loc);
  }

  //draw the planets
  if (trace.size() > 1) {
    noStroke();
    float step = 0;
    for (int i = trace.size()-1; i > 0; i--) {
      fill(255 - step*255/10);
      ellipse(trace.get(i).x, trace.get(i).y, 50, 50);
      step ++;
    }
  }
  if(trace.size() > 10){
    trace.remove(10);
  }
  t+= 0.01;

  popMatrix();
}
