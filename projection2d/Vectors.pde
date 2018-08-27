
PVector transpose3d2d(PVector vec){

  float[][] projection = 
  {
    {1,0,0},
    {0,1,0}
  };
  
  return matmul(projection,vec);
}


PVector transpose3d2d(PVector vec , float distance){
  
  float z = 1/(distance - vec.z);

  float[][] projection = 
  {
    {z,0,0},
    {0,z,0}
  };
  
  return matmul(projection,vec);
}







PVector rotateYZ(PVector vec ,float a){
  float[][] rotate = 
  {
    {1,0,0},
    {0,cos(a),-sin(a)},
    {0,sin(a),cos(a)}
  };
return matmul(rotate,vec);
}


PVector rotateXZ(PVector vec ,float a){
  float[][] rotate = 
  {
    {cos(a),0,-sin(a)},
    {0,1,0},
    {sin(a),0,cos(a)}
  };
return matmul(rotate,vec);
}


PVector rotateXY(PVector vec ,float a){
  float[][] rotate = 
  {
    {cos(a),-sin(a),0},
    {sin(a),cos(a),0},
    {0,0,1}
  };
return matmul(rotate,vec);
}
