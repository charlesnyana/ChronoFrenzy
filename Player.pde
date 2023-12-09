class Player {
  PVector position;
  int tileSize;
  color red = 255;
  color green = 0;
  color blue = 0;

  Player(int x, int y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  void movePlayer(int x, int y) {
    // Store the player's position in the playerHistory array
    playerHistory[0] = position.copy();

    // Shift the existing positions to make room for the new one
    System.arraycopy(playerHistory, 0, playerHistory, 1, playerHistory.length - 1);

    int newPlayerX = int(position.x + x);
    int newPlayerY = int(position.y + y);

    // Check if the destination is a wall or outside the map bounds
    if (isWall(newPlayerX, newPlayerY)) {
      // Destination is a wall or outside the map, do not update player position
      return;
    }

    // Check if the player is on the teleportation tile and teleportation hasn't occurred
    if (newPlayerX == 2 && newPlayerY == 3 && !teleportationOccurred) {
      // Teleport the player to (3, 5)
      position.set(3, 5);
      
      // Indicates that teleportation has occurred
      teleportationOccurred = true;
    } else {
      // Destination is not the teleportation tile, update player position
      position.set(newPlayerX, newPlayerY);
    }

    turnCount++;
  }

  boolean isWall(int x, int y) {
    // Check if the coordinates are outside the map bounds
    if (x < 0 || x >= numCols || y < 0 || y >= numRows) {
      return true; // It's outside the map, consider it a wall
    }

    // Check if the coordinates match any wall coordinates
    for (PVector wallCoordinate : wallCoordinates) {
      if (x == wallCoordinate.x && y == wallCoordinate.y) {
        return true; // It's a wall
      }
    }

    // Check if the coordinates correspond to a door
    if (tiles[x][y] instanceof Door) {
      Door door = (Door) tiles[x][y];
      
      // Check if the door is locked
      if (door.isLocked()) {
        return true; // Door is locked, consider it a wall
      }
    }

    return false; // It's not a wall
  }

  void updatePlayerHistory() {
    // Store the player's position in the playerHistory array
    playerHistory[0] = position.copy();

    // Shift the existing positions to make room for the new one
    System.arraycopy(playerHistory, 0, playerHistory, 1, playerHistory.length - 1);
  }
  
  void display() {
    fill(red, green, blue); //color of player
    ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
  }
}
