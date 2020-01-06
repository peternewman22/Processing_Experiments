class Wave{
  PVector[] pointArray;
  float yScale, offset, iterator, arrayLength;
  Wave(){
    arrayLength = 1000;
    iterator = 0.01;
    offset = 40;
    yScale = 150;
  };
  
  PVector[] generatePoints(float phaseDiff){
  //init pointArray
  PVector[] pointArray = new PVector[arrayLength];
  
  // store all the points in the point array
    for(int i = 0; i < pointArray.length; i++){
      //p = x, sin(x+offset)
    PVector p = new PVector(i+offset, yScale*sin(5*i*iterator + phaseDiff));
    pointArray[i] = p;
  }
  
  return pointArray;
}
  
  void render(PVector[] pointArray, color colour){
    stroke(colour);
    pushMatrix();
    translate(0, height/2);
    beginShape();
      for(int i = 0; i < pointArray.length; i++){
        vertex(pointArray[i].x, pointArray[i].y);
      }
    endShape();
    popMatrix();
}
  
}
