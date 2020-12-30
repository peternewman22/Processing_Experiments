class Starfield{
  PVector[] stars;
  Starfield(){
    stars = new PVector[starCount];
    initStars();
  }
  void initStars(){
    for(int i = 0; i < starCount; i ++){
      stars[i] = new PVector(random(width), random(height), random(4));
    }
  }
  
  void drawStars(){
    for(int i = 0; i < starCount; i ++){
      strokeWeight(stars[i].z);
      stroke(255);
      point(stars[i].x, stars[i].y);
    }
  }
}
