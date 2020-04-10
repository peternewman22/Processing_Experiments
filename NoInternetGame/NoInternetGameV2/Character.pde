class Character {
  PVector loc, vel, acc;
  float w, h;
  boolean isDead, onGround;

  Character() {
    loc = new PVector(2*xpos, ypos-300);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    w = 10;
    h = yoffset;
    isDead = false;
    onGround = true;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    if (loc.y < ypos) {
      applyForce(gravity);
      onGround = false;
    }
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    if (loc.y >= ypos){
      loc.y = ypos;
      vel.y = 0;
      onGround = true;
    }
  }

  void display() {
    int colour = onGround ? 255 : 155;
    fill(colour);
    noStroke();
    rect(loc.x, loc.y, 2*w, 2*h);
  }
  
  void jump(){
    if(onGround){
      applyForce(jump);
    }
  }
}
