class Wall extends Tile {
  Wall(float x, float y, int tileSize) {
    super(x, y, tileSize);
  }

// This method displays the wall
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill(0);
    rect(posX, posY, tileSize, tileSize);
  }
}
