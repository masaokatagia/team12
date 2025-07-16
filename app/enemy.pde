class enemy extends Character {
  int size;
  Player target;
  PImage img;
  PImage bulletImg;
  ArrayList<Bullet> bullets;
  int fireInterval = 60;  // 60フレームごと（1秒ごと）に発射
  int lastShotFrame = 0;

  enemy(int x, int y, Player target, PImage bulletImg) {
    super(50, 4, 1, 10, 2, x, y);
    this.size = 32;
    this.target = target;
    this.bulletImg = bulletImg;
    bullets = new ArrayList<Bullet>();
    loadIMG();
  }

  void loadIMG() {
    img = loadImage("enemy.png");
  }

  @Override
  void walk() {
    if (target.x > x) x += speed;
    if (target.x < x) x -= speed;
  }

  @Override
  void attack() {
    if (frameCount - lastShotFrame > fireInterval) {
      bullets.add(new Bullet(x + size / 2, y + size / 2, 3, bulletImg));
      lastShotFrame = frameCount;
    }
  }

  void updateBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.shoot();
      if (b.isOffScreen()) {
        bullets.remove(i);
      }
    }
  }

  void display() {
    image(img, x, y, size, size);
    for (Bullet b : bullets) {
      b.display();
    }
  }
}
