class Door extends Tile {
  boolean isLocked;
  Key associatedKey; // New variable to store the associated key

  Door(float x, float y, int tileSize) {
    super(x, y, tileSize);
    isLocked = true;
  }

  // Method to check if the door is locked
  boolean isLocked() {
    return isLocked;
  }

  // Method to unlock the door (called when the player has the key)
  void unlock() {
    isLocked = false;
  }

  // Override the display method to visually represent the locked/unlocked state
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    if (isLocked) {
      fill(255, 200, 0); // Display locked doors in grey
    } else {
      fill(255, 200, 0); // Display unlocked doors in yellow
    }
    rect(posX, posY, tileSize, tileSize);
  }

  // Method to set the associated key
  void setKey(Key key) {
    this.associatedKey = key;
  }

  // Return the associated key
  Key getKey() {
    return associatedKey;
  }
  
  // Method to lock door for reset
  void lock() {
    isLocked = true;
  }
}
