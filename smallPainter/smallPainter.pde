boolean resetBackground = false;
float br,bg,bb;//background RGB
int pen = 0;//0為鉛筆,1為圓形,2為方形,3為三角形
float pr = 200,pg = 160,pb = 180;//pen RGB;

void setup(){
  size(1280,720);
  surface.setTitle("小畫家beta版");
  //surface.setResizable(true);重新縮放畫布大小會清空內容
  surface.setLocation(100, 100);
  //https://processing.org/reference/setResizable_.html
  background(255);
}

void draw(){
  
  if(keyPressed && key==' ' && !resetBackground){
    //br = random(255);
    //bg = random(255);
    //bb = random(255);
    //background(br,bg,bb);
    background(255);
    resetBackground = true;
  }
  if(mousePressed){
    switch(pen){
      case 0:
        line(pmouseX,pmouseY,mouseX,mouseY);
        break;
      case 1:
        fill(pr,pg,pb);
        ellipse(mouseX,mouseY,30,30);
        break;
      case 2:
        fill(pr,pg,pb);
        square(mouseX,mouseY,30);
        break;
      case 3:
        fill(pr,pg,pb);
        triangle(mouseX,mouseY,mouseX-15,mouseY+15,mouseX+15,mouseY+15);
        break;
      default:
        line(pmouseX,pmouseY,mouseX,mouseY);
        break;
    }
  }
  textSize(20);
  text("pen",10,30);
  if(mouseX > 50 && mouseX < 150 && mouseY > 0 && mouseY < 50){
    fill(150);
    if(mousePressed)pen = 0;
  }
  else fill(200);
  rect(50,0,100,50);
  fill(0);
  text("line",75,30);
  
  if(mouseX > 150 && mouseX < 250 && mouseY > 0 && mouseY < 50){
    fill(150);
    if(mousePressed)pen = 1;
  }
  else fill(200);
  rect(150,0,100,50);
  fill(0);
  text("circle",175,30);
  
  if(mouseX > 250 && mouseX < 350 && mouseY > 0 && mouseY < 50){
    fill(150);
    if(mousePressed)pen = 2;
  }
  else fill(200);
  rect(250,0,100,50);
  fill(0);
  text("square",275,30);
  
  if(mouseX > 350 && mouseX < 450 && mouseY > 0 && mouseY < 50){
    fill(150);
    if(mousePressed)pen = 3;
  }
  else fill(200);
  rect(350,0,100,50);
  fill(0);
  text("triangle",365,30);
  
  text("Press any key to clear canvas",465,30);
  
  if(mouseX > 1000 && mouseX < width && mouseY > 0 && mouseY < 50){
    fill(150);
    //to-do:存檔成png到指定位置
  }
  else fill(200);
  rect(1000,0,width-1000,50);
  fill(0);
  text("Save file as ...",1050,30);
  
}

void keyReleased(){
  resetBackground = false;
}

/*
小畫家簡易版 by LuckyPig3400
*/
