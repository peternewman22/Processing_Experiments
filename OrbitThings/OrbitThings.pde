float sun_size, orbit_1, orbit_2, r1, r2, theta;
float p1_size, p2_size;
float n1, n2;
float start_pos, end_pos;;

ArrayList<PVector> lines;
void setup() {
  size(720, 720, P2D);
  strokeWeight(1);
  sun_size = 0.1*height;
  orbit_1 = 0.6*height;
  orbit_2 = 0.8*height;
  r1 = orbit_1/2;
  r2 = orbit_2/2;
  start_pos = -PI/2;
  end_pos = 3*PI/2;
  theta = start_pos;
  p1_size = 0.025*height;
  p2_size = 0.05*height;
  n1 = 8;
  n2 = 13;
  lines = new ArrayList<PVector>();
 
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);


  //calculating the position of the planets
  float angle1 = n1*theta;
  float angle2 = n2*theta;
  PVector p1 = getLoc(r1, angle1);
  PVector p2 = getLoc(r2, angle2);
  //drawing the connecting line
  line(p1.x, p1.y, p2.x, p2.y);



  //draw lines
  stroke(255, 100);
  if (lines.size() != 0) {
    for (int i = 0; i < lines.size(); i++) {
      PVector loc1 = getLoc(r1, lines.get(i).x);
      PVector loc2 = getLoc(r2, lines.get(i).y);
      line(loc1.x, loc1.y, loc2.x, loc2.y);
    }
  }

  //drawing the sun
  fill(255, 255, 0);
  noStroke();
  ellipse(0, 0, sun_size, sun_size);
  stroke(255);
  noFill();
  ellipse(0, 0, orbit_1, orbit_1);
  ellipse(0, 0, orbit_2, orbit_2);

  //drawing the planets
  fill(243, 198, 142);
  noStroke();
  ellipse(p1.x, p1.y, p1_size, p1_size);
  fill(99, 78, 255);
  ellipse(p2.x, p2.y, p2_size, p2_size);

  popMatrix();

  theta += end_pos/1000;
  if(theta <= end_pos){
  lines.add(new PVector(angle1, angle2));
  }

  //if((theta <= TWO_PI) && (frameCount%5 == 0)){
  //lines.add(new PVector(angle1, angle2));
  //}

  //if (frameCount%2 == 0) {
  //  lines.add(new PVector(angle1, angle2));
  //}
}

PVector getLoc(float r, float angle) {
  return (new PVector(r*cos(angle), r*sin(angle)));
}
