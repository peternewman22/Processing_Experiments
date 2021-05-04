class Segment {
  // Note: Each segment has a leg that is drawn from 
  PVector pos, leftA, rightA, leftT, rightT, shoulderL, shoulderR;
  PVector lAEnd, rAEnd, lLegEnd, rLegEnd;
  float size, legLength, antennaeLength;
  PVector orientation;
  String type;
  float phase, angle;
  color col;
  Segment(float x, float y, float size_, PVector orientation_, String type_, float phase_, color col_) {
    type = type_;
    pos = new PVector(x, y);
    orientation = orientation_.copy();
    size = size_;
    phase = phase_;
    angle = 0;
    legLength = 80;
    antennaeLength = 100;
    col = col_;
    shoulderL = PVector.fromAngle(orientation.heading() - PI/2).setMag(size/2);
    shoulderR = PVector.fromAngle(orientation.heading() + PI/2).setMag(size/2);
    leftA = PVector.fromAngle(orientation.heading() - PI/6).setMag(antennaeLength);
    rightA = PVector.fromAngle(orientation.heading() + PI/6).setMag(antennaeLength);
    leftT = PVector.fromAngle(orientation.heading() + PI - PI/12).setMag(antennaeLength);
    rightT = PVector.fromAngle(orientation.heading() + PI + PI/12).setMag(antennaeLength);
    lAEnd = new PVector(0,0);
    rAEnd = new PVector(0,0);
    lLegEnd = new PVector(0,0);
    rLegEnd = new PVector(0,0);
  }
  
  void update(){
    // finds the end point of the L and R leg if it starts at the shoulder
    lAEnd.set(pos.copy().add(leftA));
    rAEnd.set(pos.copy().add(rightA));
    lLegEnd.set(pos.copy().add(shoulderL).add(new PVector(legLength*cos(angle), legLength*sin(angle))));
    lLegEnd.set(pos.copy().add(shoulderR).add(new PVector(legLength*cos(angle), legLength*sin(angle))));
  }

  void show() {
    
    noStroke();
    fill(col);
    switch(type) {
      
      case "Body":
        ellipse(pos.x, pos.y, size, size);
        stroke(255,0,0);
        strokeWeight(5);
        line(shoulderL.x,shoulderL.y,lLegEnd.x,lLegEnd.y);
        line(shoulderR.x,shoulderR.y,rLegEnd.x,rLegEnd.y);
        break;
      case "Head":
        ellipse(pos.x, pos.y, size, size);
        stroke(col);
        strokeWeight(5);
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
