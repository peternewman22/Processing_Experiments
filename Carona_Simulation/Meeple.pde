class Meeple {
  PVector loc;
  PVector vel;
  boolean isSick;
  boolean isRecovered;
  boolean isUninfected;
  boolean isStationary;
  int index;
  int sickDays;

  Meeple(int index_) {
    index = index_;
    loc = new PVector(random(0, activeArea), random(0, activeArea)); //some location
    vel = PVector.random2D();
    isStationary = random(1) < 0;
    isSick = random(1) < 0.05;
    isRecovered = false;
    isUninfected = !isSick;
    sickDays = 500;
  }

  void update() {
    if (!isStationary) {
      loc.add(vel);
    }
    checkBoundary();
    checkCollisions();
    if (isSick) {
      sickDays --;
    }
    if (sickDays == 0) {
      isSick = false;
      isRecovered = true;
    }
  }

  void checkCollisions() {
    for (int i = 0; i < popSize; i++) {
      if (i != index) { //if it's not me...
        float d = loc.dist(p.population[i].loc);
        if ((d <= meepleSize) && isUninfected && p.population[i].isSick) {
          getInfected();
        }
      }
    }
  }

  void getInfected() {
    if (isUninfected) {
      isUninfected = false;
      isSick = true;
    }
  }

  


void checkBoundary() {
  if ((loc.x < border) || (loc.x > activeArea - border)) {
    vel.x = -vel.x;
  }
  if ((loc.y < border) || (loc.y > activeArea - border)) {
    vel.y = -vel.y;
  }
}

void show() {
  if (isUninfected) {
    fill(0, 255, 0);
  } else if (isSick) {
    fill(255, 0, 0);
  } else if (isRecovered) {
    fill(0, 0, 255);
  }
  ellipse(loc.x, loc.y, meepleSize, meepleSize);
}
}
