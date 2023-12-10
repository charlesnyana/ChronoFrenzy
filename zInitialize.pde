void initGame(){
  initGrid();
  initWalls();
  initDoors();
  initPlatform();
  
  player = new Player(0, 9, tileSize);
  
   // Initialize each element of playerHistory with a new PVector instance
  for (int i = 0; i < playerHistory.length; i++) {
    playerHistory[i] = new PVector(player.position.x, player.position.y);
  }
}
//M1: This function initializes the map
void initGrid() {
  tiles = new Tile[numCols][numRows]; // Generates the base grid. mostly as a guide for me but also the the map overlay
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      tiles[i][j] = new Tile(i, j, tileSize);
    }
  }
}
