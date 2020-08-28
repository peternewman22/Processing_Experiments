float G;
Body planet1, planet2;
PVector[] stars;
int starCount;

void setup(){
  size(1000, 1000);
  G = 1;
  starCount = 300;
  stars = new PVector[starCount];
  initStars();
  
  planet1 = new Body(50, new PVector(width/8, 7*height/8-100), new PVector(2,-2), 100, color(0,119,190));
  planet2 = new Body(50, new PVector(width/8+100, 7*height/8), new PVector(2, -2), 100, color(155, 17, 30));
}

void draw(){
  background(0);
  drawStars();
  planet1.update();
  planet2.update();
  planet1.show();
  planet2.show();
}

void initStars(){
  for(int i = 0; i < starCount; i ++){
    stars[i] = new PVector(random(width), random(height), random(4));
  }
}

void drawStars(){
  for(PVector p : stars){
    stroke(255);
    strokeWeight(p.z);
    point(p.x, p.y);
  }
}
