class System {
  Body[] bodies;

  System(int planetCount) {
    bodies = new Body[planetCount];
    initBodies();
  }

  void initBodies() {
    bodies[0] = new Body(0, 300, new PVector(width/2, height/2), new PVector(0, 0), 1000, color(0, 119, 190));
    bodies[1] = new Body(1, 100, new PVector(width/8+200, 7*height/8), new PVector(1, -1), 100, color(155, 17, 30));
  }

  void updateBodies() {
    for (int i = 0; i < bodies.length; i++) {
      bodies[i].update();
    }
  }
  
  void showBodies(){
    for (int i = 0; i < bodies.length; i++) {
      bodies[i].show();
    }
  }
}
