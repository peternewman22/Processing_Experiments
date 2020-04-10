Character c;
float xpos, ypos, xoffset, yoffset, speed;
PVector gravity, jump;
ArrayList<Obstacle> obstacles;
boolean gameOver;
int points;
int incrementEveryXPoints;

void setup(){
  size(2000, 1000);
  xpos = width/10 + 50;
  ypos = height/2;
  xoffset = width/10;
  yoffset = height/10;
  speed = 5;
  c = new Character();
  gravity = new PVector(0, 0.9);
  jump = new PVector(0, -20);
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle());
  rectMode(CENTER);
  gameOver = false;
  textSize(30);
  textAlign(CENTER);
  points = 0;
  incrementEveryXPoints = 500;
}

void draw(){
  background(0);
  strokeWeight(5);
  stroke(255);
  line(xoffset, height/2 + yoffset, width - xoffset, height/2 + yoffset);
  c.update();
  
  
  // 10% chance of creating a new obstacle
  if(random(0,1) < 0.005){
    obstacles.add(new Obstacle());
  }
  //draw in the Obstacles
  for(int i = 0; i < obstacles.size(); i++){
    Obstacle o = obstacles.get(i);
    o.update(c);
    o.display();
    if(o.hitCharacter){
      gameOver = true;
      break;
    }
    if(o.isDead){
      obstacles.remove(i);
    }
  }
  points ++;
  if(points%incrementEveryXPoints == 0){
    speed ++;
  }
  text(points, 100, 100);
  if(gameOver){
    textSize(100);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
  c.display();
  
}

void keyPressed(){
  if(key == 32){
    c.jump();
  } 
  if((keyCode == ENTER) && gameOver){
    reset();
  }
}

void reset(){
  obstacles = new ArrayList<Obstacle>();
  c = new Character();
  gameOver = false;
  points = 0;
  loop();
  textSize(30);
}
