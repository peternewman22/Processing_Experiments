class System {
  Body[] bodies; 

  System() {
    bodies = new Body[planetCount];
    initBodies();
  }

  void initBodies() {
    bodies[0] = new Body(0, 300, new PVector(width/2, height/2), new PVector(0, 0), 100000, color(0, 119, 190));
    bodies[1] = new Body(1, 100, new PVector(width/8+200, 7*height/8), new PVector(-3, -3), 100, color(155, 17, 30));
    bodies[2] = new Body(2, 50, new PVector(width - 200, height/2), new PVector(1, 5), 10, color(0, 128, 128)); 
  }

  void updateBodies() {
    for (int i = 0; i < bodies.length; i++) {
      bodies[i].update();
    }
  }

  void showBodies() {
    for (int i = 0; i < bodies.length; i++) {
      bodies[i].show();
    }
  }
}
