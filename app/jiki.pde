class Player extends charactor {
  PImage img;

  Player(int x, int y) {
    super(100, 6, 3, 15, 4, x, y);
    loadIMG();
  }

  @Override
  void attack() {
  }

  @Override
  void loadIMG() {
    img = loadImage("yuusya.png");
  }

  void display() {
    if (img != null) {
      image(img, x, y);
    } else {
      fill(0, 255, 0);
      rect(x, y, 50, 50);
    }
  }

  void handleInput() {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        x -= speed;
      } else if (key == 'd' || key == 'D') {
        x += speed;
      } else if (key == 'w' || key == 'W') {
        y -= speed;
      } else if (key == 's' || key == 'S') {
        y += speed;
      }
    }
  }
}
