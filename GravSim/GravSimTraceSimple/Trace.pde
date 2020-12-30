class Trace{
// Tracks planets
  ArrayList<Planet> trace;
  Planet p;
  int planetPosInTrace;
  int traceLead;
  int traceMax;
  boolean progressingPos;
  
  Trace(Planet p_){
    trace = new ArrayList<Planet>();
    p = p_;
    initTrace();
    planetPosInTrace = 0;
    traceLead = showEvery*5;
    traceMax = showEvery*30;
    progressingPos = true;
  }
  
  void initTrace(){
    trace.add(p);
    for(int i = 1; i < traceSteps; i++){
      Planet prevP = trace.get(i-1);
      Planet currentP = prevP.update();
      trace.add(currentP);
    }
  }
  
  void update(){
    Planet prevP = trace.get(trace.size()-1);
    Planet currentP = prevP.update();
    trace.add(currentP);
    if(trace.size() > traceMax){
      trace.remove(0); //start deleting off the backend
    }
    if(planetPosInTrace > traceLead){
      progressingPos = false;
    }
    if(progressingPos){
      planetPosInTrace++;
    }
  }
  
  void show(){
    
    strokeWeight(5);
    // draw in the trace
    for(int i = 0; i < traceSteps; i++){
      if(i % showEvery == 0){
        if(i < planetPosInTrace){
          stroke(255,0,0);
        } else {
          stroke(0, 255, 0);
        }
        Planet pState = trace.get(i);
        point(pState.pos.x, pState.pos.y);
      }
    }
    // draw in the planet
    if(planetPosInTrace < traceSteps){
      trace.get(planetPosInTrace).show();
    } else {
      trace.get(trace.size()-1).show();
    }// finally show the planet
  }
}
