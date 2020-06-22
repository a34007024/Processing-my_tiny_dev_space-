class platform {
  float platformX, platformY;
  int platformType;
  boolean playerCollideOnPlatform = false;
  int framePassed = 0;
  platform() {
    platformType = int(random(6));
    platformX = random(wall.width, width-platformRight.width-wall.width);
    platformY = height;
  }  

  platform(float in_platformY) {
    platformType = int(random(6));
    platformX = random(wall.width, width-platformRight.width-wall.width);
    platformY = in_platformY;
  }
  
  platform(int in_platformType,float in_platformY) {
    platformType = in_platformType;
    platformX = random(wall.width, width-platformRight.width-wall.width);
    platformY = in_platformY;
  }

  void update() {
    switch (platformType) {
    case 1:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        framePassed += 1;
        if(framePassed > 15)playerCollideOnPlatform = true;
        if(!playerCollideOnPlatform){
          playerY = platformY - playerDefault.height-3;
        }
      }
      if(!playerCollideOnPlatform)image(platformFake, platformX, platformY);
      break;
    case 2:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-3;
        fallingSpeed = -9;
      }
      image(platformJump, platformX, platformY);
      break;
    case 3:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-3;
        playerX -= 2;
      }
      image(platformLeft, platformX, platformY);
      break;
    case 4:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-3;
      }
      image(platformNail, platformX, platformY);
      break;
    case 5:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-3;
        playerX += 2;
      }
      image(platformRight, platformX, platformY);
      break;
    case 6:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height - 3;
      }
      image(platformTrue, platformX, platformY);
      break;
    default:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-3;
      }
      image(platformTrue, platformX, platformY);
      break;
    }
    platformY -= 3;
  }
}
