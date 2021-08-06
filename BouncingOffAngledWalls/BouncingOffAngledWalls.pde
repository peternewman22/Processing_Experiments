float r;
Wall w;
Mover m;
void setup(){
  size(500, 500);
  ellipseMode(RADIUS);
  r = 10;
  w = new Wall(width/4, 0.75*height, 0.75*width, height/4);
  //m = new Mover(3*width/4, 3*height/4);
  m = new Mover(width/2, 0);
}

void draw(){
  background(0);
  w.show();
  m.update();
  //m.lookAt();
  m.show();
}
