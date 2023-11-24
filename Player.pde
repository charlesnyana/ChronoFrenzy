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

  void move(int x, int y) { //this function runs every time a key is pressed for movement
    // Store the player's position in the playerHistory array
    playerHistory[0] = new PVector(player.position.x, player.position.y);
    
    // Shift the existing positions to make room for the new one
    for (int i = playerHistory.length - 1; i > 0; i--) {
      playerHistory[i] = playerHistory[i - 1].copy();
  }
    
    int newPlayerX = int(position.x + x);
    int newPlayerY = int(position.y + y);
    
    position.x = newPlayerX; //updates the player location to new location
    position.y = newPlayerY;
    
   
    turnCount++;
}
    
    
  
   void display() {
    fill(red, green, blue); //color of player
    ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
  }
}
