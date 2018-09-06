class Ship{

PVector pos;  
int r=50;

float rotation=0;
float heading=0;
PVector vel;
Boolean isBoosting = false;

  
  
 Ship(){
  pos = new PVector(width/2,height/2);
  vel = new PVector(0,0);

}


void boost(){
  PVector force =  PVector.fromAngle(heading-PI/2);
  force.mult(0.1);
  vel.add(force);
}


void update(){
  this.pos.add(vel);
  vel.mult(0.99);
  this.turn();
  if(isBoosting){
    this.boost();
  }
  edges();

}

void render(){
  translate(pos.x,pos.y);
  rotate(heading);
  stroke(255);  
  noFill();
  triangle(-r,r,r,r,0,-r);
}
void turn(){
  heading+=rotation;
}

void setRotation(float angle){
   rotation=angle;


}
void boosting(boolean b){
  this.isBoosting=b;

}

void edges(){
  if(pos.x>width+r){pos.x= -r;}
  else if(pos.x<-r){pos.x= width+r;}
  if(pos.y>height+r){pos.y= -r;}
  else if(pos.y<-r){pos.y= height+r;}
}





}
