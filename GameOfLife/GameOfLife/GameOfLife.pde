/*
Game of life exercise:
 Rules:
 If fewer than 2 neighbours, the square dies
 Any dead cell with exactly three neighbours lives
 If 4 or more neighbours, the square dies
 
 Draw a grid 20x20 with a padding of 2 from the edge
 
 Start with the outside being static
 */
int s, offset, updateEveryXFrame;
float w, threshold;
Gameboard g;

void setup() {
  size(1000, 1000);
  threshold = 0.1;
  s = 50;
  offset = 50;
  w = (1000-2*offset)/s;
  g = new Gameboard(s);
  initGameboard();
  updateEveryXFrame = 5;
  textAlign(CENTER);
  textSize(w/2);
  
}

void draw() {
  background(0);
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      int fillColour = (g.gameboard[x][y].isAlive) ? 255 : 0;
      fill(fillColour);
      rect(offset + x*w, offset + y*w, w, w);
      int fontColour = 255 - fillColour;
      int neighbourCount = countAliveNeighbours(g.gameboard[x][y], x, y);
      fill(fontColour);
      text(str(neighbourCount), offset + w/2 + x*w, offset + 2*w/3 + y*w);
    }
  }

  if (frameCount%updateEveryXFrame == 0) {
    // init new board and copy in the values
    Gameboard next = new Gameboard(s);
    arrayCopy(g.gameboard, next.gameboard);
    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {
        updateStatus(next, x, y); //update the things in the new gameboard
      }
    }
  }
}

void updateStatus(Gameboard next, int locx, int locy) {
  int neighbourCount = countAliveNeighbours(g.gameboard[locx][locy], locx, locy);
  if (!g.gameboard[locx][locy].isAlive) { //if it's not alive
    if (neighbourCount == 3) { //check if there are exactly 3 neighbours
      next.gameboard[locx][locy].toggleLivingStatus(); //update the status in the NEW board
    }
  } else if (((neighbourCount < 2) || (neighbourCount > 3))) { //if alive, check is 1 or 4+ neighbours --> dead
    next.gameboard[locx][locy].toggleLivingStatus(); //update the status in the NEW board
  }
}



int countAliveNeighbours(Square eachSquare, int x, int y) {
  String label = eachSquare.label;
  switch(label) {
  case "TLCorner":
    return TLCornerCount();
  case "TRCorner":
    return TRCornerCount();
  case "BLCorner":
    return BLCornerCount();
  case "BRCorner":
    return BRCornerCount();
  case "LEdge":
    return LEdgeCount(x, y);
  case "REdge":
    return REdgeCount(x, y);
  case "TEdge":
    return TEdgeCount(x, y);
  case "BEdge":
    return BEdgeCount(x, y);
  case "CENTRE":
    return CentreCount(x, y);
  default:
    return 0;
  }
}


void initGameboard() {
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      boolean isAlive = (random(1) < threshold);
      PVector location = new PVector(x, y);
      String label = getLabel(location);
      print("("+x+", "+y+"): isAlive = "+isAlive+", label = "+label+'\n');
      g.gameboard[x][y] = new Square(label, isAlive);
    }
  }
}

String getLabel(PVector location) {
  if (location.x == 0) {
    if (location.y == 0) {
      return "TLCorner";
    } else if (location.y == s-1) {
      return "BLCorner";
    } else {
      return "LEdge";
    }
  } else if (location.x == s-1) {
    if (location.y == 0) {
      return "TRCorner";
    } else if (location.y == s-1) {
      return "BRCorner";
    } else {
      return "REdge";
    }
  } else if (location.y == 0) {
    return "TEdge";
  } else if (location.y == s-1) {
    return "BEdge";
  } else {
    return "CENTRE";
  }
}

int TLCornerCount() {
  int count = 0;
  Square[] pool = {g.gameboard[0][1], g.gameboard[1][0], g.gameboard[1][1]};
  for (Square eachSquare : pool) {
    if (eachSquare.isAlive) {
      count ++;
    }
  }
  return count;
}

int TRCornerCount() {
  int count = 0;
  Square[] pool = {g.gameboard[s-2][0], g.gameboard[s-2][1], g.gameboard[s-1][1]};
  for (Square eachSquare : pool) {
    if (eachSquare.isAlive) {
      count ++;
    }
  }
  return count;
}

int BLCornerCount() {
  int count = 0;
  Square[] pool = {g.gameboard[0][s-2], g.gameboard[1][s-2], g.gameboard[s-1][1]};
  for (Square eachSquare : pool) {
    if (eachSquare.isAlive) {
      count ++;
    }
  }
  return count;
}


int BRCornerCount() {
  int count = 0;
  Square[] pool = {g.gameboard[s-2][s-2], g.gameboard[s-1][s-2], g.gameboard[s-2][s-1]};
  for (Square eachSquare : pool) {
    if (eachSquare.isAlive) {
      count ++;
    }
  }
  return count;
}

int LEdgeCount(int locx, int locy) {
  int count = 0;
  for (int x = 0; x < 2; x++) {
    for (int y = -1; y < 2; y++) {
      if (g.gameboard[locx+x][locy+y].isAlive) {
        count ++;
      }
    }
  }
  if (g.gameboard[locx][locy].isAlive) {
    count --;
  }
  return count;
}

int REdgeCount(int locx, int locy) {
  int count = 0;
  for (int x = -1; x < 1; x++) {
    for (int y = -1; y < 2; y++) {
      if (g.gameboard[locx+x][locy+y].isAlive) {
        count ++;
      }
    }
  }
  if (g.gameboard[locx][locy].isAlive) {
    count --;
  }
  return count;
}



int TEdgeCount(int locx, int locy) {
  int count = 0;
  for (int x = -1; x < 2; x++) {
    for (int y = 0; y < 2; y++) {
      if (g.gameboard[locx+x][locy+y].isAlive) {
        count ++;
      }
    }
  }
  if (g.gameboard[locx][locy].isAlive) {
    count --;
  }
  return count;
}

int BEdgeCount(int locx, int locy) {
  int count = 0;
  for (int x = -1; x < 2; x++) {
    for (int y = -1; y < 1; y++) {
      if (g.gameboard[locx+x][locy+y].isAlive) {
        count ++;
      }
    }
  }
  if (g.gameboard[locx][locy].isAlive) {
    count --;
  }
  return count;
}

int CentreCount(int locx, int locy) {
  int count = 0;
  for (int x = -1; x < 2; x++) {
    for (int y = -1; y < 2; y++) {
      if (g.gameboard[locx + x][locy +y].isAlive) {
        count ++;
      }
    }
  }
  if (g.gameboard[locx][locy].isAlive) {
    count --;
  }
  return count;
}
