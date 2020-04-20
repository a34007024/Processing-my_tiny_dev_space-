//仿1010!
//10*10的方格中會有許多拼圖
storeBlock[][] stb = new storeBlock[10][10];
void setup(){
  size(540,960);//1080*1920(仿手機縱向畫面)
  //540/10 =54 => 把方格的邊長設為50
  //然後2設為第0格的x,中間每格空隙為4
  background(0);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      stb[i][j] = new storeBlock(2+54*i,200+54*j,50,50);
    }
  }
  
}

void draw(){
  background(0);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      stb[i][j].update();
    }
  }
}

class storeBlock{//single unit for background block
  boolean storeStatus;
  int r,g,b;
  float x,y,w,h;
  storeBlock(float in_x,float in_y,float in_w,float in_h){
    x=in_x;
    y=in_y;
    w=in_w;
    h=in_h;
    r=100;
    g=100;
    b=100;
    storeStatus = false;
  }
  void update(){
    fill(r,g,b);
    rect(x,y,w,h,9);
  }
}
