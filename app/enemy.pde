class enemy extends charactor {
  int size;
  jiki target;
  PImage img;

  enemy(int x, int y, jiki target) {
    super(50, 4, 1, 10, 2, x, y);
    this.size = 32;
    this.target = target;
    loadIMG();
  }

  void loadIMG() {
    img = loadImage("enemy.png");
  }

  @Override
  void walk() {
    // プレイヤーに向かって移動する簡易AI
    if (target.y > y) y += speed;
    if (target.y < y) y -= speed;
  }

  @Override
  void attack() {
    // 例：bullet 発射処理は未実装だがここで呼ぶ
    println("enemy attacks");
  }

  void display() {
    image(img, x, y, size, size);
  }
}
