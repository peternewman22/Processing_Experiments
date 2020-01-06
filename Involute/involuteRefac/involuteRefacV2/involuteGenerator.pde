class involuteGenerator{

  float D, r, circum, angle;
  ArrayList<PVector> involute_values;
  PVector loc;
  boolean clockwise;
  
  involuteGenerator(PVector loc_, float D_, boolean clockwise_){
    D = D_;
    r = D/2;
    circum = PI*D;
    angle = 0;
    involute_values = new ArrayList<PVector>();
    loc = loc_;
    clockwise = clockwise_;
    
    while (angle < PI){
      float R = r + (angle/TWO_PI)*circum;
      float x = R*cos(angle);
      float y = R*sin(angle);
      PVector vert  = new PVector(x, y);
      involute_values.add(vert);
      angle += 0.05;
    }
  
  
  while (angle < PI){
      float R = r + (angle/TWO_PI)*circum;
      float x = -R*cos(angle+PI);
      float y =-R*sin(angle+PI);
      PVector vert  = new PVector(x, y);
      involute_values.add(vert);
      angle += 0.05;
    }
  }


  void display(float a){
    pushMatrix();
      translate(loc.x, loc.y);
      if(clockwise){
        rotate(a);
      } else {
        rotate(-a);
      }
      stroke(255);
      strokeWeight(2);
      ellipse(0,0, D,D);
     
      
      beginShape();
        for(PVector vert : involute_values){
          vertex(vert.x, vert.y);
        }
      endShape();
    popMatrix();
  }
  
  //void rotateInvol(boolean clockwise_, float rate_){
  //  if(clockwise_){
  //    pushMatrix();
  //      //translate to centre of things
        
  //    popMatrix();
  //  }
  //}




}
