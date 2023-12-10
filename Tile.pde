// Tile tab: encapsulates tile object, which serves as the base of the other objects for display.
class Tile {
  PVector position;
  int tileSize;

  Tile(float x, float y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  // Add a getter method for the position variable
  PVector getPosition() {
    return position;
  }

  void display() {
    stroke(20);
    fill(170);
    rect(position.x * tileSize, position.y * tileSize, tileSize, tileSize);
  }
}
