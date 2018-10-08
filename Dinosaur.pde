class Dinosaur extends Enemy{
  // Requirement #4: Complete Dinosaur Class
  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed=1;
  float currentSpeed=1;
  boolean triggered=false;
  Dinosaur(float x, float y){
    super(x,y);
    dinosaur=loadImage("img/dinosaur.png");
    
  }
  void update(){
    x+=speed;
    if((x+w>=width)||(x<=0)) {
      speed*=-1; 
      currentSpeed=speed;
    }
     
   if( player.y==y){
      if((player.x<x && speed<0)||(player.x>x && speed>0)){
        if(!triggered){
        speed*=TRIGGERED_SPEED_MULTIPLIER;
        triggered=true;
        }
      }
    }
    else{
     speed=currentSpeed ;
     triggered=false;
    }
 
  }
   void checkCollision(Player player){
    super .checkCollision(player); 
   }
  void display(){
   int direction =(speed>0)?RIGHT:LEFT;
   pushMatrix();
   translate(x,y);
   if(direction==RIGHT){
     scale(1,1);
     image(dinosaur,0,0,w,h);
   }
   else {
     scale(-1,1);
     image( dinosaur,-w,0,w,h);
   }
   popMatrix();
   
   
  }
}
