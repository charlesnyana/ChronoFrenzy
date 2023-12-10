// Key tab: encapsulates key object along with the logic associated with them.
class Key extends Tile {
  Door associatedDoor; // New variable to store the associated door
  boolean isCollected;

  Key(float x, float y, int tileSize) {
    super(x, y, tileSize);
    this.isCollected = false;
  }

  void setAssociatedDoor(Door door) {
    this.associatedDoor = door;
  }

  // Check if the key has an associated door
  boolean hasDoor() {
    return associatedDoor != null;
  }

  // Return the associated door
  Door getDoor() {
    return associatedDoor;
  }

  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    noStroke();
    fill(0, 0, 255); // Display keys in blue
    ellipse(posX + tileSize / 2, posY + tileSize / 2, tileSize * 0.5, tileSize * 0.5);
  }
  
  // Method to check if the key is collected
  boolean isCollected() {
    return isCollected;
  }

  // Method to set the key as collected
  void setCollected(boolean collected) {
    isCollected = collected;
  }
  
  // Method to reset the key's state
  void reset() {
    isCollected = false;
  }
}

void checkForKey() {
  Tile playerTile = tiles[(int) player.position.x][(int) player.position.y];
  if (playerTile instanceof Key) {
    Key key = (Key) playerTile;
    if (!key.isCollected()) {
      if (key.hasDoor()) {
        key.getDoor().unlock();
        tiles[(int) player.position.x][(int) player.position.y] = new Tile(player.position.x, player.position.y, tileSize);
        key.setCollected(true);
      }
    }
  }
}
