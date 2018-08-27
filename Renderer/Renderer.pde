Cube[][] cubes;
Player player;

float x, y, z;
PImage img;
float eyeY, eyeX, eyeZ, angleX, angleY, angleZ;



void setup() {
  size(800, 800, P3D);
  cubes = new Cube[100][100];
  lights();
  img = loadImage("dirt4.jpg");
  player = new Player(0, -500, 0);
  eyeX = width/2.0;
  eyeY = height/3.0;
  eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);


  angleX = width/2.0;
  angleY=  height/2.0;
  angleZ=  0;
  System.out.println(angleX+" "+angleY+" "+angleZ+" ");

  //generate
  int i, j;
  for (i=0; i<100; i++) {
    for (j=0; j<100; j++) {
      cubes[i][j]= new Cube(i, 0+random(1), -j, img);
    }
  }
}
void draw() {

  angleX=mouseX;
  angleY=mouseY;
  //camera(player.px, player.py, player.pz, player.px+map(mouseX, -width/2, width, 0, 50000), player.py+angleY, player.pz+ map(mouseY-height, 0, height, 0, 50000)/2/tan(PI/6), 0, 1, 0);
  camera(player.px, player.py, player.pz, 
  
  player.px+player.vue.x, 
  player.py+player.vue.y, 
  player.pz+player.vue.z, 
  
  0, 1, 0);





  translate(width/2, height/2);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(10);


  int i, j;
  for (i=0; i<100; i++) {
    for (j=0; j<100; j++) {

      cubes[i][j].drawCube();
    }
  }
}


void keyPressed() {



  int i, j;
  for (i=0; i<100; i++) {
    for (j=0; j<100; j++) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          player.pz+=0.01;
        }
        if (keyCode == LEFT) {
          player.px-=0.01;
        }
        if (keyCode == UP) {
          player.pz-=0.01;
        }
        if (keyCode == RIGHT) {
          player.px+=0.01;
        }
      }
    }
  }







}


void mouseWheel(MouseEvent event) {
  player.py += 50*event.getCount();
 
}


void mouseDragged() {
  float rate = 0.01;
  player.rotateX((mouseY-pmouseY) * rate);
  player.rotateY((mouseX-pmouseX) * rate);
}