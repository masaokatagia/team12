class Boss extends charactor {
  int size;
  Player target;
  PImage img;
  PImage laserImg;
  int fireInterval = 180;  // レーザー発射間隔（例: 3秒）
  int laserDuration = 30;  // レーザー表示時間（フレーム数）
  int lastShotFrame = -9999;
  boolean isFiring = false;
  int lastDamageFrame = 0;
  int damageCooldown = 30; // 30フレームごとにダメージ（0.5秒）
       
  Boss(int HP, int bulletSpeed, int weapon, int ap, int speed, int x, int y, Player target) {
    super(HP, bulletSpeed, weapon, ap, speed, x, y);
    this.size = 64;
    this.target = target;
    loadIMG();
  }

  void loadIMG() {
    img = loadImage("boss.png");
    laserImg = loadImage("lazer.png");
  }

  @Override
  void walk() {
    // 例: 自動で上下に動く
    if (target.y > y) y += speed;
    if (target.y < y) y -= speed;
  }

  @Override
  void attack() {
    if (frameCount - lastShotFrame >= fireInterval) {
      isFiring = true;
      lastShotFrame = frameCount;
    }
  }
/*
  void updateLaser() {
    // レーザーの有効時間が過ぎたら終了
    if (isFiring && frameCount - lastShotFrame > laserDuration) {
      isFiring = false;
    }

    // 当たり判定（レーザーが出ている間のみ）
    if (isFiring) {
      if (target.x + target.size > x + size / 2 - 5 && target.x < x + size / 2 + 5) {
        target.HP -= 1; // 毎フレーム少しずつダメージ
        println("Player hit by laser! HP: " + target.HP);
      }
    }
  }*/
  boolean isLaserHit(Player target) {
  float laserTop = y + size / 2 - 5;
  float laserBottom = y + size / 2 + 5;
  float targetLeft = target.x;
  float targetRight = target.x + target.size;
  float targetTop = target.y;
  float targetBottom = target.y + target.size;

  // 縦方向がレーザー範囲内かつ、横方向がレーザーの範囲（0〜x）に入っている
  return targetBottom > laserTop && targetTop < laserBottom &&
         targetRight > 0 && targetLeft < x;
}

  boolean display() {
    if (HP <= 0) return false;
    image(img, x, y, size, size);

    if (isFiring) {
      displayLaser();
    }
    return true;
  }

void displayLaser() {
  if (laserImg == null) return;

  float laserX = 0; // 左端から描画
  float laserY = y + size / 2 - laserImg.height / 2; // Bossの縦中心に合わせる

  float laserWidth = x; // Bossから左端までの距離
  float laserHeight = laserImg.height;

  image(laserImg, laserX, laserY, laserWidth, laserHeight);
}

  boolean isHit(Bullet b) {
    return b.x > x && b.x < x + size && b.y > y && b.y < y + size;
  }
}
