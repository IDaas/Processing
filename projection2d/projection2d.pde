PVector[] points;
float angleX ,angleY = 0;
PImage img;
int x,y,z;

int scale =60;

void setup(){
size(1000,800,P2D);
background(0);
points = new PVector[9];


points[0] = new PVector(-1,-1,-1);
points[1] = new PVector(-1,1,-1);
points[2] = new PVector(1,1,-1);
points[3] = new PVector(1,-1,-1);
points[4] = new PVector(-1,-1,1);
points[5] = new PVector(-1,1,1);
points[6] = new PVector(1,1,1);
points[7] = new PVector(1,-1,1);


points[8] = new PVector(0,0,1);
img = loadImage("so.jpg");
z=5;


}


void draw(){
  background(0);
  translate(width/2,height/2);
 
  stroke(255,0,0);
  strokeWeight(16);
  noFill();
  PVector[] projected = new PVector[9];
  int index=0;
  
 for (PVector v :points){
   PVector rotatedX = rotateYZ(v,-angleX);
   PVector rotatedY = rotateXZ(rotatedX,-angleY);
   
   
   
    projected[index] = transpose3d2d(rotatedY,z);
    projected[index].mult(500);
   
   
   point(projected[index].x,projected[index].y);
   index++;
 }
 
 
 for(int i=0;i<projected.length/2;i++){
 connect(i,(i+1)%4,projected);
 connect(i+4,((i+1)%4)+4,projected);
 connect(i,(i+4),projected);
 }
 
 
 // angleX+=0.01;
 // angleY+=0.02;
 //angleX = map(mouseY ,0,height, -PI,PI);
 //angleY = map(mouseX ,0,width,-PI,PI);

noFill();
stroke(255,0,0);


beginShape();
texture(img);

vertex(projected[0+4].x,projected[0+4].y,0,0);
vertex(projected[1+4].x,projected[1+4].y,0,153);
vertex(projected[2+4].x,projected[2+4].y,153,153);
vertex(projected[3+4].x,projected[3+4].y,153,0);
 endShape();




}


void connect(int a, int b, PVector[] list){
  strokeWeight(2);
  stroke(255);
  line(list[a].x,list[a].y,list[b].x,list[b].y);


}


void mouseWheel(MouseEvent event) {
  z+= event.getCount();
  
}

void mouseDragged() {
  float rate = 0.01;
  angleX += (mouseY-pmouseY) * rate;
  angleY += (mouseX-pmouseX) * rate;
}
