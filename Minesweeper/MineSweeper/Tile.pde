class Tile {
  boolean isBomb;
  PVector pos;
  String label;

  Tile(PVector pos_) {
    pos = pos_.copy();
    isBomb = random(1) < 0.3; //10% chance of bomb
    label = getLabel(pos);
  }

  void display() {
    fill(0);
    if (isBomb) {
      ellipse(pos.x, pos.y, w*0.5, w*0.5);
      strokeWeight(2);
      line(pos.x, pos.y, pos.x, pos.y -w/3);
    }
  }
  
  
}
