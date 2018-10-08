class Cabbage extends Item {
  // Requirement #1: Complete Cabbage Class
  float cabbageX,cabbageY;
  PImage cabbage;
	
	//Code for Reference:
    Cabbage(float cX, float cY){
      super ("img/cabbage.png",cX,cY);
      //cabbage = loadImage("img/cabbage.png");
      this.cabbageX=x;
      this.cabbageY=y;    
    }
 
    void checkCollision(Player player){   
    // Check collision with player
      if(isAlive){
	if(player.health < player.PLAYER_MAX_HEALTH
	   && isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
	            player.health ++;
                    isAlive=false;
	}
      }
}
}
