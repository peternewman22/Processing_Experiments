class Segment {
  PVector pos;
  float size;
  PVector orientation;
  String type;
  float phase;
  color col;
  Segment(float x, float y, float size_, PVector orientation_, String type_, float phase_, color col_) {
    type = type_;
    pos = new PVector(x, y);
    orientation = orientation_.copy();
    size = size_;
    phase = phase_;
    col = col_;
  }

  void show() {
    
    noStroke();
    fill(col);
    switch(type) {
      
      case "Body":
        ellipse(pos.x, pos.y, size, size);
        break;
      case "Head":
        ellipse(pos.x, pos.y, size, size);
        stroke(col);
        strokeWeight(5);
        pushMatrix();
          translate(pos.x, pos.y);
          rotate(orientation.heading());
          line(0, 0, 100,-40);
          line(0, 0, 100, 40);
        popMatrix();
        break;
        // draw antennae
      case "Tail":
        noStroke();
        ellipse(pos.x, pos.y, size, size);
        stroke(col);
        pushMatrix();
          translate(pos.x, pos.y);
          rotate(orientation.heading());
          line(0, 0, -100, 10);
          line(0, 0, -100, -10);
        popMatrix();
        break;
      
    }
  }
}
