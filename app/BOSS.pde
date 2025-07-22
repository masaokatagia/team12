class Boss extends Character {
  int size;
  Player target;
  float hitboxOffsetX = 10;  // 画像の左端からのズレ（X方向）
  float hitboxOffsetY = 15;  // 画像の上端からのズレ（Y方向）
  float hitboxWidth   = 44;  // 当たり判定の幅
  float hitboxHeight  = 40;  // 当たり判定の高さ
  PImage img;
  PImage laserImg;
  int fireInterval = 180;  // レーザー発射間隔（例: 3秒）
  int laserDuration = 600;  // レーザー表示時間（フレーム数）
  int lastShotFrame = -9999;
  boolean isFiring = false;
  int lastDamageFrame = 0;
  int damageCooldown = 6; // 30フレームごとにダメージ（0.5秒）
  float laserHitboxHeight = 10; 
       
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

  void updateLaser() {
  // レーザー終了タイミング
  if (isFiring && frameCount - lastShotFrame > laserDuration) {
    isFiring = false;
  }

  // 当たり判定（発射中のみ）
  if (isFiring) {
    float laserLeft = 0;
    float laserRight = x;
    float laserTop = y + size / 2 - laserHitboxHeight / 2;
      float laserBottom = y + size / 2 + laserHitboxHeight / 2;

    float targetLeft = target.x;
    float targetRight = target.x + target.size;
    float targetTop = target.y;
    float targetBottom = target.y + target.size;

    // 横方向にレーザーが当たっていて、縦方向にもかぶっていればヒット
    boolean isHit = targetRight > laserLeft && targetLeft < laserRight &&
                    targetBottom > laserTop && targetTop < laserBottom;

    if (isHit && frameCount - lastDamageFrame > damageCooldown) {
      target.HP -= this.ap;
      println("Player hit by laser! HP: " + target.HP);
      lastDamageFrame = frameCount;
    }
  }
}


  boolean display() {
    if (HP <= 0)
    {
      stageCount = 2;
     return false;
    }
    image(img, x, y, size, size);

    if (isFiring) {
      displayLaser();
    }
    return true;
  }

void displayLaser() {
  if (laserImg == null) return;

  float laserX = 0;
  float laserY = y + size / 2 - laserImg.height / 2;
  float laserWidth = x; // Bossのxまで
  float laserHeight = laserImg.height;

  image(laserImg, laserX, laserY, laserWidth, laserHeight);
}


  boolean isHit(Bullet b) {
  // 当たり判定の実際の座標を計算
  float hitboxX = this.x + this.hitboxOffsetX;
  float hitboxY = this.y + this.hitboxOffsetY;

  // 弾が当たり判定の範囲内にあるかチェック
  return b.x > hitboxX && b.x < hitboxX + this.hitboxWidth &&
         b.y > hitboxY && b.y < hitboxY + this.hitboxHeight;
}
}
