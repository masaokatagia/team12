class Player extends charactor {
  PImage img;
  PImage bulletImg;
  int size = 50;
  ArrayList<Bullet> bullets;
  boolean isAttacking = false;


  Player(int HP, int bulletSpeed, int weapon, int ap, int speed, int x, int y, PImage bulletImg) {
    super(HP, bulletSpeed, weapon, ap, speed, x, y);
    this.bulletImg = bulletImg;
    this.bullets = new ArrayList<Bullet>();
    loadIMG();
  }

  @Override
  void attack() {
    // 上方向に発射（y軸マイナス）
    bullets.add(new Bullet(x + size / 2, y, bulletSpeed, bulletImg));
  }

  void updateBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.shoot();
      if (b.isOffScreen()) {
        bullets.remove(i);
      }
      if (enemy1.isHit(b) && enemy1.HP > 0) {
        enemy1.HP -= this.ap;
       println("Player hit! HP: " + enemy1.HP);
        bullets.remove(i);
        continue;
     }
     if (boss.isHit(b) && boss.HP > 0) {
        boss.HP -= this.ap;
       println("Player hit! HP: " + boss.HP);
        bullets.remove(i);
        continue;
    }
  }

  void displayBullets() {
    for (Bullet b : bullets) {
      b.display();
    }
  }

  @Override
  void loadIMG() {
    img = loadImage("yuusya.png");
  }

  void walk() {
    if (keyPressed) {
      if (key == 'a') x -= speed;
      if (key == 'd') x += speed;
      if (key == 'w') y -= speed;
      if (key == 's') y += speed;
    }
    x = constrain(x, 0, width - size);

    // 台の傾きに沿ってy座標を調整
    y = getGroundY(x) - size;
  }
 int  getGroundY(int px) {
  // 台の範囲外では固定
  if (px < 60) return 300;
  if (px > 440) return 600;

  return (int)(0.8 * px + 250);
}

  void handleInput() {
  if (keyPressed) {
    if (key == 'a') x -= speed;
    if (key == 'd') x += speed;
    if (key == 'w') y -= speed;
    if (key == 's') y += speed;
    if (key == ' ') {
      if (!isAttacking) {
        attack();
        isAttacking = true;
      }
    }
  } else {
    isAttacking = false;
  }
}

  boolean display() {
    if (HP <= 0) {
      return false;
    }
    if (img != null) {
      image(img, x, y, size, size);
    } else {
      fill(0, 255, 0);
      rect(x, y, size, size);
    }
    displayBullets();
    return true;
  }

  boolean isHit(Bullet b) {
    return b.x > x && b.x < x + size && b.y > y && b.y < y + size;
  }
}
}