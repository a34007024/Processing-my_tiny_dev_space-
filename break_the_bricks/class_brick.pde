class brick{
  int x,y,brickWidth,brickHeight;
  
  brick(int inX,int inY,int inWidth,int inHeight){//建構子
    x = inX;
    y = inY;
    brickWidth = inWidth;
    brickHeight = inHeight;
  }
  
  void update(){
    rect(x,y,brickWidth,brickHeight);
  }
  
}
