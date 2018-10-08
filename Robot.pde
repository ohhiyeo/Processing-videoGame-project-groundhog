class Robot extends Enemy{
// Requirement #5: Complete Dinosaur Class
   final int PLAYER_DETECT_RANGE_ROW = 2;
   final int LASER_COOLDOWN = 180;
   int laserTimer=0;
   final int HAND_OFFSET_Y = 37;
   final int HAND_OFFSET_X_FORWARD = 64;
   final int HAND_OFFSET_X_BACKWARD = 16;
   PImage robot;
   float speed=2f;
   float currentSpeed=2f;
   Laser laser;
  
  
  Robot(float x, float y){
  super(x,y);
  robot=loadImage("img/robot.png");
  }
 // HINT: Player Detection in update()
 void update(){
  x+=speed;
  if((x+w>=width)||(x<=0)){ 
     speed*=-1; 
     if(speed!=0){
     currentSpeed=speed;
     }
  } 
boolean checkX=((currentSpeed>0&&(player.x+w/2)>x+HAND_OFFSET_X_FORWARD)||(currentSpeed<0&&(player.x+w/2)<x+HAND_OFFSET_X_BACKWARD))? true:false;
boolean checkY=(abs(player.row-(y/h))<=PLAYER_DETECT_RANGE_ROW)? true:false;

  if(checkX==true && checkY==true){
     speed=0;
     if(laserTimer==0){
       laser=new Laser();
       if(currentSpeed>0){
        laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
       }else if(currentSpeed<0){
         laser.fire(x+HAND_OFFSET_X_BACKWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
        }
       laser.update();
       laser.display();
       laser.checkCollision(player);
       laserTimer=LASER_COOLDOWN;
     }
     else{
       laser.update();
       laser.display();
       laser.checkCollision(player);
       laserTimer--;
     }
  }else{
      if(laserTimer>0){
        laser.update();
        laser.display();
        laserTimer--;
      }
	 speed=currentSpeed;
    }
  
 }
  void checkCollision(Player player){
     super. checkCollision(player);
     
  }
    
 
 void display(){
   int direction =(currentSpeed>0)?RIGHT:LEFT;
   pushMatrix();
   translate(x,y);
   if(direction==RIGHT){
     scale(1,1);
     image(robot,0,0,w,h);
   }
   else {
     scale(-1,1);
     image(robot,-w,0,w,h);
   }
   popMatrix();
  
   }
	
}
