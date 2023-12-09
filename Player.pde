// Player class
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
  
  // Merged the functions of moving and updating the player history when player moves
  void moveAndTrack(int x, int y, Platform platform) {
    // Store the player's position in the playerHistory array
    playerHistory[0] = new PVector(position.x, position.y);
    updatePlayerHistory();

    // Shift the existing positions to make room for the new one
    for (int i = playerHistory.length - 1; i > 0; i--) {
      if (playerHistory[i - 1] != null) {
        playerHistory[i] = playerHistory[i - 1].copy();
      } else {
        playerHistory[i] = null; // Set null if the previous position is null
      }
    }

    int newPlayerX = int(position.x + x);
    int newPlayerY = int(position.y + y);

    // Check if the destination is a wall or outside the map bounds
    if (isWall(newPlayerX, newPlayerY) || isFailCondition(newPlayerX, newPlayerY, platform)) {
      // Destination is a wall, outside the map, or fail condition met; do not update player position
      return;
    }
    
    // Check if the player is on a fail trigger tile
    if (isFailTrigger(newPlayerX, newPlayerY, platform)) {
      // Trigger the fail state
      fail = true;
      return;
    }

    // Check if the player is on the teleportation tile and teleportation hasn't occurred
    if (newPlayerX == 2 && newPlayerY == 3 && !teleportationOccurred) {
      // Teleport the player to (3, 5)
      position.x = 3;
      position.y = 5;
      
      // Indicates that teleportation has occurred
      teleportationOccurred = true;
    } else {
      // Destination is not the teleportation tile or fail trigger, update player position
      position.x = newPlayerX;
      position.y = newPlayerY;
    }

    // Check if the player is on a key tile
    Tile playerTile = tiles[(int) position.x][(int) position.y];
    if (playerTile instanceof Key) {
      Key key = (Key) playerTile;
      if (!key.isCollected()) {
        // Unlock the associated door
        if (key.hasDoor()) {
          key.getDoor().unlock();
          // Removes key from grid
          tiles[(int) position.x][(int) position.y] = new Tile(position.x, position.y, tileSize);
          // Set the key as collected
          key.setCollected(true);
        }
      }
    }

    turnCount++;

    println("Player History:");
    for (int i = 0; i < playerHistory.length; i++) {
      println("Index " + i + ": (" + playerHistory[i].x + ", " + playerHistory[i].y + ")");
    }
  }

  boolean isWall(int x, int y) {
    if (x < 0 || x >= numCols || y < 0 || y >= numRows) {
      return true;
    }

    for (PVector wallCoordinate : wallCoordinates) {
      if (x == wallCoordinate.x && y == wallCoordinate.y) {
        return true;
      }
    }

    if (tiles[x][y] instanceof Door) {
      Door door = (Door) tiles[x][y];
      if (door.isLocked()) {
        return true;
      }
    }

    return false;
  }

  void updatePlayerHistory() {
    playerHistory[0] = position.copy();

    for (int i = playerHistory.length - 1; i > 0; i--) {
      playerHistory[i] = (playerHistory[i - 1] != null) ? playerHistory[i - 1].copy() : null;
    }
  }

  void display() {
    fill(red, green, blue);
    ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
  }
}
