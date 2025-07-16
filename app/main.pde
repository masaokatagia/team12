Stage stage;
Player player;
enemy enemy1;
Boss boss;
PImage enemyBulletImg;

void setup() {
  size(800, 600);
  stage = new Stage("background.png", "obstacle.png");

  // プレイヤー（仮）
  player = new Player(400, 500);

  // 弾画像の読み込み
  enemyBulletImg = loadImage("bullet1.png");

  // 敵の生成
  enemy1 = new enemy(100, 100, player, enemyBulletImg);
  boss = new Boss(100, 100, player);
}

void draw() {
  stage.drawBackstage();

  player.walk();
  player.display();

  enemy1.walk();
  enemy1.attack();
  enemy1.updateBullets();
  enemy1.display();

  stage.drawStage(); // 障害物など前景の描画
}
