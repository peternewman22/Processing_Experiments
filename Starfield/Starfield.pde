/*
Parallax starfield with ASCII starship borrowed from https://gist.github.com/volfegan/4ec77db726991f03a401c4dbedfc47bf

1000 stars spawn in, randomly distributed with a random distance which in turn determines x_velocity, transparency and size

Star ship stays at width/3 and moves up and down according to sin wave to begin with

Stars that have disappeared off the map are deleted from the array and are replaced by stars appearing at x = width + 5;
*/

String shipShape = "   __\n   |  \\\n=E[*|K)--.___\n=E[+,---------'\n  [|_/";
ArrayList<Star> starfield;
int starCount = 1000;
Ship ship;
float theta;

void setup(){
    size(1080, 720);
    starfield = new ArrayList<Star>();
    initStarfield();
    fill(255);
    textSize(20);
    theta = 0;
    ship = new Ship(shipShape, height/2, height*0.6/2, 15, color(255,0,0));
    
}

void draw(){

    background(0);
    drawStarField();
    ship.update(theta);
    ship.show();
    cleanup();
    addNewStars();
    theta += 0.005;

}

void initStarfield(){
    for(int i = 0; i < starCount; i++){
        starfield.add(new Star(random(1,20), new PVector(random(width), random(height))));
    }
}

void drawStarField(){
    for(int i = 0; i < starfield.size(); i++){
        Star s = starfield.get(i);
        s.update();
        s.show();
    }
}

void cleanup(){
    for(int i = starfield.size() - 1; i > 0; i--){
        Star s = starfield.get(i);
        if(s.isOffMap){
            starfield.remove(i);
        }
    }
}

void addNewStars(){
    if(starfield.size() < starCount){
        for(int i = 0; i < starCount - starfield.size(); i++){
            starfield.add(new Star(random(1,20), new PVector(width+1,random(height))));
        }
    }
}