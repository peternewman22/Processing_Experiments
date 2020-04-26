/* I want to animate the process of */
int s;
float w;
float ls;

void setup(){
  size(1000, 1000);
  s = 100;
  w = width/s;
  ls = 100;
  
  stroke(255);
}

void draw(){
  background(0);
  fill(255);
  ls = round(lerp(ls,10,0.01));
  if((ls-10)<1){
    ls = 10;
  }
  
  text(ls,900,100);
  //fill(0);
  //for(int col = 0; col < s; col++){
  //  for(int row = 0; row < s; row++){
  //    rect(col*w, row*w, w, w);
  //  }
  //}
}
