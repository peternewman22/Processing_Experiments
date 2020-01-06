Weight weight;

void setup() {
  size(1280, 1280);
  weight = new Weight();
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  weight.update();
  weight.show();
  popMatrix();
}
