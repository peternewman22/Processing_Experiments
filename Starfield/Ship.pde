class Ship{
    String body;
    float y;
    float rng;

    Ship(String asciiShape, float startingPos, float rng_, int size, color col){
        body = asciiShape;
        textSize(size);
        textAlign(CENTER, CENTER);
        fill(col);
        rng = rng_;
        y = startingPos;
    }

    void show(){
        text(body, width/5, y);
    }

    void update(float theta_){
        y = rng * sin(theta_) + height/2;
    }
}