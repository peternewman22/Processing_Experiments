PVector town1, town2, mousePos;
Town[] towns;
int townCount = 6;
int townSize = 50;
int townColour = color(255);
int markerColour = color(0, 255, 255);
int townTextSize = townSize/2;
int nearestNTowns = 5;
float a = 0;
float spread = 350;
float[] distances;

void setup() {
  size(1000, 1000);
  mousePos = new PVector(width/2, height/2);
  distances = new float[townCount];
  towns = new Town[townCount];
  initTowns();
}

void draw() {
  background(0);
  mousePos.set(mouseX, mouseY);
  updateTowns();
  drawTowns();
  drawMarker();
}

void drawMarker() {
  fill(markerColour);
  noStroke();
  ellipse(mousePos.x, mousePos.y, townSize, townSize);
  textSize(townTextSize);
  textAlign(CENTER);
  fill(0);
  text(str(nearestNTowns), mouseX, mouseY);
}

void updateTowns() {
  for (int i = 0; i < towns.length; i++) {
    towns[i].update();
    towns[i].updateRank();
  }
}
void drawTowns() {
  for (int i = 0; i < towns.length; i++) {
    towns[i].show();
    
    //show distString
    textAlign(LEFT);
    textSize(townTextSize);
    fill(255);
    text(towns[i].distString, townTextSize, height - townCount*townTextSize + i*townTextSize);
    
    //show rankString
    text(towns[i].rankString, townTextSize + 200, height - townCount*townTextSize + i*townTextSize);
  }
}

void initTowns() {
  for (int i = 0; i < towns.length; i++) {
    towns[i] = new Town(width/2 + spread*cos(a), height/2+spread*sin(a), i);
    a += TWO_PI/townCount;
  }
}

int findIndex(float[] dists, float d) {
  // returns
  for (int i = 0; i < dists.length; i++) {
    if (dists[i] == d) {
      return i;
    }
  }
  return -1;
}

void keyPressed() {
  // increment or decrement towns, constrained to the TownCount
  if ((keyCode == UP) && nearestNTowns < towns.length) {
    nearestNTowns += 1;
  } else if ((keyCode == DOWN) && nearestNTowns > 1) {
    nearestNTowns -= 1;
  }
}
