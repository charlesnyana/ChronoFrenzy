//M1: Player object
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
  playerHistory[0] = new PVector(player.position.x, player.position.y);

  // Shift the existing positions to make room for the new one
  for (int i = playerHistory.length - 1; i > 0; i--) {
    playerHistory[i] = playerHistory[i - 1].copy();
  }

  int newPlayerX = int(position.x + x);
  int newPlayerY = int(position.y + y);

  // Check if the destination is a wall or outside the map bounds
  if (isWall(newPlayerX, newPlayerY)) {
    // Destination is a wall or outside the map, do not update player position
    return;
  }

  // Destination is not a wall, update player position
  player.position.x = newPlayerX;
  player.position.y = newPlayerY;

  turnCount++;

  println("Player History:");
  for (int i = 0; i < playerHistory.length; i++) {
    println("Index " + i + ": (" + playerHistory[i].x + ", " + playerHistory[i].y + ")");
  }
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

  return false; // It's not a wall
}


// Update the player history
void updatePlayerHistory() {
  // Store the player's position in the playerHistory array
  playerHistory[0] = new PVector(position.x, position.y);

  // Shift the existing positions to make room for the new one
  for (int i = playerHistory.length - 1; i > 0; i--) {
    if (playerHistory[i - 1] != null) {
      playerHistory[i] = playerHistory[i - 1].copy();
    } else {
      playerHistory[i] = null; // Set null if the previous position is null
    }
  }
}
    
  
   void display() {
    fill(red, green, blue); //color of player
    ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
  }
}
