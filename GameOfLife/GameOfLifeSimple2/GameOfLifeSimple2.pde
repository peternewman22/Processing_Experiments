int s, offset, refreshEvery;
float w, initRate;
boolean[][] gameboard;
boolean showNeighbourCount;

void setup() {
  size(1000, 1000);
  s = 100;
  offset = 100;
  w = (1000 - 2*offset)/s;
  gameboard = new boolean[s][s];
  initGameboard();
  textAlign(CENTER);
  textSize(w/3);
  initRate = 0.2;
  showNeighbourCount = true;
  refreshEvery = 5;
}

void draw() {
  background(0);

  //draw in the board
  for (int i = 0; i < s; i++) {
    for (int j = 0; j < s; j++) {
      int fillCol = (gameboard[i][j]) ? 255 : 0;
      stroke(0);
      fill(fillCol);
      rect(offset + i*w, offset + j*w, w, w);
      
      //if showNeighbourCount true...
      if (showNeighbourCount) {
        if (((i == 0) || (i == s - 1) || (j == 0) || (j == s - 1 ))) { //if on the edge
          continue;
        } else {
          int textFillCol = (gameboard[i][j]) ? 0 : 255;
          fill(textFillCol);
          int livingNeighbourCount = countLivingNeighbours(i, j);
          text(str(livingNeighbourCount), offset + w/2 + i*w, offset + w/2 + w/6 + j*w );
        }
      }
    }
  }
  // every 100th frame
  if (frameCount%refreshEvery == 0) {
    //init new board and copy all the values over to overwrite
    boolean[][] nextBoard = new boolean[s][s];
    arrayCopy(gameboard, nextBoard); //copy over all values
    for (int i = 1; i < s - 2; i++) {
      for (int j = 1; j < s - 2; j++) {
        nextBoard[i][j] = isAliveNextRound(gameboard[i][j], i, j) ; //overwrite values
      }
    }
    gameboard = nextBoard; //overwrite gameboard
  }
}

boolean isAliveNextRound(boolean isAlive, int row, int column) {
  int livingNeighbourCount = countLivingNeighbours(row, column);
  if (!isAlive) {
    if (livingNeighbourCount == 3) {
      return true;
    } else {
      return false;
    }
  } else if (((livingNeighbourCount < 2) || (livingNeighbourCount > 3))) {
    return false;
  } else {
    return true;
  }
}

int countLivingNeighbours(int row, int column) {
  int count = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      if (gameboard[row+i][column+j]) {
        count ++;
      }
    }
  }
  if (gameboard[row][column]) {
    count --;
  }
  return count;
}

void initGameboard() {
  for (int i = 0; i < s; i++) {
    for (int j = 0; j < s; j++) {
      boolean isAlive = (random(1) < 0.1);
      gameboard[i][j] = isAlive;
      //print("The value at ("+i+", "+j+") is " + str(isAlive)+"\n");
    }
  }
}
