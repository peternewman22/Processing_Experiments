int[][] current;
int w, cols, rows;
PVector currentMouseLoc, previousMouseLoc;
void setup() {
  size(1280, 720);
  w = 20;
  cols = width/w;
  rows = height/w;
  current = new int[cols][rows];
  currentMouseLoc = new PVector(mouseX/w, mouseY/w);
  previousMouseLoc = currentMouseLoc.copy();


  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      current[x][y] = 0; //set all values initially to zero
    }
  }
}



void draw() {
  //work out where on the grid is the mouse, store it in currentMouseLoc
  PVector currentMouseLoc = new PVector(mouseX/w, mouseY/w);
 
   if(currentMouseLoc != previousMouseLoc){
    current[int(previousMouseLoc.x)][int(previousMouseLoc.y)] = 0;
  }
  // set current to 1
  current[int(currentMouseLoc.x)][int(currentMouseLoc.y)] = 1;
  //if we're on a different square, turn off the old one
 
  // draw the grid
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (current[x][y] == 0) fill(255);
      else fill(0);
      rect(x*w, y*w, w, w);
    }
  }
  
   previousMouseLoc = currentMouseLoc.copy();
}

void mouseDragged(){
  //work out which cells it touches
  current[int(mouseX/w)][int(mouseY/w)] = 1;
}
