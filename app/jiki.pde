class Player extends charactor {
  PImage img;

  jiki(int x, int y) {
    super(100, 6, 3, 15, 4, x, y);
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
      // 画像が読み込めなかったときの代替表示
      fill(0, 255, 0);
      rect(x, y, 50, 50);
    }
  }
}
