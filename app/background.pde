class Stage {
PImage backgroundImg;
PImage obstacleImg;

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
}
