class Wave {
  PVector[] pointArray;
  float yScale, offset, iterator, phase;
  int arrayLength, K;
  Wave[] waveArray;

  Wave(float phase_, Wave[] waveArray_) {
    Wave[] waveArray = waveArray_;
    arrayLength = 1000;
    phase = phase_;
    iterator = 0.01;
    offset = 40;
    yScale = 150;
    K = 1;
    pointArray = generatePoints();
  };

  PVector[] generatePoints() {
    //init pointArray
    PVector[] pointArray = new PVector[arrayLength];

    for (int i = 0; i < pointArray.length; i++) { // store all the points in the point array
      //p = x, sin(x+offset)
      // calculate theta for ith point
      float theta_i = 5*i*iterator + phase;
      // collect the y values and calculate K something average
      float y = calcTheta(i, theta_i);
      PVector p = new PVector(i+offset, yScale*y);
      pointArray[i] = p;
    }
    return pointArray;
  }

  void render(color colour) {
    stroke(colour);
    pushMatrix();
    translate(0, height/2);
    beginShape();
    for (int i = 0; i < pointArray.length; i++) {
      vertex(pointArray[i].x, pointArray[i].y);
    }
    endShape();
    popMatrix();
  }


  float calcTheta(int arrayPos, float theta_i) {
    // start an aggregator
    float agg = 0;
    // iterate through the waves in the Wave array
      for (Wave w : waveArray) {
        //add sin(theta_j - theta_i)
        agg += sin(w.pointArray[i].y - theta_i);
      }
    //scale by K and N
    float y = agg*K/waveArray.length;
    // return an unscaled y
    return y;
  };
};
