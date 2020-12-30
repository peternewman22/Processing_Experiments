class System{
  int planetCount;
  ArrayList<Planet> planets;
  
  System(){
    planets = new ArrayList<Planet>();
  }
  
  void show(){
    for(Planet p: planets){
      p.update();
      p.show();
    }
  }

}
