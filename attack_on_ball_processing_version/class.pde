class ball{
  float x,y,r,xMoveSpeed,yMoveSpeed;
  int colorR,colorG,colorB;
  ball(){
    x = random(-200);
    y = random(200);
    r = int(random(30,80));
    colorR = int(random(255));
    colorG = int(random(255));
    colorB = int(random(255));
    xMoveSpeed = random(1,3);
    yMoveSpeed = random(2,5);
  }
  void ballDrop(){
    fill(colorR,colorG,colorB);
    ellipse(x,y,r,r);
    x += xMoveSpeed;
    y += yMoveSpeed;
    if(y+(r/2) >= height)yMoveSpeed = -yMoveSpeed;
  }
}
