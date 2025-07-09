int size;
PImage img;

enemy(int HP, int bulletSpeed, int weapon, int ap, int speed, int size, int x, int y)
{
    super(HP, bulletSpeed, weapon, ap, speed, size, x, y);
    this.size = size;
    this.img = loadImage("enemy.png");
}

void walk()
{
    this.x += this.speed;
    image(img, this.x, this.y, this.size, this.size);
}

void attack()
{
    bullet b = new bullet();
    b.shoot();
}