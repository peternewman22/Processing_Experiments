class Population {
  Meeple[] population;
  int uninfected, sick, recovered;

  Population() {
    recovered = 0;
    int count = 0;
    population = new Meeple[popSize];
    for(int i = 0; i < popSize; i++){
      population[i] = new Meeple(i);
      if(population[i].isSick){
        count++;
      }
    }
    sick = count;
    uninfected = popSize - sick;
  }

  void show() {
    noStroke();
    int sickCount = 0;
    int recoveredCount = 0;
    for (Meeple m : population) {
      m.update();
      m.show();
      if(m.isSick){
      sickCount ++;
    } else if(m.isRecovered){
      recoveredCount ++;
    }
    }
    sick = sickCount;
    recovered = recoveredCount;
    uninfected = popSize - sick - recovered;
    String record = ("Day Number: " + dayNum + "\t Uninfected: " + uninfected + "\t" +" Sick: " + sick + "\t" + " Recovered: " + recovered);
    fill(255);
    text(record, width/2, yOffset + 20);
  }
  
}
