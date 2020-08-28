class Body{
  float r;
  float m;
  color col;
  PVector pos;
  PVector vel;
  PVector acc;
  int traceLength = 20;
  PVector[] trace;
  int predictNSteps;
  
  Body(float r_, PVector pos_, PVector vel_, float m_, color col_){
   r = r_;
   pos = pos_.copy();
   m = m_;
   col = col_;
   vel = vel_.copy();
   acc = new PVector(0, 0);
   trace = new PVector[traceLength];
   predictNSteps = 10;
   updateTrace();
  }
  
  PVector attract(Body b){
    float d = pos.dist(b.pos);
    PVector f = PVector.sub(pos, b.pos); //vector from pos to the other body
    f.normalize(); // make it a unit vector
    f.mult(G*m*b.m/d); // scale it by the gravitational constant
    return f;
  }
  
  void applyForce(PVector f){
    f.div(m); // take the force and divide by m to get a
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    updateTrace();
  }
  
  void show(){
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r, r);
    drawTrace();
  }
  
  void updateTrace(){
    trace[0] = pos.copy();
    for(int i = 1; i < traceLength; i++){
      trace[i] = trace[i-1].copy().add(vel.mult(predictNSteps)); //look at the last trace and add the velocity in the next step
    }
  }
  
  void drawTrace(){
    for(PVector p : trace){
      stroke(34,139,33);
      strokeWeight(5);
      point(p.x, p.y);
    }
  }
  
}
