int offset, s;
float w;
Board board;
void setup() {
  size(1000, 1000);
  s = 5;
  offset = 100;
  w = (width-2*offset)/s;
  board = new Board(s);
}

void draw() {
  background(0);
  board.show();
}

String getLabel(int x, int y) {
  if (x == 0) {
    if (y == 0) {
      return "TLCorner";
    } else if (y == s - 1) {
      return "BLCorner";
    } else {
      return "LEdge";
    }
  } else if (x == s-1) {
    if (y == 0) {
      return "TRCorner";
    } else if (y == s-1) {
      return "BRCorner";
    } else {
      return "REdge";
    }
  } else if (y == 0) {
    return "TEdge";
  } else if (y == s-1) {
    return "BEdge";
  } else {
    return "Centre";
  }
}
