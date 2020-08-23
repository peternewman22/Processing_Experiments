class Star{
    PVector pos;
    float distance;
    float size;
    float luminence;
    float vel;
    boolean isOffMap;
    
    Star(float d_, PVector pos_){
        distance = d_;
        luminence = 255 - map(d,1,20,0,255)
        vel = 20 - d;
        size = 40/d;
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