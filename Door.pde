// Door class (inherits from Tile)
class Door extends Tile {
  boolean isLocked;
  Key associatedKey;

  Door(float x, float y, int tileSize) {
    super(x, y, tileSize);
    isLocked = true;
  }

  boolean isLocked() {
    return isLocked;
  }

  void unlock() {
    isLocked = false;
  }

  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill((isLocked) ? color(255, 200, 0) : color(255, 255, 0)); 
    rect(posX, posY, tileSize, tileSize);
  }

  void setKey(Key key) {
    this.associatedKey = key;
  }

  Key getKey() {
    return associatedKey;
  }

  void lock() {
    isLocked = true;
  }
}
