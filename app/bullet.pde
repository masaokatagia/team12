class Bullet {
  float x, y;
  float speed;
  PImage img;

  Bullet(float startX, float startY,  float speedValue, PImage bulletImg) {
    x = startX;
    y = startY;
    speed = speedValue;
    img = bulletImg;
  }

  void shoot() {
    x += speed;
  }

 void display() {
     image(img, x - img.width / 2, y - img.height / 2);
  }
  
boolean isOffScreen() {
  return x <  -20  || x > width + 20;

  }
}
