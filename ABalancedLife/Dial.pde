class Dial {
  // A dial has an angular position mapped to its brightness
  float a;
  int brightness;
  PVector dPos;
  PVector lPos;
  boolean isSelected;
  Dial(float x, float y) {
    a = PI;
    brightness = 43;
    dPos = new PVector(x, y + d);
    lPos = new PVector(x, y - d);
    isSelected = false;
  }

  void update(float angle) {
    if (isSelected) {
      a = angle;
      brightness = int(map(a, 0, TWO_PI, 50, 255));
    }
  }

  void show() {
    // dial
    strokeWeight(5);
    if (isSelected) {
      stroke(95,255,255);
    } else {
      stroke(255);
    }
    noFill();
    ellipse(dPos.x, dPos.y, d, d);
    
    // lights
    noStroke();
    //fill(int(map(mouseY,0,255,0,360)), 255, 255);
    fill(43, 255, brightness);
    ellipse(lPos.x, lPos.y, D, D);
    stroke(255);
    strokeWeight(2);
    line(dPos.x, dPos.y, dPos.x + (d/2)*cos(a), dPos.y + (d/2)*sin(a));
  }
}
