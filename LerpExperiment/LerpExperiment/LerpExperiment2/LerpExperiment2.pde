/*
I want to show how 
*/

int s;
float w;

void setup(){
size(1000, 1000);
s = 100;
w = width/s;
}

void draw(){
background(0);
for(int i = 0; i < s; i++){
  for(int j = 0; j < s; j++){
    if((i < s/2)&&(j < s/2)){
      fill(0,100,255);
    } else {
      fill(255, 100, 0);
    }
    rect(i*w,j*w, w, w);
  }
}



}
