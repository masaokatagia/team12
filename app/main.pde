PImage jiki_img, enemy_img, middleBOSS_img, BOSS_img;

setup()
{
    
    charactor jiki = new jiki();
    charactor enemy = new enemy();
    charactor middleBOSS = new middleBOSS();
    charactor BOSS = new BOSS();
    jiki.loadIMG();
    enemy.loadIMG();
    middleBOSS.loadIMG();
    BOSS.loadIMG();
}

void draw()
{
    image(jiki)
}