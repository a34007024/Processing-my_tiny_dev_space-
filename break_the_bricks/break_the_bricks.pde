brick[] b = new brick[100];

void setup(){
  size(640,480,P2D);
  noStroke();
  for(int i = 0;i<100;i++){
    b[i] = new brick((i%10)*64+2,0,60,20 );
  }
}

void draw(){
  background(0);
  
  for(int i=0;i<100;i++){
    b[i].update();
  }
  
  //below is player bar
  fill(255);
  rect(mouseX-50,460,100,20);
  ellipse(mouseX,455,10,10);//playerBall
  if(mousePressed){
    
  }
  
}
