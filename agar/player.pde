class player{
  float x,y,r;
  int score = 0;
  int colorR,colorG,colorB;
  player(float x,float y,float r){
    this.x = x;
    this.y = y;
    this.r = r;
    colorR = int(random(255));
    colorG = int(random(255));
    colorB = int(random(255));
  }
  player(){
    r = 30;
    x = random(0 + r, mapX - r);
    y = random(0 + r, mapY - r);
    colorR = int(random(100,255));
    colorG = int(random(100,255));
    colorB = int(random(100,255));
  }
  void update(){
    fill(colorR,colorG,colorB);
    ellipse(width/2,height/2,r,r);
    if(mouseX > width/2 && x <= mapX){//move playerX with mouseX and lock X margin
      x += 1;
      for(int i=0;i<f.length;i++){
        f[i].relativeX -= 1;
      }
    }
    else if((mouseX < width/2 && x >= 0)){//move playerX with mouseX and lock X margin
      x -= 1;
      for(int i=0;i<f.length;i++){
        f[i].relativeX += 1;
      }
    }
    else if(mouseX == width/2); //no action for X axis
    if(mouseY > height/2 && y <= mapY){//move playerY with mouseY and lock Y margin
      y += 1;
      for(int i=0;i<f.length;i++){
        f[i].relativeY -= 1;
      }
    }
    else if(mouseY < height/2 && y >= 0){//move playerY with mouseY and lock Y margin
      y -= 1;
      for(int i=0;i<f.length;i++){
        f[i].relativeY += 1;
      }
    }
    else if(mouseY == height/2); //no action for Y axis
  }
}
