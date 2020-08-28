class System {
  Body[][] bodies; // eachRow is a different state, eachCol is a different body

  System() {
    bodies = new Body[traceSteps][planetCount];
    initSystem();
  }

  void initSystem() {
    bodies[0][0] = new Body(0, 300, new PVector(width/2, height/2), new PVector(0, 0), 100000, color(0, 119, 190));
    bodies[0][1] = new Body(1, 100, new PVector(width/8+200, 7*height/8), new PVector(-3, -3), 100, color(155, 17, 30));
    //bodies[2] = new Body(2, 50, new PVector(width - 200, height/2), new PVector(1, 5), 10, color(0, 128, 128));
    //bodies[3] = new Body(3, 120, new PVector(width/2, height/8), new PVector(5, -1), 120, color(255, 0, 255));
  
    
}

  void updateSystem() {
    for (int eachState = 0; eachState < traceSteps; eachState++) {
      for (int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++) {
        bodies[eachState][eachPlanet].update();
      }
    }
  }

  void showBodies() {
    //draw the bodies at the beginning of the trace
    bodies[0][0].show();
    bodies[0][1].show();
    for (int eachState = 1; eachState < traceSteps; eachState++) {
      for (int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
        strokeWeight(10);
        stroke(0,255,0);
        point(bodies[eachState][eachPlanet].pos.x, bodies[eachState][eachPlanet].pos.y);
      }
    }
  }
}
