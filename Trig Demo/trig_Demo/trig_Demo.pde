/* */

float circ_x, circ_y, graph_x, D, r, angle1, angle2;
ArrayList<Float> wave;

void settings(){
  size(1280, 960);
}

void setup(){
  circ_x = width/3;
  circ_y = height/2;
  graph_x = 2*width/3;
  
  D = height-200;
  r = D/2;
  angle1 = -HALF_PI;
  angle2 = 0;
  wave = new ArrayList<Float>();
  
  
  stroke(255);
  noFill();
  
}

void draw(){
  background(0);
  line(circ_x, 0, circ_x, height);
  line(0, height/2, width, height/2);
  noFill();
  //cosine wave
  pushMatrix();
    translate(circ_x, circ_y); // recentre the thing
    
    ellipse(0, 0, D, D);
    //ellipse(graph_x, circ_y, 20, 20);
    
    float x = r * cos(angle1);
    float y = r * sin(angle1);
    
    //draw a line from the centre of the circle to the things
    
    line(0, 0, x, y);
    stroke(255);
    line(x, y, x, 0); // vert line
    
    // draw the line horizontally to the width/3 graph start
    line(x,y, width/3, y);
    
    //add points to the curve
    wave.add(0, y);  
  popMatrix();
  
  pushMatrix();
    translate(graph_x, circ_y);
    //move it over by width/3 --> popMatrix later?
    stroke(255,0,0);
    strokeWeight(3);
    beginShape();
    for (int i=0; i < wave.size(); i++){
      vertex(i, wave.get(i));
    }
    endShape();
  popMatrix();
  
  noFill();
  //sine wave
  pushMatrix();
    translate(circ_x, circ_y); // recentre the thing
    
    ellipse(0, 0, D, D);
    //ellipse(graph_x, circ_y, 20, 20);
    
    float x2 = r * cos(angle2);
    float y2 = r * sin(angle2);
    
    //draw a line from the centre of the circle to the things
    
    line(0, 0, x2, y2);
    stroke(255);
    line(x2, y2, x2, 0); // vert line
    
    // draw the line horizontally to the width/3 graph start
    line(x2,y2, width/3, y2);
    
    //add points to the curve
    wave.add(0, y2);  
  popMatrix();
  
  pushMatrix();
    translate(graph_x, circ_y);
    //move it over by width/3 --> popMatrix later?
    stroke(0, 255, 0);
    strokeWeight(3);
    beginShape();
    for (int i=0; i < wave.size(); i++){
      vertex(i, wave.get(i));
    }
    endShape();
  popMatrix();
  
  angle1 -= 0.02;
  angle2 -= 0.02;

}
