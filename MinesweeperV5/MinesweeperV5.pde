int s;
float w;
Gameboard gb;
void setup(){
  size(1000, 1000);
  s = 20;
  w = width/s;
  gb = new Gameboard();
  gb.updateNeighbourCount();
  textSize(w*0.4);
  textAlign(CENTER);
}

void draw(){
  background(0);
  gb.show();
}

void mousePressed(){
  int row = int(mouseY/w);
  int col = int(mouseX/w);
  gb.board.
}
