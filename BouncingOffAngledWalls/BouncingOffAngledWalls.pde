float r;

Mover m;
Wall[] walls;
void setup(){
  size(500, 500);
  ellipseMode(RADIUS);
  r = 10;

  walls = new Wall[3];
  walls[0] = new Wall(width/4, 0.75*height, 0.75*width, height/2,0);
  walls[1] = new Wall(width/4, 0, width/4, height,1);
  walls[2] = new Wall(width/2+10, 0, width, height/2,2);
  //m = new Mover(3*width/4, 3*height/4);
  m = new Mover(width/2, 0);
}

void draw(){
  background(0);
  for(Wall w: walls){
    w.show();
  }
  m.update();
  //m.lookAt();
  m.show();
}
