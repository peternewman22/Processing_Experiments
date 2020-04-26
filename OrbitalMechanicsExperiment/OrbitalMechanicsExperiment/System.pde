class System{
  int bodyCount;
  Body[] bodies;
  boolean animate;
  
  System(){
    bodyCount = 3;
    bodies = new Body[bodyCount];
    init();
  }
  
  void init(){
    bodies[0] = new Body(10000, new PVector(width/2, height/2), new PVector(0, 0), 200,color(0,0,255)); //Earth
    bodies[1] = new Body(10, new PVector(width-50, height/2), new PVector(0,0), 50, color(0,255,0));
    bodies[2] = new Body(10, new PVector(50, height/2), new PVector(0,0), 50, color(255, 0, 0));
  }
  
  void show(){
    noStroke();
    for(int i = 0; i < bodies.length; i++){
      bodies[i].show();
    }
  }
  
  void updateForces(){
    for(int i = 0; i < bodies.length; i++){
      bodies[i].updateForces();
    }
  }
  
  void updatePosition(){
    for(int i = 0; i < bodies.length; i++){
      bodies[i].updatePosition();
    }
  }

  void toggleAnimation(){
    animate = !animate;
  }

}
