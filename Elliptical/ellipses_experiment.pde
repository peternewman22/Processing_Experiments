float r, e, a, b, theta;
void setup(){
    size(1000,1000);
    a = 300;
    e = 0.5;
    theta = 0;
    b = sqrt(sq(a)*(1-sq(e)));
    
    

}


void draw(){
    background(0);

    pushMatrix();
        translate(width/2, height/2);
        ellipse(0,0,a,b);
    popMatrix();   
}

float calculateR(){
    r = (a*(1-sq(e)))/(1+e*cos(theta));
    return r;
}