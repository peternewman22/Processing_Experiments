class Gameboard{
  Tile[][] board;
  
  Gameboard(){
    board = new Tile[s][s];
    initGameboard();
  }
  
  void initGameboard(){
    for(int x = 0; x < s; x++){
      for(int y = 0; y < s; y++){
        board[x][y] = new Tile(x,y);
      }
    }
  }
  
  void show(){
    for(int x = 0; x < s; x++){
      for(int y = 0; y < s; y++){
        board[x][y].show();
      }
    }
  }
  
  void updateNeighbourCount(){
    for(int x = 0; x < s; x++){
      for(int y = 0; y < s; y++){
        board[x][y].countNeighbours();
      }
    }
  }
   
}
