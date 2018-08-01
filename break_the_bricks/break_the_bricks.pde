int[] bricksX = new int[100];
int[] bricksY = new int[100];
int bricksWidth=38;
int bricksHeight=18;
void setup(){
  size(640,480,P2D);
  noStroke();
  for(int i=0;i<16;i++){
    bricksX[i]=i*40;
  }
  for(int i=0;i<10;i++){
    bricksY[i]=i*20;
  }
}

void draw(){
  background(0);
  for(int i=0;i<16;i++){
    for(int j=0;j<10;j++){
      fill(255,155,166);
      rect(bricksX[i],bricksY[j],bricksWidth,bricksHeight);
    }
  }
  //below is player bar
  fill(255);
  rect(mouseX-50,460,100,20);
  ellipse(mouseX,455,10,10);//playerBall
  if(mousePressed){
    
  }
  
}
