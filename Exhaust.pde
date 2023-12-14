class Exhaust extends Tile {
  int cooldown;
  boolean active;

  Exhaust(float x, float y, int tileSize) {
    super(x, y, tileSize);
    this.cooldown = 0;
    this.active = false;
  }

  void update() {
    if (cooldown > 0) {
      cooldown--;
    } else {
      active = !active;
      cooldown = 3;
    }
  }

  boolean isActive() {
    return active;
  }

  void display() {
    float posX = 8 * tileSize;
    float posY = 4 * tileSize;
    //stroke(0);
    if (active) {
    image(exhaustTileB, posX, posY, tileSize*2, tileSize*2);
    } else {
    image(exhaustTile, posX, posY, tileSize*2, tileSize*2);
    }
    
    //rect(posX, posY, tileSize, tileSize);
  }
}

void initExhaust() {
  exhaust = new Exhaust(8, 4, tileSize);
  exhaust = new Exhaust(9, 4, tileSize);
  exhaust = new Exhaust(8, 5, tileSize);
  exhaust = new Exhaust(9, 5, tileSize);
  tiles[8][4] = exhaust;
  tiles[9][4] = exhaust;
  tiles[8][5] = exhaust;
  tiles[9][5] = exhaust;
}

void updateExhaust() {
  if (exhaust != null) {
    exhaust.update();
    if (exhaust.isActive()) {
      //println("Exhaust active");
    } else {
      //println("Exhaust inactive");
    }
  }
}
