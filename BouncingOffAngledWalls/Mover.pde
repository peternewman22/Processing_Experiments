class Mover{
  PVector p, v, pt;
  float d2w;
  float a2w;
  Mover(float x, float y){
    p = new PVector(x, y);
    v = new PVector(0,0.5);
    pt = null;
    a2w = PVector.angleBetween(PVector.sub(v,p), w.ab);
    d2w = 
  }
  
  //void lookAt(){
  //  v.set(mouseX - p.x, mouseY - p.y);
  //  text(str(doesIntersect(w)), width/2, height/8);
  //}
  
  void update(){
    p.add(v);
    
    if(doesIntersect(w)){
      ellipse(pt.x, pt.y, 10, 10);
      d2w = PVector.dist(p,pt);
      a2w = PVector.angleBetween(PVector.sub(v,p),
    } else {
    d2w = width;
  }
    //v.set(mouseX, mouseY);
    //text(str(doesIntersect(w)), width/2, height/8);
  }
  
  boolean doesIntersect(Wall w){
    float x1 = p.x;
    float y1 = p.y;
    float x2 = p.x + v.x*2*width;
    float y2 = p.y + v.y*2*width;
    
    float x3 = w.start.x;
    float y3 = w.start.y;
    float x4 = w.end.x;
    float y4 = w.end.y;
    float denominator = (x1 - x2)*(y3 - y4) - (y1-y2)*(x3 - x4);
    if(denominator == 0){
      return false;
    }
    float t = ((x1-x3)*(y3-y4) - (y1 - y3)*(x3-x4))/denominator;
    float u = ((x2 - x1)*(y1-y3) - (y2 - y1)*(x1-x3))/denominator;
    if(t >= 0 && t <= 1 && u >= 0 && u <= 1){
      pt = new PVector(x1 + t*(x2 - x1), y1 + t*(y2-y1));
      //PVector pt = new PVector(x3+u*(x4-x3), y3 + u*(y4-y3));
      return true;
    } else {
      pt = null;
      return false;
    }
  }
  
 
  
  void show(){
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(p.x, p.y, r, r);
    //line(p.x, p.x, v.x, v.y);
  }
}
