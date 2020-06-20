PImage wall,topNail,playerDefault,playerLeft,playerLeftRun,playerRight,playerRightRun;
PImage platformFake,platformJump,platformLeft,platformNail,platformRight,platformTrue;
float playerX ,playerY = 50;
void setup(){
  wall = loadImage("images/wall.png");
  topNail = loadImage("images/top-nail.png");
  playerDefault = loadImage("images/player-default.png");
  playerLeft = loadImage("images/player-left.png");
  playerLeftRun = loadImage("images/player-leftRun.png");
  playerRight = loadImage("images/player-right.png");
  playerRightRun = loadImage("images/player-rightRun.png");
  platformFake = loadImage("images/platform-fake.png");
  platformJump = loadImage("images/platform-jump.png");
  platformLeft = loadImage("images/platform-left.png");
  platformNail = loadImage("images/platform-nail.png");
  platformRight = loadImage("images/platform-right.png");
  platformTrue = loadImage("images/platform-true.png");
  size(436,640,P2D);//topNail.width + wall.width*2
  playerX = width/2-playerDefault.width/2;
}

void draw(){
  background(0);
  image(wall,0,0);
  image(wall,width-wall.width,0);
  image(topNail,0+wall.width,0);
  
  if(keyPressed){
    if(keyCode == LEFT){
      if(frameCount%10<=5)image(playerLeft,playerX,playerY);
      else image(playerLeftRun,playerX,playerY);
      if(playerX >= wall.width)playerX -= 3;
    }
    else if(keyCode == RIGHT){
      if(frameCount%10<=5)image(playerRight,playerX,playerY);
      else image(playerRightRun,playerX,playerY);
      if(playerX + playerDefault.width <= width-wall.width)playerX += 3;
    }
  }
  else{
    image(playerDefault,playerX,playerY);
    
  }
  if(playerY+playerDefault.height <= height)playerY += 3;//falling down
}
