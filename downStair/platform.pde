int score = 0;
class platform{
  float platformX,platformY;
  int platformType;
  platform(){
    platformType = int(random(6));
    platformX = random(wall.width,width-platformRight.width-wall.width);
    platformY = height;
  }
  
  platform(float in_platformY){
    platformType = int(random(6));
    platformX = random(wall.width,width-platformRight.width-wall.width);
    platformY = in_platformY;
  }
  
  void update(){
    switch (platformType){
      case 1:
        image(platformFake,platformX,platformY);
        break;
      case 2:
        image(platformJump,platformX,platformY);
        break;
      case 3:
        image(platformLeft,platformX,platformY);
        break;
      case 4:
        image(platformNail,platformX,platformY);
        break;
      case 5:
        image(platformRight,platformX,platformY);
        break;
      case 6:
        image(platformTrue,platformX,platformY);
        break;
      default:
        image(platformTrue,platformX,platformY);
        break;
    }
    platformY -= 3;
  }
}
