class Clock extends Item {
// Requirement #2: Complete Clock Class
  float clockX, clockY;
  PImage clock;
Clock(float cX, float cY){
    super ("img/clock.png",cX,cY);
    this.clockX=x;
    this.clockY=y;
  }
  
 //Check collision with player
 void checkCollision(Player player){	   
     if(isAlive){ 
       if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
         addTime(CLOCK_BONUS_SECONDS);
         isAlive=false;
       }
     }
 }	
}
