/*
Takes a bunch of nodes and finds the closest n distances
 Nodes are based on longitude and latitude mapped to the workspace
 Left and Right Click increase and decrease the number of towns from the mouse
 Tab cycles to a different zone (with a different colour)
 Also adds a readout
 */


PVector[] towns;

int townCount = 10;
int townSize = 20;
int nearestNTowns = 5;
float[] distances;
int infoTextSize = 20;
int infoStartY;

void setup() {
  size(1000, 1000);
  towns = new PVector[townCount];
  initTowns();
  infoStartY = height - (townCount + 1)*infoTextSize;
  updateDistances();
}

void draw() {
  background(0);
  for (int i = 0; i < towns.length; i++) {
    PVector town = towns[i];
    fill(255);
    stroke(255);
    strokeWeight(5);

    // draw the town
    ellipse(town.x, town.y, townSize, townSize);

    int townIndex = findIndex(distances, town.z);
    // draw the connections
    if (townIndex < nearestNTowns && townIndex > -1) {
      // if the distance found and if it's in the first nearestNTowns position in the distances list
      line(mouseX, mouseY, town.x, town.y);
    }

    // draw the town labels
    textAlign(CENTER);
    fill(0);
    textSize(15);
    text(str(i), town.x, town.y); // number the towns

    // draw the hub
    fill(0, 255, 255);
    noStroke();
    ellipse(mouseX, mouseY, townSize*2, townSize*2);
    fill(0);

    // draw the number of closest towns
    textSize(25);
    textAlign(CENTER);
    text(str(nearestNTowns), mouseX, mouseY);
  }
  updateDistances();
}

void drawScreenInfo() {
  fill(255, 200);
  textSize(infoTextSize);
  textAlign(LEFT);
  text("Dist2Towns", width/8, infoStartY);
  // write them to screen
  for (int i = 0; i < distances.length; i++) {
    text(str(i) + ": " +str(round(distances[i])), width/8, infoStartY + (i+1)*infoTextSize);
  }
}

void mouseClicked() {
  // increment or decrement towns, limited to towns
  if ((mouseButton == LEFT) && nearestNTowns < towns.length) {
    nearestNTowns += 1;
  } else if ((mouseButton == RIGHT) && nearestNTowns > 1) {
    nearestNTowns -= 1;
  }
}



void initTowns() {
  for (int i = 0; i < towns.length; i ++) {
    towns[i] = new PVector(random(width), random(height), 0);
  }
}

void updateDistances() {
  // overwrite distances
  distances = new float[townCount];

  PVector mousePos = new PVector(mouseX, mouseY);

  //record distances
  for (int i = 0; i < towns.length; i ++) {
    float dist = towns[i].dist(mousePos); // find the distance to the mouse
    towns[i].z = dist; // set the z to distance of the mouse;
    distances[i] = dist; // add it to the distance list
  }
  drawScreenInfo(); // display BEFORE sorting
  distances = sort(distances); // sort them and overwrite distances
}

int findIndex(float[] d, float search) {
  // returns
  for (int i = 0; i < d.length; i++) {
    if (search == d[i]) {
      return i;
    }
  }
  return -1;
}
