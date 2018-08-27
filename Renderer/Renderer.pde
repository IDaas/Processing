ArrayList<Cube> cubes;
Player player;

float x, y, z;
PImage img;




void setup() {
  //fullScreen(P3D);
  size(800,800,P3D);
  cubes = new ArrayList<Cube>();


  img = loadImage("dirt4.jpg");
  player = new Player(0, -500, 0);


  //generate
  int i, j;
  for (i=-200; i<200; i++) {
    for (j=-200; j<200; j++) {
      cubes.add(new Cube(i, 0+round(random(1)), -j, img));
    }
  }
}
void draw() {
  pointLight(255, 255, 255,player.px, player.py, player.pz);
  //camera(player.px, player.py, player.pz, player.px+map(mouseX, -width/2, width, 0, 50000), player.py+angleY, player.pz+ map(mouseY-height, 0, height, 0, 50000)/2/tan(PI/6), 0, 1, 0);
  camera(player.px, player.py, player.pz, 

    player.px+player.vue.x, 
    player.py+player.vue.y, 
    player.pz+player.vue.z, 

    0, 1, 0);

  translate(width/2, height/2);
  background(20);



  for (Cube cube : cubes) {
    
    if(dist(cube.px*50,cube.pz*50, player.px, player.pz)<3000){
    System.out.println(dist(cube.px*50,cube.pz*50, player.px, player.pz));
    cube.drawCube();
  }
  }

  

  spotLight(255, 0, 0, player.px, player.py, player.pz, player.px+player.vue.x, player.py+player.vue.y, player.pz+player.vue.z, 20, 0.2);
}



void keyPressed() {

  PVector P = new PVector(player.vue.x, player.vue.z);


  if (key == CODED) {
    if (keyCode == DOWN) {
      player.pz -= player.vue.z*50;
      //player.py -= player.vue.y*50;
      player.px -= player.vue.x*50;
    }
    if (keyCode == UP) {
      player.pz += player.vue.z*50;
      // player.py += player.vue.y*50;
      player.px += player.vue.x*50;
    }
    if (keyCode == LEFT) {

      P.rotate(-PI/2);
      player.pz += P.y*50;
      player.px += P.x*50;
      ;
    }

    if (keyCode == RIGHT) {
      P.rotate(PI/2);
      player.pz += P.y*50;
      player.px += P.x*50;
      ;
    }
  }
}










void mouseWheel(MouseEvent event) {
  player.py += 50*event.getCount();
}


void mouseDragged() {
  float rate = 0.001;
  player.rotateX((mouseY-pmouseY) * rate);
  player.rotateY((mouseX-pmouseX) * rate);
}