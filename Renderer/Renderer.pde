Cube[][] cubes;
float angleX, angleY = 0;
float x, y, z;
PImage img;

void setup() {
  size(800, 800, P3D);
  cubes = new Cube[100][100];
  img = loadImage("dirt.jpg");
  
  int i, j;
  for (i=0; i<100; i++) {
    for (j=0; j<100; j++) {
      cubes[i][j]= new Cube(i,0,-j,img);
      
    }
  }
}
void draw() {

  translate(width/2, height/2);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(10);
  rotateX(angleX);
  //rotateY(angleY);
int i, j;
for (i=0; i<10; i++) {
    for (j=0; j<10; j++) {
      
      cubes[i][j].drawCube();
     
      
      
    }
  }
  
  
 angleX=map(mouseY-height,0,height,0,PI/2);
 //angleY=map(mouseX-width,-width,width,0,PI/2);
  

  
}


void keyPressed(){

int i,j;
for (i=0; i<10; i++) {
    for (j=0; j<10; j++) {
     if (key == CODED) {
      if(keyCode == UP){cubes[i][j].update(cubes[i][j].px,cubes[i][j].py,cubes[i][j].pz-1);}
      if(keyCode == LEFT){cubes[i][j].update(cubes[i][j].px+1,cubes[i][j].py,cubes[i][j].pz);}
      if(keyCode == DOWN){cubes[i][j].update(cubes[i][j].px,cubes[i][j].py,cubes[i][j].pz+1);}
      if(keyCode == RIGHT){cubes[i][j].update(cubes[i][j].px-1,cubes[i][j].py,cubes[i][j].pz);}
      
     }}

      //cubes[i][j].drawCube();
     
      
      
    }
  }