Stage stage;
Player player;
public enemy enemy1;
Boss boss;
PImage enemyBulletImg;
PImage jikiBulletImg;

void setup() {
  size(800, 600);
  stage = new Stage("background.png", "obstacle.png");
  
  jikiBulletImg = loadImage("bullet1.png");

  // プレイヤー（仮）
  player = new Player(100, 6, 3, 15, 4, 400, 500, jikiBulletImg);

  // 弾画像の読み込み
  enemyBulletImg = loadImage("bullet1.png");

  // 敵の生成
  enemy1 = new enemy(100, 100, player, enemyBulletImg);
  boss = new Boss(100, 100, player);
}

void draw() {
  stage.drawBackstage();
   stage.drawStage(); // 

  player.walk();
  player.display();
  player.handleInput();
  player.updateBullets();

  enemy1.walk();
  enemy1.attack();
  enemy1.updateBullets();
  enemy1.display();

}
