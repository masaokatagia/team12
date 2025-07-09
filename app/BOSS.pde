enemy(int HP, int bulletSpeed, int weapon, int ap, int speed, int size, int x, int y)
{
    super(HP, bulletSpeed, weapon, ap, speed, size, x, y);
    this.size = size;
    this.img = loadImage("BOSS.png");
}