class Player{
float px,py,pz;
PVector vue;


  Player(float x,float y, float z){
  px=x;
  py=y;
  pz=z;
  vue = new PVector(0,1,-2);
  }
  
  void rotateX(float angle){vue = rotateYZ(vue,angle);};
  void rotateY(float angle){vue = rotateXZ(vue,angle);};
  void rotateZ(float angle){vue = rotateXY(vue,angle);};
  





}