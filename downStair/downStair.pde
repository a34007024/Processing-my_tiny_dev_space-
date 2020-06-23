PImage wall,topNail,playerDefault,playerLeft,playerLeftRun,playerRight,playerRightRun;
PImage platformFake,platformJump,platformLeft,platformNail,platformRight,platformTrue;
float playerX ,playerY = 50,fallingSpeed = 3;
boolean playerMoveLeft = false,playerMoveRight = false;
int score = 0,playerHealth = 10,level = 1;
int r=0,g=0,b=0;
int premillis;
platform[] p = new platform[20];
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
  p[0] = new platform(6,width/2-platformTrue.width/2,height);
  //the start-up platform must be true platform and appear in the middle
  for(int i=1;i < p.length;i++){
    p[i] = new platform(height + i*120);
    //p[i] = new platform(5,width-wall.width-platformRight.width,height + i*120);
  }
}

void draw(){
  background(r,g,b);
  image(wall,0,0);
  image(wall,width-wall.width,0);
  image(topNail,0+wall.width,0);
  if(playerY < topNail.height){
    playerHealth -= level;
    playerY += playerDefault.height;
  }
  if(playerMoveLeft){
    if(frameCount%10<=5)image(playerLeft,playerX,playerY);
    else image(playerLeftRun,playerX,playerY);
    if(playerX >= wall.width)playerX -= 3;
  }
  else if(playerMoveRight){
    if(frameCount%10<=5)image(playerRight,playerX,playerY);
    else image(playerRightRun,playerX,playerY);
    if(playerX + playerDefault.width <= width-wall.width)playerX += 3;
  }
  else{
    image(playerDefault,playerX,playerY);
  }
  
  for(int i=0;i < p.length;i++){
    p[i].update();
    if(p[i].platformY <= -1750)p[i] = new platform();//renew the platform
  }
  playerY += fallingSpeed;//falling down
  if(fallingSpeed < 9.8)fallingSpeed += 0.3;//simulate gravity(mabe OwO)
  
  if(mousePressed){//debug
    playerX = mouseX;
    playerY = mouseY;
  }
  
  if(frameCount % 30 ==0)score += level;// score += level per 0.5 second
  if(score > 50 && score < 150)level = 2;
  else if(score > 150 && score < 300)level = 3;
  else if(score > 300)level = score/100;
  printInfo();
  judgePlayerDead();
}

void keyPressed(){
  switch(keyCode){
    case LEFT:
      playerMoveLeft = true;
      playerMoveRight = false;
      break;
    case RIGHT:
      playerMoveRight = true;
      playerMoveLeft = false;
      break;
    default:
      playerMoveRight = false;
      playerMoveLeft = false;
      break;
  }
}

void keyReleased(){
  playerMoveRight = false;
  playerMoveLeft = false;
}

void printInfo(){
  textSize(20);
  text("Time:"+millis()/1000+"."+millis()%1000+"s",wall.width,33);
  text("Health:"+playerHealth,wall.width,53);
  text("Score :"+score,wall.width,73);
  text("Level :"+level,wall.width,93);
  text(keyCode,wall.width,113);
}

void judgePlayerDead(){
  if(playerY >= height + playerDefault.height)playerHealth = 0;
  if(playerHealth <= 0){
    textSize(50);
    text("Game Over",80,height/2);
    noLoop();
  }
}
