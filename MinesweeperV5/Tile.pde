class Tile {
  boolean isBomb, isRevealed;
  int locx, locy;
  int neighbourCount;
  int tileState;

  Tile(int locx_, int locy_) {
    locx = locx_;
    locy = locy_;
    isBomb = random(1) < 0.25;
    isRevealed = false;
    tileState = 1;
  }

  void show() {
    fill(255);
    rect(locx*w, locy*w, w, w);
    if (isBomb) {
      fill(0);
      ellipse(locx*w + w/2, locy*w + w/2, w*0.6, w*0.6);
    } else {
      if(neighbourCount > 0){
        fill(0);
        text(neighbourCount, locx*w + w/2, locy*w + w*0.6);
      }
    }
    
  }

  void countNeighbours() {
    if (isBomb) {
      neighbourCount = -1;
    } else {
      int count = 0;
      for (int xoff = -1; xoff < 2; xoff++) {
        for (int yoff = -1; yoff < 2; yoff++) {
          int i = locx + xoff;
          int j = locy + yoff;
          if ((i > -1) && (i < s) && (j > -1) && (j < s)) {
            if (gb.board[i][j].isBomb) {
              count ++;
            }
          }
        }
      }
      neighbourCount = count;
    }
  }
  
  void cycleTile(){
    tileState ++;
    if(tileState > 4){
      tileState = 1;
    }
  }
}
