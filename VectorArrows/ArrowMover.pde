class ArrowMover{
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  ArrowMover(float start_x, float start_y){
    loc = new PVector(start_x, start_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void drawArrow(float x0, float y0, float x1, float y1, float beginHeadSize, float endHeadSize, boolean filled) {

    PVector d = new PVector(x1 - x0, y1 - y0);
    d.normalize();
    
    float coeff = 1.5;
    
    strokeCap(SQUARE);
    
    line(x0+d.x*beginHeadSize*coeff/(filled?1.0f:1.75f), 
          y0+d.y*beginHeadSize*coeff/(filled?1.0f:1.75f), 
          x1-d.x*endHeadSize*coeff/(filled?1.0f:1.75f), 
          y1-d.y*endHeadSize*coeff/(filled?1.0f:1.75f));
    
    float angle = atan2(d.y, d.x);
    
    if (filled) {
      // begin head
      pushMatrix();
      translate(x0, y0);
      rotate(angle+PI);
      triangle(-beginHeadSize*coeff, -beginHeadSize, 
               -beginHeadSize*coeff, beginHeadSize, 
               0, 0);
      popMatrix();
      // end head
      pushMatrix();
      translate(x1, y1);
      rotate(angle);
      triangle(-endHeadSize*coeff, -endHeadSize, 
               -endHeadSize*coeff, endHeadSize, 
               0, 0);
      popMatrix();
    } 
    else {
      // begin head
      pushMatrix();
      translate(x0, y0);
      rotate(angle+PI);
      strokeCap(ROUND);
      line(-beginHeadSize*coeff, -beginHeadSize, 0, 0);
      line(-beginHeadSize*coeff, beginHeadSize, 0, 0);
      popMatrix();
      // end head
      pushMatrix();
      translate(x1, y1);
      rotate(angle);
      strokeCap(ROUND);
      line(-endHeadSize*coeff, -endHeadSize, 0, 0);
      line(-endHeadSize*coeff, endHeadSize, 0, 0);
      popMatrix();
    }
}

  void update(){
    loc.add(vel);
    vel.add(acc);
    acc.mult(0);
  }
  
  void display(){
    drawArrow(loc.x, loc.y, loc.x + 30, loc.y + 30, 0, 4, true);
  
  }
  
}
