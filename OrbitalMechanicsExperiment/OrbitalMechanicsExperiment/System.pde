class System{
  int bodyCount;
  Body[] bodies;
  boolean animate;
  
  System(){
    bodyCount = 2;
    bodies = new Body[bodyCount];
    init();
  }
  
  void init(){
    bodies[0] = new Body(10000, new PVector(width/2, height/2), new PVector(0, 0), 200,color(255,0,0)); //Earth
    bodies[1] = new Body(10, new PVector(width-50, height/2), new PVector(0,initVel), 50,color(0,255,0));
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
