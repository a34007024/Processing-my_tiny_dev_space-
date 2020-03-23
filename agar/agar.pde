//map size: 65536 x 65536
//X margin:0 ~ 65536 Y margin:0~65536
final float mapX = 11000;
final float mapY = 11000;
food[] f = new food[10000];
player p1 = new player();
void setup(){
  fullScreen(P2D);
  background(0);
  noStroke();
  for(int i=0;i<f.length;i++){
    f[i] = new food();
  }
  for(int i=0;i<f.length;i++){//make food which are absolute around player show in screen
    f[i].relativeX -= (p1.x-width/2);
    f[i].relativeY -= (p1.y-height/2);
  }
}

void draw(){
  background(0);
  fill(150);
  for(int i=0;i<f.length;i++){
    f[i].drawFood();
  }
  p1.update();
  debug();
}

void debug(){
  textSize(20);
  text("score",10,height-30);
  text("playerX:",10,20);
  text(p1.x,90,20);
  text("playerY:",10,40);
  text(p1.y,90,40);
}
