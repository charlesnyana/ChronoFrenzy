PImage floorTile;

PImage wallTile;

PImage doorTile;
PImage doorTileOpen;

PImage exhaustTile;
PImage exhaustTileB;

PImage pitTile1;
PImage pitTile2;
PImage pitTile3;

PImage keyTile;

PImage portal;
PImage portalOff;

PImage reactor;
PImage recallTile;

PImage playerLeft;
PImage playerRight;
PImage playerUp;
PImage playerDown;

PImage startImg;
PImage endImg;
PImage failImg;

void initAssets() {
floorTile = loadImage("Assets/Floortiles.png");
wallTile = loadImage("Assets/wallTile.png");

doorTile = loadImage("Assets/doorTile.png");
doorTileOpen = loadImage("Assets/doorTileOpen.png");

exhaustTile = loadImage("Assets/exhaustTile.png");
exhaustTileB = loadImage("Assets/exhaustTileB.png");

pitTile1 = loadImage("Assets/pitTile1.png");
pitTile2 = loadImage("Assets/pitTile2.png");
pitTile3 = loadImage("Assets/pitTile3.png");

keyTile = loadImage("Assets/keyTile.png");

portal = loadImage("Assets/portal.png");
portalOff = loadImage("Assets/portalOff.png");

reactor = loadImage("Assets/Reactor.png");

playerLeft = loadImage("Assets/playerLeft.png");
playerRight = loadImage("Assets/playerRight.png");
playerUp = loadImage("Assets/playerUp.png");
playerDown = loadImage("Assets/playerDown.png");

recallTile = loadImage("Assets/recallTile.png");

startImg = loadImage("Assets/titleScreen.png");
endImg = loadImage("Assets/endScreen.png");
failImg = loadImage("Assets/failScreen.png");
}
