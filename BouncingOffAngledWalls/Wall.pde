class Wall {
  PVector start, end, ab;
  float a;
  int ix;
  Wall(float startX, float startY, float endX, float endY, int ix_) {
    start = new PVector(startX, startY);
    end = new PVector(endX, endY);
    ab = PVector.sub(end, start);
    a = ab.heading();
    ix = ix_;
  }

  void show() {
    stroke(255);
    strokeWeight(5);
    line(start.x, start.y, end.x, end.y);
  }
}
