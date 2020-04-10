int s, offset;
float w;
Board gameboard;
void setup(){
  size(1500, 1500);
  offset = 100;
  s = 20;
  w = (width-2*offset)/s;
  gameboard = new Board();
  gameboard.updateBombCount();
  textAlign(CENTER);
  textSize(w/2);
}

void draw(){
  background(0);
  gameboard.show();
  
}

void mousePressed(){
  if((mouseX > offset) && (mouseY > offset) && (mouseX < width-offset) && (mouseY < height - offset)){
    //then we're on the board
    
    gameboard.board[x][y].toggleIsRevealed();
  }
}
