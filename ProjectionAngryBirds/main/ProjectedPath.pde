class ProjectedPath{
  AngryBird[] birds;
  int trackingPoints;
  float a;
  PVector lF;
  float grav;

  
  ProjectedPath(int trackingPoints_, PVector lF_, float g_){
    trackingPoints = trackingPoints_;
    birds = new AngryBird[trackingPoints];
    lF = lF_;
    grav = g_;
    init();
    
  }
  
  void init(){
    birds[0] = new AngryBird(new PVector(0,height), new PVector(lF.x, lF.y+grav));
    for(int i = 1; i < birds.length; i ++){
      float locX = birds[i-1].loc.x + lF.x;
      float velY = birds[i-1].vel.y+grav;
      float locY = birds[i-1].loc.y+velY;
      birds[i] = new AngryBird(new PVector(locX,locY),new PVector(lF.x, velY));
    }
  }
  
  void show(){
    for(AngryBird b : birds){
      b.show();
    }
  }
}
