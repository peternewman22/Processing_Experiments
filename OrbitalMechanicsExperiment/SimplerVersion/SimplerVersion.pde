Attractor attractor;
float G;
Mover mover;


void setup(){
  size(1000, 1000);
  G = 50;
  mover = new Mover(200, new PVector(width*0.9, height/2), new PVector(0,0), 50);
  attractor = new Attractor(200, new PVector(width/2, height/2));
}

void draw(){
  background(0,5);
  text(attractor.loc.x, 100, 100);
  attractor.attract(mover);
  attractor.show();
  mover.update();
  mover.show();
}
