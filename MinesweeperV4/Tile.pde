class Tile {
  boolean isRevealed, isBomb;
  int locx, locy;
  int nearbyBombs; 
  Tile(int locx_, int locy_) {
    locx = locx_;
    locy = locy_;
    isRevealed = true;
    isBomb = random(1) < 0.25;
  }

  void show() {
    fill(255, 200);
    stroke(0);
    rect(offset + locx*w, offset + locy*w, w, w);
    if (isRevealed) {
      if (isBomb) {
        fill(0);
        ellipse(offset + locx*w + w/2, offset + locy*w + w/2, w*0.6, w*0.6);
      }
      if (nearbyBombs > 0) {
        fill(0);
        text(nearbyBombs, offset + locx*w + w/2, offset + locy*w + w*0.75);
      }
    }
  }

  void countBombs() {
    if (isBomb) {
      nearbyBombs = -1;
    } else {
      int count = 0;
      for (int xoff = -1; xoff < 2; xoff++) {
        for (int yoff = -1; yoff < 2; yoff++) {
          int i = locx + xoff;
          int j = locy + yoff;
          print("testing (" + i + ","+j+")\n"); 
          if ((i > -1) && (i < s) && (j > -1) && (j < s)) { //i.e. still in the grid
            print("valid coordinates! Proceeding...");
            Tile neighbour = gameboard.board[i][j];
            if (neighbour.isBomb) {
              count++;
            }
          }
        }
      }
      nearbyBombs = count;
    }
  }

  void toggleIsRevealed() {
    isRevealed = !isRevealed;
  }
}
