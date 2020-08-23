class Board{
  Tile[][] board;
  
  Board(){
    board = new Tile[s][s];
    initBoard();
  }
  
  void initBoard(){
    for(int x = 0; x < s; x++){
      for(int y = 0; y < s; y++){
        board[x][y] = new Tile(x,y);
        //print("Tile created at (" + x + ", " + y + ")\n");  
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
  
  void updateBombCount(){
  for(int x = 0; x < s; x++){
      for(int y = 0; y < s; y++){
        board[x][y].countBombs();
      }
    }
  }

}
