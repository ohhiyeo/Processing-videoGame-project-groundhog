class Item {
  boolean isAlive;
  float x, y;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;
  PImage img;
  Item(String filename,float x, float y){
    img=loadImage(filename);
    isAlive = true;
    this.x = x;
    this.y = y;
    }
	
  void display( ){
    if(isAlive==true){
       image(img, x, y);
    }
  }
	
  void checkCollision(Player player){}
}
