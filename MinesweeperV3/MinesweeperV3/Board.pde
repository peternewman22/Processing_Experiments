class Board {
  Tile[][] board;

  Board(int s) {
    board = new Tile[s][s];

    //fill the board with tiles
    initBoard();
    for(int locx = 0; locx < s; locx++){
      for(int locy = 0; locy < s; locy++){
        String l = board[locx][locy].label;
        println("Checking "+l+" at ("+locx+", "+locy+")");
        countByLabel(l, locx, locy);
      }
    }
  }

  void initBoard() {
    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {
        board[x][y] = new Tile(x, y);
      }
    }
  }



  void show() {
    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {
        board[x][y].show();
      }
    }
  }

  int countBombs(int locx, int locy, int minX, int maxX, int minY, int maxY) {
    print("Testing "+board[locx][locy].label +" @ ("+locx+", "+locy+"):\n");
    int count = 0;
    for (int i = minX; i < maxX + 1; i++) {
      for (int j = minY; j < maxY + 1; j++) {
        println("\tx = " + i +", " + "y= "+j+" i.e. checking ("+ (locx+i) +", "+(locy+j)+")");
      }
    }
    return count;
    
  }

  int countByLabel(String label, int locx, int locy) {
    switch(label) {
    case "TLCorner":
      countBombs(locx, locy, 0, 1, 0, 1);
    case "TRCorner":
      countBombs(locx, locy, -1, 0, 0, 1);
    case "BLCorner":
      countBombs(locx, locy, 0, 1, 0, 1);
    case "BRCorner":
      countBombs(locx, locy, -1, 0, -1, 0);
    case "LEdge":
      countBombs(locx, locy, 0, 1, -1, 1);
    case "REdge":
      countBombs(locx, locy, -1, 0, -1, 1);
    case "TEdge":
      countBombs(locx, locy, -1, 1, 0, 1);
    case "BEdge":
      countBombs(locx, locy, -1, 1, -1, 0);
    case "Centre":
      countBombs(locx, locy, -1, 1, -1, 1);
    default:
      return -1;
    }
  }
}
