/*
Parallax starfield with ASCII starship borrowed from https://gist.github.com/volfegan/4ec77db726991f03a401c4dbedfc47bf

1000 stars spawn in, randomly distributed with a random distance which in turn determines x_velocity, transparency and size

Star ship stays at width/3 and moves up and down according to sin wave to begin with

Stars that have disappeared off the map are deleted from the array and are replaced by stars appearing at x = width + 5;
*/

String spaceship = "   __\n   |  \\\n=E[*|K)--.___\n=E[+,---------'\n  [|_/"
ArrayList<Star> starfield;
int starCount = 1000;

void setup(){
    size(1080, 720);
    stafield = new ArrayList<PVector>()
    initStarfield();

}

void draw(){
    background(0);
    drawStarField();

}

void initStarfield(){
    for(int i = 0; i < starCount; i++){
        stafield.add(new Star(random(1,20), new PVector(random(width), random(height)))));
    }
}

void drawStarfield(){
    for(int i = 0; i < starfield.size(); i++){
        starfield.get(i).update();
        starfield.get(i).show();
    }
}
