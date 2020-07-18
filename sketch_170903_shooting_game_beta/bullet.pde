class bullet{
  float bX,bY;
  float bulletSpeed = 5;
  boolean Bup,Bdown,Bleft,Bright;
  bullet(float x,float y,boolean up,boolean down,boolean left,boolean right){
    bX = x;
    bY = y;
    Bup = up;
    Bdown = down;
    Bleft = left;
    Bright = right;
  }
  void update(){
    fill(120);
    ellipse(bX,bY,5,5);
    if(Bup == true)bY-=bulletSpeed;
    if(Bdown == true)bY+=bulletSpeed;
    if(Bleft == true)bX-=bulletSpeed;
    if(Bright == true)bX+=bulletSpeed;
  }
}