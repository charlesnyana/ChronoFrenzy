// Tile class (base class for various tiles)
class Tile {

  PVector position;
  int tileSize;

  // Constructor
  Tile(float x, float y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  // Display the tile
  void display() {
    // Will add code to display the tile
  }
}
