class Star{
    PVector pos;
    float distance;
    float size;
    float luminence;
    float vel;
    boolean isOffMap;
    
    Star(float d_, PVector pos_){
        distance = d_;
        luminence = 255 - map(distance,1,20,0,255);
        vel = 0.1*(20 - distance);
        size = 10/distance;
        pos = pos_.copy();
        isOffMap = false;
    }

    void update(){
        pos.add(new PVector(-vel,0));
        if(pos.x < 0){
            isOffMap = true;
        }
    }

    void show(){
        stroke(255,luminence);
        strokeWeight(size);
        point(pos.x, pos.y);
    }

}