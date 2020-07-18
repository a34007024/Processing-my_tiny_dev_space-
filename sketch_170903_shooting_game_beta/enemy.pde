class enemy{
  float ex,ey,espeed;
  int eside;
  enemy(int side,float speed){
    eside = side;
    //--------------------------------------
    //以下決定敵人的進入方向
    if(eside == 1) {
      ex = random(-30,10);
      ey = random(480);
    }
    if(eside == 2) {
      ex = random(0,640);
      ey = random(-50,10);
    }
    if(eside == 3) {
      ex = random(620,660);
      ey = random(480);
    }
    if(eside == 4) {
      ex = random(640);
      ey = random(480,550);
    }
    //以上決定敵人的進入方向
    //--------------------------------------
    espeed = speed;
  }
  
  void update(){
    fill(255,0,0);
    ellipse(ex,ey,10,10);
    //-------------------------------
    if(ex < playerX) ex+=espeed;
    if(ex > playerX) ex-=espeed;
    if(ey < playerY) ey+=espeed;
    if(ey > playerY) ey-=espeed;
    //自動追蹤玩家
    //-------------------------------
    
  }
}