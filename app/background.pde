class Stage {
PImage backgroundImg;
PImage obstacleImg;

int ox = 200, oy = 300;
int ow = 100, oh = 100;
Stage(String backgroundFile, String obstacleFile){
   obstacleImg = loadImage(obstacleFile);  
   backgroundImg = loadImage(backgroundFile); 
}

void drawBackstage() {
  image(backgroundImg, 0, 0);
}

void drawStage() {
  image(obstacleImg, 0, 0);
}
boolean isColliding(float px, float py, float pw, float ph) {
    return (px < ox + ow && px + pw > ox &&
            py < oy + oh && py + ph > oy);
  }
}
