class System {
<<<<<<< HEAD
  Body[][] bodies;
  Body[][] buffer; // eachRow is a different state, eachCol is a different body
  PVector[][] trace;

=======
  Body[][] bodies; // eachRow is a different state, eachCol is a different body
  Body[][] buffer;
>>>>>>> a093fdf068cdb164f3ea3be27749d4837b0a76f2
  System() {
    bodyStates = new Body[stateCount][planetCount];
    buffer = new Body[stateCount][planetCount];
    trace = new PVector[traceSteps]planetCount];
    initSystem();
  }

  void initSystem() {
    bodyState[0][0] = new Body(0, 300, new PVector(width/2, height/2), new PVector(0, 0), 100000, color(0, 119, 190));
    bodyStates[0][1] = new Body(1, 100, new PVector(width/8+200, 7*height/8), new PVector(-3, -3), 100, color(155, 17, 30));
    //bodies[2] = new Body(2, 50, new PVector(width - 200, height/2), new PVector(1, 5), 10, color(0, 128, 128));
    //bodies[3] = new Body(3, 120, new PVector(width/2, height/8), new PVector(5, -1), 120, color(255, 0, 255));
    for(int eachState 1; eachState < stateCount; eachState++){
      for(int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
        bodyStates[eachState][eachPlanet] = bodyStates[eachState-1][eachPlanet].update() // each new state is an update of the previous one
        if(eachState%10 == 0){
          trace[eachState]eachPlanet] = bodyStates[eachState][eachPlanet]
        }
      }

    }
    
}

  void updateSystem() {
    // write to the buffer
    arrayCopy(bodies,1,buffer,0,stateCount-1)
    // fill in the last element
    buffer[]
  }

  void showBodies() {
    //draw the bodies at the beginning of the trace
    
      for (int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
        bodyStates[0][eachPlanet].show();
      }
  }

  void showTrace(){
    for(int eachTrace = 0; eachTrace < traceSteps; eachTrace++){
        strokeWeight(10);
        stroke(0,255,0);
        point(trace[eachState][eachPlanet].x, bodies[eachState][eachPlanet].y);

    }
  }

  void deepArrayCopy(Body[][] src, int srcPos, Body[][] dst, int dstPos, int len){
    // takes everything after the first row and copies it to beginning of the buffer
      for(int i = 0; i < src.length; i++){
        arrayCopy(src[i],srcPos,dst[i],dstPos,len);
      }
      
      
//arrayCopy(src, srcPosition, dst, dstPosition, length)
  }
}
