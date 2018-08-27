class Cube {
  PVector[] points;
  int scale= 50;
  float px, py, pz;
  PImage img;
  Cube(float x, float y, float z, PImage img) {
    points  = new PVector[8];
    px=x;
    py=y;
    pz=z;
    this.img=img;
    points[0]=new PVector(x*scale, y*scale, z*scale+scale);
    points[1]=new PVector(x*scale+scale, y*scale, z*scale+scale);
    points[2]=new PVector(x*scale+scale, y*scale+scale, z*scale+scale);
    points[3]=new PVector(x*scale, y*scale+scale, z*scale+scale);
    points[4]=new PVector(x*scale, y*scale, z*scale);
    points[5]=new PVector(x*scale+scale, y*scale, z*scale);
    points[6]=new PVector(x*scale+scale, y*scale+scale, z*scale);
    points[7]=new PVector(x*scale, y*scale+scale, z*scale);

    //this.update(x, y, z);
  }
  void update(float x, float y, float z) {
    int i;
    px=x;
    py=y;
    pz=z;
    for (i=0; i<8; i++) {

      points[0]=new PVector(x*scale, y*scale, z*scale+scale);
      points[1]=new PVector(x*scale+scale, y*scale, z*scale+scale);
      points[2]=new PVector(x*scale+scale, y*scale+scale, z*scale+scale);
      points[3]=new PVector(x*scale, y*scale+scale, z*scale+scale);
      points[4]=new PVector(x*scale, y*scale, z*scale);
      points[5]=new PVector(x*scale+scale, y*scale, z*scale);
      points[6]=new PVector(x*scale+scale, y*scale+scale, z*scale);
      points[7]=new PVector(x*scale, y*scale+scale, z*scale);
    }
  }

  void drawCube() {
    int i;

    //stroke(255);
    //strokeWeight(1);
    //for (i=0; i <4; i++) {
    //  connect((i+1)%4, i);
    //  connect(((i+1)%4)+4, i+4);
    //  connect(i, i+4);
    //}
    //strokeWeight(2);
    //for (i=0; i <8; i++) {
    //  point(points[i].x, points[i].y, points[i].z);
    //}
    //Texture
    noStroke();

    //Top
    beginShape();
    texture(img);
    vertex(px*scale, py*scale, pz*scale+scale, 0, 0);
    vertex(px*scale+scale, py*scale, pz*scale+scale, 64, 0); 
    vertex(px*scale+scale, py*scale, pz*scale, 64, 64);
    vertex(px*scale, py*scale, pz*scale, 0, 64);
    endShape();

    //front

    beginShape();
    texture(img);
    vertex(points[0].x, points[0].y, points[0].z, 64, 0);
    vertex(points[1].x, points[1].y, points[1].z, 128, 0); 
    vertex(points[2].x, points[2].y, points[2].z, 128, 0+64);
    vertex(points[3].x, points[3].y, points[3].z, 64, 0+64);
    endShape();
    
    //back
    beginShape();
    texture(img);
    vertex(points[0+4].x, points[0+4].y, points[0+4].z, 64, 0);
    vertex(points[1+4].x, points[1+4].y, points[1+4].z, 128, 0); 
    vertex(points[2+4].x, points[2+4].y, points[2+4].z, 128, 0+64);
    vertex(points[3+4].x, points[3+4].y, points[3+4].z, 64, 0+64);
    endShape();
    //left
    beginShape();
    texture(img);
    vertex(points[7].x, points[7].y, points[7].z, 64, 64);
    vertex(points[3].x, points[3].y, points[3].z, 128, 64); 
    vertex(points[0].x, points[0].y, points[0].z, 128, 0);
    vertex(points[4].x, points[4].y, points[4].z, 64, 0);
    endShape();
    //right
    beginShape();
    texture(img);
    vertex(points[6].x, points[6].y, points[6].z, 64, 64);
    vertex(points[2].x, points[2].y, points[2].z, 128, 64); 
    vertex(points[1].x, points[1].y, points[1].z, 128, 0);
    vertex(points[5].x, points[5].y, points[5].z, 64, 0);
    endShape();
    
    
    
    
    
    
    
  }


  void connect(int a, int b) {
    line(points[a].x, points[a].y, points[a].z, points[b].x, points[b].y, points[b].z);
  }
}
