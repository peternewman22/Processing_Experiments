class Mover{
  PVector p, v, projV;
  Mover(float x, float y){
    p = new PVector(x, y);
    v = new PVector(1,1);
    projV = v.copy().setMag(width*sqrt(2));
  }
  
  boolean doesIntersect(Wall w){
    float x1 = p.x;
    float y1 = p.y;
    float x2 = projV.x;
    float y2 = projV.y;
    
    float x3 = w.start.x;
    float y3 = w.start.y;
    float x4 = w.end.x;
    float y4 = w.end.y;
    float denominator = ((x1 - x2)*(y3 - y4) - (y1-y2)*(x3 - x4));
    if(denominator == 0){
      return false;
    }
    float t = ((x1-x3)*(y3-y4) - (y1 - y3)*(x3-x4))/denominator;
    float u = -((x2 - x1)*(y1-y3) - (y2 - y1)*(x1-x3))/denominator;
    if(t > 0 && t < 1 && u > 0){
      return true;
    } else {
      return false;
    }
  }
  
  void update(){
    p.add(v);
  }
  
  void show(){
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(p.x, p.y, r, r);
  }
}
