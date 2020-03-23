class food{
  float absoluteX,absoluteY;
  float relativeX,relativeY;//when player move around,these values will change
  final float r = 10;
  food(float absoluteX,float absoluteY){
    this.absoluteX = absoluteX;
    this.absoluteY = absoluteY;
    this.relativeX = absoluteX;
    this.relativeY = absoluteY;
  }
  food(){
    absoluteX = random(0,mapX);
    absoluteY = random(0,mapY);
    relativeX = absoluteX;
    relativeY = absoluteY;
  }
  void drawFood(){
    fill(200);
    if(relativeX > -width/2 && relativeX < width + width/2 
      && relativeY > -height/2 && relativeY < height + height/2 )//only when around player will shown in the screen
      ellipse(relativeX,relativeY,r,r);
  }
  void calculateFoodRelativePos(){
    
  }
}
