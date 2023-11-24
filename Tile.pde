class Tile {
  PVector position;
  int tileSize;

  Tile(float x, float y, int tileSize) {
    position = new PVector(x, y);
    this.tileSize = tileSize;
  }

  void display() {
    stroke(20);
    noFill();
    rect(position.x * tileSize, position.y * tileSize, tileSize, tileSize);
  }
} 
