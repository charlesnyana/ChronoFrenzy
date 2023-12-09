// Key class (inherits from Tile)
class Key extends Tile {
  Door associatedDoor;
  boolean isCollected;

  Key(float x, float y, int tileSize) {
    super(x, y, tileSize);
    this.isCollected = false;
  }

  void setAssociatedDoor(Door door) {
    this.associatedDoor = door;
  }

  boolean hasDoor() {
    return associatedDoor != null;
  }

  Door getDoor() {
    return associatedDoor;
  }

  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    noStroke();
    fill(0, 0, 255);
    ellipse(posX + tileSize / 2, posY + tileSize / 2, tileSize * 0.5, tileSize * 0.5);
  }

  boolean isCollected() {
    return isCollected;
  }

  void setCollected(boolean collected) {
    isCollected = collected;
  }

  void reset() {
    isCollected = false;
  }
}
