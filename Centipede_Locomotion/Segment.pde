class Segment {
  PVector pos, leftA, rightA, leftT, rightT;
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
    leftA = PVector.fromAngle(orientation.heading() - PI/6).setMag(100);
    rightA = PVector.fromAngle(orientation.heading() + PI/6).setMag(100);
    leftT = PVector.fromAngle(orientation.heading() + PI - PI/12).setMag(100);
    rightT = PVector.fromAngle(orientation.heading() + PI + PI/12).setMag(100);
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
        
        PVector lAEnd = pos.copy().add(leftA);
        PVector rAEnd = pos.copy().add(rightA);
        line(pos.x, pos.y, lAEnd.x, lAEnd.y);
        line(pos.x, pos.y, rAEnd.x, rAEnd.y);
        
        break;
      case "Tail":
        noStroke();
        ellipse(pos.x, pos.y, size, size);
        stroke(col);
        PVector lTEnd = pos.copy().add(leftT);
        PVector rTEnd = pos.copy().add(rightT);
        line(pos.x, pos.y, lTEnd.x, lTEnd.y);
        line(pos.x, pos.y, rTEnd.x, rTEnd.y);
        break;
      
    }
  }
}
