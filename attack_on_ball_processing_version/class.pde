class ball{
  float x,y,r,xMoveSpeed,yMoveSpeed;
  float direction = random(0,100);
  int colorR,colorG,colorB;
  ball(){
    if(direction < 50){
      x = random(-200);
      xMoveSpeed = random(1,5);
    }else{
      x = random(width,width+200);
      xMoveSpeed = random(-5,-1);
    }
    y = random(200);
    r = int(random(30,80));
    colorR = int(random(255));
    colorG = int(random(255));
    colorB = int(random(255));
    yMoveSpeed = random(2,5);
  }
  ball(float in_x,float in_y){
    x = in_x;
    y = in_y;
    r = int(random(30,80));
    colorR = int(random(100,255));
    colorG = int(random(100,255));
    colorB = int(random(100,255));
    xMoveSpeed = random(1,5);
    yMoveSpeed = random(3,5);
  }
  void ballDrop(){
    fill(colorR,colorG,colorB);
    ellipse(x,y,r,r);
    x += xMoveSpeed;
    y += yMoveSpeed;
    if(y+(r/2) >= height)yMoveSpeed = -yMoveSpeed;
  }
}
