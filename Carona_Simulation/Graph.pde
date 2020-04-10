class Graph{
   
  
  float dayWidth;
  ArrayList<PVector> history;
  Graph(int uninfected_, int sick_, int recovered_){
    history = new ArrayList<PVector>();
    history.add(new PVector(uninfected_, sick_, recovered_));
    
    dayWidth = (width - 2*xOffset)/maxDays;
    println("Day Number: " + dayNum + "\t Record: " + history);
  }
  
  float getColumnHeight(float amount){
    return (height-20-(yOffset + 30))*amount/popSize;
  }
  
  void update(int uninfected_, int sick_, int recovered_){
    PVector record = new PVector(uninfected_, sick_, recovered_);
    history.add(record);
    println("Day Number: " + dayNum + "\t Record: " + record);
  }
  
  void show(){
    noStroke();
        
    for(int i = 0; i < dayNum; i++){
      PVector record = history.get(i);
      float uninfectedHeight = getColumnHeight(record.x);
      float sickHeight = getColumnHeight(record.y);
      float recoveredHeight = getColumnHeight(record.z);
          
      //uninfected bar
      fill(0, 255, 0);
      rect(xOffset+i*dayWidth, height-20 - sickHeight, dayWidth, -uninfectedHeight);
      
      //display sick people
      fill(255, 0, 0);
      rect(xOffset + i*dayWidth, height - 20, dayWidth, -sickHeight);
      
      //display recovered people
      fill(0, 0, 255);
      rect(xOffset + i*dayWidth, height - 20 - sickHeight - uninfectedHeight, dayWidth, -recoveredHeight);
    }
  }
  
  
}
