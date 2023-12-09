void initializeGame() {
  initGrid();
  initWalls();
  initDoorsAndKeys();
  initPlatform();
  initPlayer();
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

void initDoorsAndKeys() {
  Door door1 = new Door(6, 8, tileSize);
  Door door2 = new Door(0, 6, tileSize);
  Key key1 = new Key(9, 9, tileSize);
  Key key2 = new Key(2, 5, tileSize);

  door1.setKey(key1);
  door2.setKey(key2);

  key1.setAssociatedDoor(door1);
  key2.setAssociatedDoor(door2);

  tiles[6][8] = door1;
  tiles[0][6] = door2;
  tiles[9][9] = key1;
  tiles[2][5] = key2;
}

void initPlatform() {
  Platform platform = new Platform(5, 2, tileSize, new PVector[]{new PVector(5, 2), new PVector(5, 1), new PVector(5, 0), new PVector(5, 1)});
  tiles[5][2] = platform;
}

void initPlayer() {
  player = new Player(0, 9, tileSize);

  for (int i = 0; i < playerHistory.length; i++) {
    playerHistory[i] = new PVector(player.position.x, player.position.y);
  }
}


void initWalls() {
  wallCoordinates = new ArrayList<PVector>();
  
  wallCoordinates.add(new PVector(0, 8)); 
  wallCoordinates.add(new PVector(1, 8)); 
  wallCoordinates.add(new PVector(2, 8)); 
  wallCoordinates.add(new PVector(3, 8));
  wallCoordinates.add(new PVector(4, 8));
  wallCoordinates.add(new PVector(5, 8));
  wallCoordinates.add(new PVector(7, 8));
  wallCoordinates.add(new PVector(8, 8));
  wallCoordinates.add(new PVector(9, 8));
  wallCoordinates.add(new PVector(5, 7));
  wallCoordinates.add(new PVector(5, 6));
  wallCoordinates.add(new PVector(6, 6));
  wallCoordinates.add(new PVector(7, 6));
  wallCoordinates.add(new PVector(7, 5));
  wallCoordinates.add(new PVector(6, 5));
  wallCoordinates.add(new PVector(6, 4));
  wallCoordinates.add(new PVector(7, 4));
  wallCoordinates.add(new PVector(7, 3));
  wallCoordinates.add(new PVector(6, 3));
  wallCoordinates.add(new PVector(6, 2));
  wallCoordinates.add(new PVector(7, 2));
  wallCoordinates.add(new PVector(5, 3));
  wallCoordinates.add(new PVector(4, 2));
  wallCoordinates.add(new PVector(4, 3));
  wallCoordinates.add(new PVector(4, 1));
  wallCoordinates.add(new PVector(3, 1));
  wallCoordinates.add(new PVector(3, 2));
  wallCoordinates.add(new PVector(2, 2));
  wallCoordinates.add(new PVector(1, 2));
  wallCoordinates.add(new PVector(3, 3));
  wallCoordinates.add(new PVector(3, 4));
  wallCoordinates.add(new PVector(2, 4));
  wallCoordinates.add(new PVector(1, 4));
  wallCoordinates.add(new PVector(1, 5));
  wallCoordinates.add(new PVector(1, 6));
  wallCoordinates.add(new PVector(2, 6));
  wallCoordinates.add(new PVector(3, 6));

  // Create Wall objects and place them on the grid
  for (PVector wallCoordinate : wallCoordinates) {
    int x = (int) wallCoordinate.x;
    int y = (int) wallCoordinate.y;
    tiles[x][y] = new Wall(x, y, tileSize);
  }
}
