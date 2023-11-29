class Key extends Tile {
  Key(float x, float y, int tileSize) {
    super(x, y, tileSize);
  }

  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    noStroke();
    fill(0, 0, 255); // Display keys in blue
    ellipse(posX + tileSize / 2, posY + tileSize / 2, tileSize * 0.5, tileSize * 0.5);
  }
}

void setKey(Key keys) {
    this.keys = keys;
}
