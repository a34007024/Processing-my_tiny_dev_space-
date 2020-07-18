int mx = 0,my =0;

void setup()
{
  background(0);
  size(640,480,P3D);
  // P3D use GPU to process
  noStroke();
}
int bulletmax = 1000;//控制最大子彈數
int i = 0;
bullet[] b = new bullet[bulletmax];

void draw(){
  background(0);
  if(mousePressed == true){
    mx = mouseX;  
    my = mouseY;
    b[i] = new bullet(mx,my);
    b[i].Update();
    if(i == 998){
      i = 0;
    }
    i+=1;
    
  }
  for(int y = 0;y<bulletmax;y++){
    if(b[y]!=null){
      //用來保護避免更新到空的物件
      b[y].Update();
      if(b[y].x>2000) b[y] = null;
    }
  }  
  debug();
}
/*
void mouseClicked(){
  mx = mouseX;
  my = mouseY;
  b[i]=new bullet(mx,my);
  b[i].Update();
  i+=1;
}*/
//Old control method

void keyPressed(){
  
}