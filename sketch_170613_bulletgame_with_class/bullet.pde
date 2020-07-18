class bullet{
  float x,y;
  float speed = 1;
  float directionX;
  float directionY;
  bullet(float x,float y){
   this.x = x;
   this.y = y;
   this.directionX = 5;
   this.directionY = random(-1,3);
  }
  
  void Update(){
    ellipse(x,y,10,10);
    x+=directionX;
    y+=directionY;
  }
}

int debug(){
  textSize(20);
  text(i,10,30);
  fill(255);
  return 0;
}