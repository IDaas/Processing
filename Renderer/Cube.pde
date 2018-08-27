class Cube {
  PVector[] points;
  int scale= 50;
  float px, py, pz;
  PImage img;
  Cube(float x, float y, float z,PImage img) {
    points  = new PVector[8];
    px=x;
    py=y;
    pz=z;
    this.img=img;
    
    points[0]=new PVector(x*scale, y*scale, z*scale);
    points[1]=new PVector(x*scale+scale, y*scale, z*scale);
    points[2]=new PVector(x*scale+scale, y*scale+scale, z*scale);
    points[3]=new PVector(x*scale, y*scale+scale, z*scale);
    points[4]=new PVector(x*scale, y*scale, z*scale+scale);
    points[5]=new PVector(x*scale+scale, y*scale, z*scale+scale);
    points[6]=new PVector(x*scale+scale, y*scale+scale, z*scale+scale);
    points[7]=new PVector(x*scale, y*scale+scale, z*scale+scale);
    this.update(x, y, z);
  }
  void update(float x, float y, float z) {
    int i;
    px=x;
    py=y;
    pz=z;
    for (i=0; i<8; i++) {

      points[0]=new PVector(x*scale, y*scale, z*scale);
      points[1]=new PVector(x*scale+scale, y*scale, z*scale);
      points[2]=new PVector(x*scale+scale, y*scale+scale, z*scale);
      points[3]=new PVector(x*scale, y*scale+scale, z*scale);
      points[4]=new PVector(x*scale, y*scale, z*scale+scale);
      points[5]=new PVector(x*scale+scale, y*scale, z*scale+scale);
      points[6]=new PVector(x*scale+scale, y*scale+scale, z*scale+scale);
      points[7]=new PVector(x*scale, y*scale+scale, z*scale+scale);
    }
  }

  void drawCube() {
    int i;

    stroke(255);
    strokeWeight(1);
    for (i=0; i <4; i++) {
      connect((i+1)%4, i);
      connect(((i+1)%4)+4, i+4);
      connect(i, i+4);
    }
    strokeWeight(2);
    for (i=0; i <8; i++) {
      point(points[i].x, points[i].y, points[i].z);
    }
    //Texture
    noStroke();
    beginShape();
    texture(img);

    /*
    vertex(px*scale+scale, py*scale+scale, pz*scale,0);
     vertex(px*scale, py*scale+scale, pz*scale,0);
     vertex(px*scale+scale, py*scale+scale, pz*scale+scale,32);
     vertex(px*scale, py*scale+scale, pz*scale+scale,32);
     */
    
    
    
    
    vertex(px*scale,       py*scale+scale, pz*scale+scale, 0, 0);
    
    vertex(px*scale+scale, py*scale+scale, pz*scale+scale, 512, 0); 
     
    vertex(px*scale+scale, py*scale+scale, pz*scale,       512, 512);
    
    vertex(px*scale,       py*scale+scale, pz*scale,       0, 512);
   
    
    
    
    




    endShape();
  }

  void connect(int a, int b) {
    line(points[a].x, points[a].y, points[a].z, points[b].x, points[b].y, points[b].z);
  }
}