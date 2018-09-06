Ship ship;
Enemy enemy[];


void setup(){
  
  size(800,800);
  ship= new Ship();
  
}
void draw(){
  background(0);
  ship.update();
  ship.render();
  
  




}



void keyPressed(){
  if(keyCode == RIGHT){
    ship.setRotation(0.1);
  }
  
  else if(keyCode == LEFT){
    ship.setRotation(-0.1);
  }
  
   else if(keyCode == UP){
    ship.boosting(true);
  }



}


void keyReleased(){

  if(keyCode==RIGHT)
  ship.setRotation(0);
   if(keyCode==LEFT)
  ship.setRotation(0);
  
  
    if(keyCode == UP){
     ship.boosting(false);
  }
 

}
