float offset, side;
StringList
modeList = {"BLEND", "ADD", "SUBSTRACT","DARKEST","LIGHTEST","DIFFERENCE","EXCLUSION","MULTIPLY","SCREEN","REPLACE");
void setup() {
  size(1280, 720);
  side = width/16;
  offset = side/2;
}

void draw() {
  background(255);
  // draw black squares across the screen
  strokeWeight(2);
  text(modeList)
  //for (int i = 0; i < 10; i++) {
  //  rect(offset + i*(side+offset), height/2 - offset, side, side);
  //  rect(offset + i*(side+offset), height/2 - offset, side, side);
  //}
}
