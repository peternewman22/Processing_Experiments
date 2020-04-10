float offset, w;
int s;
Tile[][] board;

void setup() {
  size(1500, 1500);
  s = 20;
  offset = 100;
  w = (width - 2*offset)/s;
  board = new Tile[s][s];
  //init board
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      board[x][y] = new Tile(new PVector(x, y));
      //print("("+x+", "+y+") : Label  = " + board[x][y].label+"\n");
    }
  }
  //count bombs
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      if (board[x][y].label == "Centre") {
        board[x][y].surroundingBombs = countByLabel(board[x][y]);
      }
    }
  }
  textSize(w);
  textAlign(CENTER);
}

void draw() {
  background(0);
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      board[x][y].display();
    }
  }
  fill(255);
  text("MINESWEEPER", 100, 100);
}

int countBombs(int locx, int locy, int xmin, int xmax, int ymin, int ymax) {
  int count = 0;
  if (!board[locx][locy].isBomb) {
    for (int x = xmin; x <= xmax; x++) {
      for (int y = ymin; y <= ymax; y++) {
        if (board[locx + x][locy + y].isBomb) {
          count ++;
        }
      }
    } 
    return count;
  } else {
    return -1;
  }
}

int countByLabel(Tile t) {
  String label = t.label;
  int locx = int(t.pos.x);
  int locy = int(t.pos.y);
  switch(label) {
  case "TLCorner":
    countBombs(locx, locy, 0, 1, 0, 1);
  case "BLCorner":
    countBombs(locx, locy, 0, 1, -1, 0);
  case "TRCorner":
    countBombs(locx, locy, -1, 0, 0, 1);
  case "BRCorner":
    countBombs(locx, locy, -1, 0, -1, 0);
  case "LEdge":
    countBombs(locx, locy, 0, 1, -1, 1);
  case "TEdge":
    countBombs(locx, locy, -1, 1, 0, 1);
  case "BEdge":
    countBombs(locx, locy, -1, 1, -1, 0);
  case "REdge":
    countBombs(locx, locy, -1, 0, -1, 1);
  case "Centre":
    countBombs(locx, locy, -1, 1, -1, 1);
  default:
    return 0;
  }
}

String getLabel(PVector pos) {
  if (pos.x == 0) {
    if (pos.y == 0) {
      return "TLCorner";
    } else if (pos.y == s-1) {
      return "BLCorner";
    } else {
      return "LEdge";
    }
  } else if (pos.x == s-1) {
    if (pos.y == 0) {
      return "TRCorner";
    } else if (pos.y == s-1) {
      return "BRCorner";
    } else {
      return "REdge";
    }
  } else if (pos.y == 0) {
    return "TEdge";
  } else if (pos.y == s-1) {
    return "BEdge";
  } else {
    return "Centre";
  }
}
