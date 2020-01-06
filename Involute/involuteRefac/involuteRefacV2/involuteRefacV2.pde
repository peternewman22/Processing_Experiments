involuteGenerator inv_1, inv_2;
float a;

void settings(){
  size(720, 720);  
}

void setup(){
  noFill();
  inv_1 = new involuteGenerator(new PVector(width/2-TWO_PI*12.5+6, height/2+25), 50, false);
  
  inv_2 = new involuteGenerator(new PVector(width/2+TWO_PI*12.5-6, height/2-25), 50, true);
  a = 0;
}

void draw(){
  background(0);
  inv_1.display(a+PI/2);
  inv_2.display(a);
  a+= 0.03;
  line(0,height/2, width, height/2);
  
}
