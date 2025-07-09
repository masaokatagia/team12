PImage jiki_img, enemy_img, middleBOSS_img, BOSS_img;

setup()
{
    
    charactor jiki = new jiki(enemy, BOSS);
    charactor enemy = new enemy();
    charactor BOSS = new BOSS();
    bullet jb = new bullet();
}

void draw()
{
    image(jiki)
}