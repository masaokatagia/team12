class enemy extends charactor {
  int size;
  Player target;
  PImage img;
  PImage bulletImg;
  ArrayList<Bullet> bullets;
  int fireInterval = 60;
  int lastShotFrame = 0;

  enemy(int HP, int bulletSpeed, int weapon, int ap, int speed, int x, int y, Player target, PImage bulletImg) {
    super(HP, bulletSpeed, weapon, ap, speed, x, y);
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
      bullets.add(new Bullet(x + size / 2, y + size / 2, -bulletSpeed, bulletImg));
      lastShotFrame = frameCount;
    }
  }

  void updateBullets() {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.shoot();

    // 敵に当たったらダメージ
    if (target.isHit(b)) {
      target.HP -= this.ap;
      println("Enemy hit! HP: " + target.HP);
      bullets.remove(i);
      continue;
    }

    if (b.isOffScreen()) {
      bullets.remove(i);
    }
  }
}

  void display() {
  if (this.HP <= 0) 
  {
    stageCount = 1;
    return; // HP 0なら表示しない
  }
  image(img, x, y, size, size);
  for (Bullet b : bullets) {
    b.display();
  }
}



  boolean isHit(Bullet b) {
  float bw = b.img.width;
  float bh = b.img.height;
  float bx = b.x - bw / 2;
  float by = b.y - bh / 2;

  return bx + bw > x && bx < x + size &&
         by + bh > y && by < y + size;
}

}
