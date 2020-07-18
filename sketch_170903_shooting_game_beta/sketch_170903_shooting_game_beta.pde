//靈感來源
//https://codepen.io/ZoneTwelve/pen/yoBeqB?editors=0010

void setup(){
  size(640,480,P2D);
  //P2D use openGL to make drawing more smoothly
  noStroke();
  smooth(4);
  for(int i=0;i<enemyCount;i++){
    em[i] = new enemy(int(random(1,5)),1);
    //決定敵人的進入方向和速度
  }
}
int enemyCount = 10;
//場上最多的敵人數
enemy em[] = new enemy[10000];
//敵人物件最大數量為10000
float playerX = 320;
float playerY = 240;
float playerSize = 20;
float playerSpeed = 2;
bullet bb[] = new bullet[1000];
void draw(){
  background(0);
  //重新整理畫布
  fill(255);
  ellipse(playerX,playerY,playerSize,playerSize);
  //畫出玩家
  for(int i=0;i<enemyCount;i++){
    em[i].update();
    //更新敵人狀態
  }
  //以下程式為判斷玩家移動
  if(up == true && playerY - playerSize/2 >= 0)playerY-=playerSpeed;
  if(down == true && playerY + playerSize/2 <= 480)playerY+=playerSpeed;
  if(left == true && playerX - playerSize/2 >= 0)playerX-=playerSpeed;
  if(right == true && playerX + playerSize/2 <= 640)playerX+=playerSpeed;
  if(keyPressed==false){
    up = false;
    down = false;
    left = false;
    right = false;
  }
  //以上程式判斷玩家移動程式
  if(key == ' ')bulletCount+=1;
  //增加子彈的序號
  //以下為射子彈的部分
  for(int i = bulletCount;i<=bulletCount;i++){
    if(bb[i] == null) bb[i] = new bullet(playerX,playerY,up,down,left,right);
  }
  for(int i = 0;i < bulletCount;i++){
    if(bb[i]!=null){
      bb[i].update();
    }
  }
  //以上為射子彈的部分
}
int bulletCount = 0;

boolean up = false,down = false,left = false,right = false;
//以下判斷玩家按鍵控制狀態
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      down = false;
      up = true;
    }
    if(keyCode == DOWN){
      up = false;
      down = true;
    }
    if(keyCode == LEFT){
      right = false;
      left = true;
    }
    if(keyCode == RIGHT){
      left = false;
      right = true;
    }
  }
}
//以上判斷玩家按鍵控制狀態

//以下判斷使用者是否放開按鍵
void keyReleased() {
  if (keyCode == UP)up = false;
  if (keyCode == DOWN)down = false;
  if (keyCode == LEFT)left = false;
  if (keyCode == RIGHT)right = false;
}
//以上判斷使用者是否放開按鍵