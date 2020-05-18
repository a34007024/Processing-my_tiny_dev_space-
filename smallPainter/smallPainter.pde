globalVariables gv = new globalVariables(); // global variables 
void setup(){
  size(1280,720);
  surface.setTitle("郵差的小畫家beta版");
  //surface.setResizable(true);重新縮放畫布大小會清空內容
  surface.setLocation(100, 100);
  //https://processing.org/reference/setResizable_.html
}

void draw(){
  
  if(keyPressed && key==' ' && !gv.resetBackground){
    gv.br = random(255);
    gv.bg = random(255);
    gv.bb = random(255);
    background(gv.br,gv.bg,gv.bb);
    gv.resetBackground = true;
  }
  if(mousePressed)line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyReleased(){
  gv.resetBackground = false;
}

/*
小畫家簡易版 by LuckyPig3400
*/
