
 


PVector matToVec(float[][] mat){
  
  PVector v = new PVector();
  v.x=mat[0][0];
  v.y=mat[1][0];
  
  if(mat.length>2)
  v.z=mat[2][0];
  
  
  return v;

}


float[][] vecToMat(PVector vec){
  float[][] mat = new float[3][1];
  mat[0][0]=vec.x;
  mat[1][0]=vec.y;
  mat[2][0]=vec.z;
  
  
  return mat;
}





PVector matmul(float[][] mat,PVector v){
  float[][] a = vecToMat(v);
  PVector c = matToVec(matmul(mat,a));
return c;
}





// matrix multiplication
float[][] matmul(float[][] a,float[][] b){
  if(a[0].length != b.length){
    System.out.println("No compatible matrix");
    return null;
  }
  
  
  int n = a.length;
  int m = a[0].length;
  int p = b[0].length;
  float sum;  
  float[][] c = new float[n][p];
  int i,j,k;
  for(i=0;i<n;i++){
    for(j=0;j<p;j++){
      sum=0;
      for(k=0;k<m;k++){
        sum += a[i][k]*b[k][j];
      }
      c[i][j]=sum;
    }
  }

return c;
}
