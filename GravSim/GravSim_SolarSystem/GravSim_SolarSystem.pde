Body[] bodies;
int bodyCount;
float earthMass, earthDiam, AU;

void setup(){
  size(750, 750);
  bodyCount = 2;
  bodies = new Body[bodyCount];
  earthMass = 100;
  earthDiam = 10;
  AU = 
  initBodies();

}

void draw(){
  background(0);
}

void initBodies(){
  // Sun
  body[0] = new Body(330000*earthMass,
  body[1] = new Body(earthMass,
}
