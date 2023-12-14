//Player tab: encapsulates the player object and contains the collision logic alongside other relevant functions.
class Player {
  PVector position;
  int tileSize;

  Player(int x, int y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  void movePlayer(int x, int y) {

    if (startScreen) {
      // Destination is a wall or outside the map, do not update player position
      return;
    }
    
    shiftPlatform();
    
    int newPlayerX = int(position.x + x);
    int newPlayerY = int(position.y + y);
    println("new player X " + newPlayerX + ", new player Y " + newPlayerY);
    println("Face: " + face);

    // Check if the destination is a wall or outside the map bounds
    if (isWall(newPlayerX, newPlayerY)) {
      // Destination is a wall or outside the map, do not update player position
      return;
    }

    // This section checks for events.

    //Checks if player is on Row 4 exhaust fans
    if (exhaust != null && exhaust.isActive() && newPlayerY == 4 && (newPlayerX == 8 || newPlayerX == 9)) {
      // Force the player to enter the fail state
      fail = true;
      return;
    }
    
      if (currentPlatformX == newPlayerX && currentPlatformY == newPlayerY) {
        println("player is on platform");
        
      } else if((newPlayerY == 0 || newPlayerY == 1 || newPlayerY == 2) && newPlayerX == currentPlatformX) {
         println("player is not on platform");
         fail = true;
      }

    if (newPlayerX == 9 && newPlayerY == 9 && !trapOccured) {

      wallCoordinates.add(new PVector(7, 9));
      tiles[7][9] = new Wall(7, 9, tileSize);

      trapOccured = true;
    }

    // Check if the player is on the teleportation tile and teleportation hasn't occurred
    if (newPlayerX == 2 && newPlayerY == 3 && !teleportationOccurred) {
      // Teleport the player to (3, 5)
      player.position.x = 3;
      player.position.y = 5;

      // Iindicates that teleportation has occurred
      teleportationOccurred = true;
    } else {
      // Store the player's position in the playerHistory array
      playerHistory[0] = new PVector(player.position.x, player.position.y);

      // Shift the existing positions to make room for the new one
      for (int i = playerHistory.length - 1; i > 0; i--) {
        playerHistory[i] = playerHistory[i - 1].copy();
      }
      // Destination is not the teleportation tile, update player position
      player.position.x = newPlayerX;
      player.position.y = newPlayerY;
    }

    checkForKey();
    updateExhaust();
    recallCooldown--;
    turnCount++;
    
    //println("This is turn " + turnCount);

    //println("Player History:");
    //for (int i = 0; i < playerHistory.length; i++) {
    //  println("Index " + i + ": (" + playerHistory[i].x + ", " + playerHistory[i].y + ")");
    //}
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

  void display() {
    //fill(red, green, blue); //color of player
    //ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
    //int face = faceInput;
    switch(face) { //0 is left, 1 is right, 2 is up, 3 is down
      case 0:
        image(playerLeft, position.x * tileSize, position.y * tileSize);
        println("img swap left");
        break;
        
        case 1:
        image(playerRight, position.x * tileSize, position.y * tileSize);
        println("img swap right");
        break;
        
        case 2:
        image(playerUp, position.x * tileSize, position.y * tileSize);
        println("img swap up");
        break;
        
        case 3:
        image(playerDown, position.x * tileSize, position.y * tileSize);
        println("img swap dwn");
        break;
    }
      
  }
}
