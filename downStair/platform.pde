class platform {
  float platformX, platformY;
  int platformType;
  boolean playerCollideOnPlatform = false;
  float platformYmovementSpeed = 0;
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

  platform(int in_platformType, float in_platformY) {
    platformType = in_platformType;
    platformX = random(wall.width, width-platformRight.width-wall.width);
    platformY = in_platformY;
  }

  platform(int in_platformType, float in_platformX, float in_platformY) {
    platformType = in_platformType;
    platformX = in_platformX;
    platformY = in_platformY;
  }

  void update() {
    switch (platformType) {
    case 1:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        framePassed += 1;
        if (framePassed > 15)playerCollideOnPlatform = true;
        if (!playerCollideOnPlatform) {
          playerY = platformY - playerDefault.height-platformYmovementSpeed;
          fallingSpeed = 0;
        }
      }
      if (!playerCollideOnPlatform)image(platformFake, platformX, platformY);
      break;
    case 2:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-platformYmovementSpeed;
        fallingSpeed = 0;
        fallingSpeed = -9;
      }
      image(platformJump, platformX, platformY);
      break;
    case 3:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        if (!playerCollideOnPlatform) {
          if (playerHealth < 10)playerHealth += 1;//第一次踏上可回血
          score += 10;//第一次踏上可加分
        }
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-platformYmovementSpeed;
        fallingSpeed = 0;
        if (playerX > wall.width)playerX -= 2;
      }
      if (frameCount%20<10)image(platformLeft, platformX, platformY);
      else image(platformLeft2, platformX, platformY);
      break;
    case 4:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        framePassed += 1;
        if (!playerCollideOnPlatform) {
          playerHealth -= level;//扣血量隨著level增加
        }
        if (framePassed <= 3)r=255;
        else r = 0;
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height + 15;
        fallingSpeed = 0;
      }
      image(platformNail, platformX, platformY);
      break;
    case 5:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        if (!playerCollideOnPlatform) {
          if (playerHealth < 10)playerHealth += 1;//第一次踏上可回血
          score += 10;//第一次踏上可加分
        }
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height-platformYmovementSpeed;
        fallingSpeed = 0;
        if (playerX + playerDefault.width < width-wall.width)playerX += 2;
      }
      if (frameCount%20<10)image(platformRight, platformX, platformY);
      else image(platformRight2, platformX, platformY);
      break;
    case 6:
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        if (!playerCollideOnPlatform) {
          if (playerHealth < 10)playerHealth += 1;//第一次踏上可回血
          score += 10;//第一次踏上可加分
        }
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height - platformYmovementSpeed;
        fallingSpeed = 0;
      }
      image(platformTrue, platformX, platformY);
      break;
    default://same as the case 6
      if (playerX+playerDefault.width > platformX && playerX < platformX + platformTrue.width && playerY + playerDefault.height >= platformY && platformY > 0 && platformY > playerY) {
        //judge if player is standing on platform
        if (!playerCollideOnPlatform) {
          if (playerHealth < 10)playerHealth += 1;//第一次踏上可回血
          score += 10;//第一次踏上可加分
        }
        playerCollideOnPlatform = true;
        playerY = platformY - playerDefault.height - platformYmovementSpeed;
        fallingSpeed = 0;
      }
      image(platformTrue, platformX, platformY);
      break;
    }
    if(level < 4)platformYmovementSpeed = (level/2 + 1.5);//speed control by level
    else platformYmovementSpeed = 3.5;//level 4後速度不再增加，僅會增加碰撞的扣血量
    platformY -= platformYmovementSpeed;
  }
}
