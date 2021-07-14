Dial[] dials;
float D;
float d;
PVector mousePos;

void setup() {
  size(400, 400);
  colorMode(HSB);
  D = width/5;
  d = width/8;
  dials = new Dial[4];
  for (int i = 0; i < dials.length; i++) {
    dials[i] = new Dial((i+1)*width/5, height/2);
  }
  //dials[0].isSelected = true;
  textAlign(CENTER);
  textSize(20);
  mousePos = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  mousePos.set(mouseX, mouseY);
  for (Dial dial : dials) {
    dial.update(mapMouse2Angle());
    dial.show();
  }
  fill(255);
  //text(str(mouseY) + " --> " + str(int(map(mouseY,0,255,0,360))), width/2, 20);
}

void mouseReleased() {
  for (Dial dial : dials) {
    if (PVector.dist(mousePos, dial.dPos) < d/2) {
      dial.isSelected = true;
    } else {
      dial.isSelected = false;
    }
  }
}

float mapMouse2Angle() {
  for (Dial dial : dials) {
    if (dial.isSelected) {
      PVector mouse2Angle = PVector.sub(mousePos, dial.dPos);
      return mouse2Angle.heading();
    }
  }
  return 0;
}
