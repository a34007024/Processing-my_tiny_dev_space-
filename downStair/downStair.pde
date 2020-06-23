PImage wall, topNail, playerDefault, playerLeft, playerLeftRun, playerRight, playerRightRun;
PImage platformFake, platformJump, platformLeft, platformLeft2, platformNail, platformRight, platformRight2, platformTrue;
PImage bg1, bg2, bg3;
float playerX, playerY = 50, fallingSpeed = 3;
boolean playerMoveLeft = false, playerMoveRight = false;
boolean gameOver = false, gameStart = false;
int score = 0, playerHealth = 10, level = 1;
int r=0, g=0, b=0;
int premillis;
platform[] p = new platform[20];
void setup() {
  background(0);
  bg1 = loadImage("images/bg1.jpg");
  bg2 = loadImage("images/bg2.jpg");
  bg3 = loadImage("images/bg3.jpg");
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
  platformLeft2 = loadImage("images/platform-left2.png");
  platformNail = loadImage("images/platform-nail.png");
  platformRight = loadImage("images/platform-right.png");
  platformRight2 = loadImage("images/platform-right2.png");
  platformTrue = loadImage("images/platform-true.png");
  size(436, 640, P2D);//topNail.width + wall.width*2
  playerX = width/2-playerDefault.width/2;
  playerHealth = 10;
  playerY = 50;
  fallingSpeed = 3;
  score = 0;
  playerHealth = 10;
  gameOver = false;
  level = 1;
  r=0; 
  g=0; 
  b=0;
  p[0] = new platform(6, width/2-platformTrue.width/2, height);
  //the start-up platform must be true platform and appear in the middle
  for (int i=1; i < p.length; i++) {
    p[i] = new platform(height + i*120);
    //p[i] = new platform(5,width-wall.width-platformRight.width,height + i*120);
  }
  premillis = millis();
}

void draw() {
  if (!gameOver && gameStart) {
    switch(level) {
    case 1:
      background(r, g, b);
      break;
    case 2:
      background(bg1);
      break;
    case 3:
      background(bg2);
      break;
    case 4:
      background(bg3);
      break;
    default:
      background(bg3);
      break;
    }
    image(wall, 0, 0);
    image(wall, width-wall.width, 0);
    image(topNail, 0+wall.width, 0);
    if (playerY < topNail.height) {
      playerHealth -= level;
      playerY += playerDefault.height;
    }
    if (playerMoveLeft) {
      if (frameCount%10<=5)image(playerLeft, playerX, playerY);
      else image(playerLeftRun, playerX, playerY);
      if (playerX >= wall.width)playerX -= 3;
    } else if (playerMoveRight) {
      if (frameCount%10<5)image(playerRight, playerX, playerY);
      else image(playerRightRun, playerX, playerY);
      if (playerX + playerDefault.width <= width-wall.width)playerX += 3;
    } else {
      image(playerDefault, playerX, playerY);
    }

    for (int i=0; i < p.length; i++) {
      p[i].update();
      if (p[i].platformY <= -1750)p[i] = new platform();//renew the platform
    }

    playerY += fallingSpeed;//falling down
    if (fallingSpeed < 9.8)fallingSpeed += 0.3;//simulate gravity(mabe OwO)

    //if(frameCount % 30 ==0)score += level;// score += level per 0.5 second
    level = score/100 + 1;
    printInfo();
    judgePlayerDead();
  } else if (gameOver && gameStart)printDeadInfo();
  else printStartupInfo();
}

void keyPressed() {
  switch(keyCode) {
  case LEFT:
    playerMoveLeft = true;
    playerMoveRight = false;
    break;
  case RIGHT:
    playerMoveRight = true;
    playerMoveLeft = false;
    break;
  case 'R':
    setup();
    gameStart = true;
    break;
  case 'S':
    saveFrame("line-###.png");
    break;
  default:
    playerMoveRight = false;
    playerMoveLeft = false;
    break;
  }
}

void keyReleased() {
  playerMoveRight = false;
  playerMoveLeft = false;
}

void printInfo() {
  textSize(20);
  fill(255);
  text("Time:"+ (millis()/1000 - premillis/1000) +"."+millis()%1000+"s", wall.width, 33);
  fill(#FFFF00);
  text("HP:"+playerHealth, wall.width, 53);
  text("Score :"+score, wall.width, 73);
  text("Level :"+level, wall.width, 93);
}

void judgePlayerDead() {
  if (playerY >= height + playerDefault.height)playerHealth = 0;
  if (playerHealth <= 0) {
    gameOver = true;
  }
}

void printDeadInfo() {
  background(100);
  textSize(50);
  fill(255,255,0);
  text("Your Score :"+score, 30, height/2-150);
  text("Reach Level :"+level, 30, height/2-100);
  fill(255,0,0);
  text("Game Over", 80, height/2-50);
  fill(255);
  text("Pressed R", 80, height/2);
  text("to Restart", 80, height/2 + 50);
  textSize(20);
  text("Pressed S to save image", 80, height/2 + 70);
  text("while playing", 80, height/2 + 90);
}

void printStartupInfo() {
  background(0);
  textSize(50);
  text("~Welcome~", 80, height/3-50);
  text("Press R to", 60, height/3);
  text("Start Game", 60, height/3 + 50);
  textSize(20);
  text("You can pressed S to save", 60, height/3 + 70);
  text("image during the game", 60, height/3 + 90);
}
