class Key extends Tile {
  Door associatedDoor; // New variable to store the associated door

  Key(float x, float y, int tileSize) {
    super(x, y, tileSize);
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
}
