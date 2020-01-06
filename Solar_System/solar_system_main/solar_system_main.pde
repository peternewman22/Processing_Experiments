//Declaring variables
Mover[] movers;
Attractor a;

//Settings
void settings(){
  size(640,340);
}


//Setup: Initialize variables
void setup(){
  movers = new Mover[8];
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}
  
void draw(){
  background(255);
  a.display();
  for (Mover m: movers){
    PVector f = a.attract(m);
    m.applyForce(f);
    m.update();
    m.display();
  }
}
