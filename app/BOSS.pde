class Boss extends charactor {
  int size;
  jiki target;
  PImage img;

  Boss(int x, int y, jiki target) {
    super(200, 3, 2, 20, 1, x, y);
    this.size = 64;
    this.target = target;
    loadIMG();
  }

  void loadIMG() {
    img = loadImage("boss.png");
  }

  @Override
  void walk() {
    // 遅く追尾
    if (target.y > y) y += speed;
    if (target.y < y) y -= speed;
  }

  @Override
  void attack() {
    println("BOSS attacks powerfully!");
  }

  void display() {
    image(img, x, y, size, size);
  }
}
