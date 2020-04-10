import controlP5.*;

float xOffset;
float yOffset;
int popSize, activeArea, dayNum, maxDays;
float meepleSize, border;
Population p;
Graph graph;
void setup(){
   size(750, 1000);
   popSize = 400;
   activeArea = width;
   xOffset = width*0.2;
   yOffset = height*0.75;
   p = new Population();
   meepleSize = 5;
   border = meepleSize/2;
   textAlign(CENTER);
   dayNum = 0;
   maxDays = 365;
   graph = new Graph(p.uninfected, p.sick, p.recovered);
   textSize(20);
}

void draw(){
  background(0);
  p.show();
  stroke(255);
  noFill();
  rect(0,0,activeArea,activeArea);
  if(frameCount%5 == 0){
    dayNum ++;
    graph.update(p.uninfected, p.sick, p.recovered);
  }
  graph.show();
  if(dayNum > maxDays){
    reset();
  }
  
}

void reset(){
  p = new Population();
  dayNum = 0;
  graph = new Graph(p.uninfected, p.sick, p.recovered);
}
