float l1, l2, theta1, theta2;

void setup() {
  size(1280, 1280);
  l1 = 300;
  l2 = 300;
  theta1 = PI/2;
  theta2 = PI/2;
  stroke(255);
  strokeWeight(5);
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  float x1 = l1*sin(theta1);
  float y1 = -l1*cos(theta1);
  float x2 = l1*sin(theta1) + l2*sin(theta2);
  float y2 = -l1*cos(theta1)-l2*cos(theta2);

  line(0, 0, x1, y1);
  ellipse(x1, y1, 30, 30);
  line(x1, y1, x2, y2);
  ellipse(x2, y2, 30, 30);
  
  popMatrix();
  
  theta1 += 0.01;
  theta2 += 0.01;
}
