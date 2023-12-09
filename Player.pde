// Player class
class Player {

  PVector position;
  int tileSize;

  // Constructor
  Player(int x, int y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  // Update player position and perform other player-related logic
  void update() {
    // Will add code to update player position, check for collisions, etc.
  }

  // Display the player
  void display() {
    // Will add code to display the player
  }
}
