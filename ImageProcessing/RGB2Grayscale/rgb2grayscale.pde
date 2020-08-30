PImage img;

void setup(){
    size(298,230);
    img = loadImage("green_leaf.jpg");
}

void draw(){
    background(0);
    loadPixels();
    img.loadPixels();
    for (int y = 0; y < height; y++){
        for(int x = 0; x < width; x++){
            int loc = x + y*width;
            float r = red(img.pixels[loc]);
            float g = green(img.pixels[loc]);
            float b = blue(img.pixels[loc]);
            // float grayscale = (r+g+b)/3; //average method
            float grayscale = 0.3*r+0.6*g+0.1*b; //weighted average method
            pixels[loc] = color(grayscale);
        }
    }
    updatePixels();
}