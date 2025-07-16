jiki player;
enemy e1;
BOSS boss1;

void setup() {
  size(800, 600);
  player = new jiki(400, 500);
  e1 = new enemy(100, 100, player);
  boss1 = new Boss(300, 100, player);
}

void draw() {
  background(255);
  player.walk();
  player.display();

  e1.walk();
  e1.attack();
  e1.display();

  boss1.walk();
  boss1.attack();
  boss1.display();
}
