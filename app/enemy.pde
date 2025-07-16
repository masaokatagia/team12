class enemy extends charactor {
  int size;
  Player target;
  PImage img;
  PImage bulletImg;
  ArrayList<Bullet> bullets;
  int fireInterval = 60;
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
    if (target.y > y) y += speed;
    if (target.y < y) y -= speed;
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

//      if (target.isHit(b)) {
//        target.HP -= 10;
//        println("Player hit! HP: " + target.HP);
//        bullets.remove(i);
//        continue;
//     }

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

  boolean isHit(Bullet b) {
    return b.x > x && b.x < x + size && b.y > y && b.y < y + size;
  }
}
