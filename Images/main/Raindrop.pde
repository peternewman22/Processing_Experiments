class Raindrop extends Particle{

  Raindrop(PVector start_, float mass){
    super(start_, mass);
  }
  
  void display(){
    imageMode(CENTER);
    image(cloud, loc.x, loc.y);
  }
}
