Stage stage;
Player player;
public enemy enemy1;
public Boss boss;
public int stageCount = 0;
boolean jiki_hp, enemy_hp, boss_hp;
PImage enemyBulletImg;
PImage jikiBulletImg;

void setup() {
    size(800, 600);
    stage = new Stage("background.png", "obstacle.png");
    
    jikiBulletImg = loadImage("bullet1.png");
    
    //プレイヤー（仮）
    player = new Player(100, 6, 3, 15, 4, 100, 0, jikiBulletImg);
    
    //弾画像の読み込み
    enemyBulletImg = loadImage("bullet1.png");
    
    //敵の生成
    enemy1 = new enemy(50, 4, 1, 10, 2, 700, 500, player, enemyBulletImg);
    boss = new Boss(50, 4, 1, 10, 2, 700, 500, player);
}

void draw() {
    stage.drawBackstage();
    stage.drawStage(); // 
    
    player.walk();
    jiki_hp = player.display();
    if (jiki_hp == false) {
        textSize(100);
        text("You Died.",400, 200);
        return;
    }
    player.handleInput();
    player.updateBullets();
    
    
    if (stageCount == 0) {
        enemy1.walk();
        enemy1.attack();
        enemy1.updateBullets();
        enemy1.display();
    }
    else if (stageCount == 1) {
        boss.walk();
        boss.attack();
        boss.updateLaser();
        boss_hp = boss.display();
    }
    else {
        text("YOU WIN", 300, 200);
    }
    
}
