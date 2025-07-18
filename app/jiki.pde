class Player extends charactor {
  PImage img;
  PImage bulletImg;
  int size = 50;
  ArrayList<Bullet> bullets;
  boolean isAttacking = false;
  float vy = 0;        
  float gravity = 1.0;  
  boolean isJumping = false;




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
    vy += gravity;
    y += vy;

    int groundY = getGroundY(x);
    if (y >= groundY - size) {
      y = groundY - size;
      vy = 0;
      isJumping = false;
    }

    x = constrain(x, 0, width - size);
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
    if (key == 'w' && !isJumping) {
      vy = -15;
      isJumping = true;
    }
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
