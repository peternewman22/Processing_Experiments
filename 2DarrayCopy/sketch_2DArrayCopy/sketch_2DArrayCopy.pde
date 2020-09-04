/*
I want to experiment with a buffer thing
Step 1: Fill src and Draw stacks of rectangles
Step 2: Copy from 
*/

int planetCount, stateCount;
float rectSize;
color[][] srcStack, bufferStack, dstStack;

void setup() {
  size(560, 900);
  planetCount = 3;
  stateCount = 20;
  rectSize = 40;
  srcStack = new color[stateCount][planetCount];
  bufferStack = new color[stateCount][planetCount];
  dstStack = new color[stateCount][planetCount];

  initSrc();
  initOtherStacks(bufferStack);
  initOtherStacks(dstStack);
  textAlign(LEFT);
  textSize(15);
  stroke(0);
}

void draw() {
  background(0);
  drawStack(srcStack, 50, 50, "Source");
  drawStack(bufferStack, 220, 50, "Buffer");
  drawStack(dstStack, 390, 50, "Destination");
  
}

void updateStack(color[][] src, int srcPos, color[][] dst, int dstPos, int len){
  for(int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
    arrayCopy(src[eachPlanet], srcPos, dst[eachPlanet], dstPos, len);
  }
}

void drawStack(color[][] stack, int startX, int startY, String stackName){
  fill(255);
  text(stackName, startX, startY - 15);
  for(int eachState = 0; eachState < stateCount; eachState++){
    for(int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
      fill(stack[eachState][eachPlanet]);
      rect(startX+eachPlanet*rectSize, startY+eachState*rectSize, rectSize, rectSize);
    }
  }
}

void initOtherStacks(color[][] stack){
  for(int eachState = 0; eachState < stateCount; eachState++){
    for(int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++){
      stack[eachState][eachPlanet] = color(255);
    }
  }
}

void initSrc() {
  srcStack[0][0] = color(255, 0, 0, 100);
  srcStack[0][1] = color(0, 255, 0, 100);
  srcStack[0][2] = color(0, 0, 255, 100);
  for (int eachState = 1; eachState < stateCount; eachState++) {
    for (int eachPlanet = 0; eachPlanet < planetCount; eachPlanet++) {
      color col = color(255);
      switch(eachPlanet) {
      case 0:
        col = color(255, 0, 0);
        break;
      case 1:
        col = color(0, 255, 0);
        break;
      case 2:
        col = color(0, 0, 255);
        break;
      default:
        col = color(255);
      }
      srcStack[eachState][eachPlanet] = col;
    }
  }
}

void keyPressed(){
  if(key == 32){
    // copy everything but the first row to the buffer
    updateStack(srcStack,1,bufferStack,0,stateCount-1);
    // fill the last state in the buffer
    bufferStack[stateCount-1][0] = color(255,0,0,100);
    bufferStack[stateCount-1][1] = color(0,255,0,100);
    bufferStack[stateCount-1][2] = color(0,0,255,100);
    // copy to the destination
    updateStack(bufferStack,0,dstStack,0,stateCount);
  }
}
