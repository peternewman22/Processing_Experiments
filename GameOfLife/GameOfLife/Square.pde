class Square{
  //PVector location;
  int s;
  String label;
  boolean isAlive;
  
  Square(String label_, boolean isAlive_){
    label = label_;
    isAlive = isAlive_;
  }
  
  void toggleLivingStatus(){
    isAlive = !isAlive;
  }
 
  
}


    //isEdge = ((location.x == 0) || (location.y == 0) || (location.x == s-1) || (location.y == s-1));
    //isCorner = (((location.x == 0) || (location.x == s-1)) && ((location.y == 0) || (location.y == s-1))); 
