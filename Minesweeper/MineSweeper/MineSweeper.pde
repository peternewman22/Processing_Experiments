float w, offset;
int s;
Tile[][] board;
boolean revealAll;


void setup() {
  size(1000, 1000);
  s = 20;
  offset = 200;
  w = (width - offset)/s;
  board = new Tile[s][s];
  fill(255, 200);
  revealAll = true;

  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      board[x][y] = new Tile(new PVector(offset/2 + x*w + w/2, offset/2 + y*w + w/2)); //store the tile
    }
  }
}

void draw() {
  background(0);
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      fill(255, 200);
      strokeWeight(1);
      rect(offset/2 + x*w, offset/2 + y*w, w, w);
      board[x][y].display();
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
