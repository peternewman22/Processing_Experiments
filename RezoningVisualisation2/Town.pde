class Town {
  PVector pos;
  float d2mouse;
  int index;
  String distString, rankString;
  int rank;
  Town(float x, float y, int i) {
    pos = new PVector(x, y);
    index = i;
    update();
  }

  void update() {
    // recalculate distance
    d2mouse = pos.dist(mousePos);
    // update the distances
    distances[index] = d2mouse;
    // update info string
    distString = str(index) + ":\t" + str(d2mouse);
  }

  void updateRank() {
    rank = findIndex(sort(distances), d2mouse);
    rankString = "Rank:\t" + str(rank);
  }

  void show() {
    fill(townColour);
    noStroke();
    // draw the town
    ellipse(pos.x, pos.y, townSize, townSize);
    stroke(255);
    strokeWeight(4);
    
    // draw the line
    if (rank < nearestNTowns) {
      line(pos.x, pos.y, mousePos.x, mousePos.y);
      
    }
    
    // write the index
    textAlign(CENTER);
    textSize(townTextSize);
    fill(0);
    text(index, pos.x, pos.y+townTextSize*0.3);
  }
}
