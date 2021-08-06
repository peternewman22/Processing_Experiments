float r;
Wall w;
Mover m;
void setup(){
  size(500, 500);
  ellipseMode(RADIUS);
  r = 10;
  w = new Wall(width/4, 0.75*height, 0.75*width, height/4);
  m = new Mover(width/4, height/4);
}

void draw(){
  background(0);
  w.show();
  m.update();
  m.show();
}
