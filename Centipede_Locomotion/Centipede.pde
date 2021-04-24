class Centipede {
  Segment[] body;
  PVector dir;
  Centipede(float x, float y, int segmentCount, float segmentSize, PVector dir_) {
    dir = dir_.copy();
    body = new Segment[segmentCount];

    // fill in the other segments
    for (int i = 0; i < body.length; i ++) {
      body[i] = new Segment(x - i*segmentSize*0.75, y, segmentSize, dir.normalize(), "Body", (i-1)*0.1, color(255));
    }

    // set the head and tail
    body[0].type = "Head";
    body[0].col = color(255, 0, 0);
    body[segmentCount - 1].type = "Tail";
    body[segmentCount - 1].col = color(0, 0, 255);
  }



  void show() {
    for (int i = body.length-1; i > -1; i--) {
      body[i].show();
    }
  }
}
