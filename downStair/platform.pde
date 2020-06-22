int score = 0;
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

  void update() {
    switch (platformType) {
    case 1:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        framePassed += 1;
        if(framePassed > 30)playerCollideOnPlatform = true;
        if(!playerCollideOnPlatform){
          playerY = platformY - playerDefault.height;
        }
      }
      if(!playerCollideOnPlatform)image(platformFake, platformX, platformY);
      break;
    case 2:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformJump, platformX, platformY);
      break;
    case 3:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformLeft, platformX, platformY);
      break;
    case 4:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformNail, platformX, platformY);
      break;
    case 5:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformRight, platformX, platformY);
      break;
    case 6:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformTrue, platformX, platformY);
      break;
    default:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height;
      }
      image(platformTrue, platformX, platformY);
      break;
    }
    platformY -= 3;
  }
}
