ball[] ball = new ball[100];
//------------------------------
void setup(){
  fullScreen(P2D);
  noStroke();
  //stroke(120);
  for(int i=0;i<100;i++){
    ball[i] = new ball();
  }
}

void draw(){
  background(0);
  //ellipse(width/2,height/2,100,100);
  for(int i=0;i<10;i++){
    ball[i].ballDrop();
  }
}
