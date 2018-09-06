ArrayList<Cube> cubes;
Player player;

float x, y, z;
PImage img,img2;
int generatesize =20;




void setup() {
  fullScreen(P3D);
 // size(900,900,P3D);
  cubes = new ArrayList<Cube>();


  img = loadImage("dirt4.jpg");
  img2 = loadImage("grass2.jpg");
  player = new Player(0, -1000, 0);
  float detail = 0.55;
  float xoff = 0.0;
  noiseDetail(8, detail);
  float increment = 0.012;
  //generate
  int i, j;
  for (i=-generatesize; i<generatesize; i++) {
    xoff +=increment;
    float yoff = 0.0;
    for (j=-generatesize; j<generatesize; j++) {
      yoff +=increment; 
      float heightness = round(noise(xoff, yoff)*50);
      System.out.println(heightness);
      cubes.add(new Cube(i, -heightness, -j, img));
      int h;
      for(h= int(heightness)-2;h<heightness;h++){
        cubes.add(new Cube(i,-h,-j,img2));
      }
      
      
      
      
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
    
    //if(dist(cube.px*50,cube.py*50,cube.pz*50, player.px,player.py, player.pz)<1000){
    cube.drawCube();
  //}
  }

 // stroke(255,0,0);
 // strokeWeight(50);
  //line(player.px,player.py,player.pz,    player.px+player.vue.x ,-player.py+player.vue.y+player.vue.y,player.pz+player.vue.z);
  //point( player.px+player.vue.x, player.py+player.vue.y, player.pz+player.vue.z);
  //spotLight(255, 0, 0, player.px, player.py, player.pz, player.px+player.vue.x, player.py+player.vue.y, player.pz+player.vue.z, 20, 0.2);
}



void keyPressed() {

  PVector P = new PVector(player.vue.x, player.vue.z);
  if(key==TAB)player.py -= 50;

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
  
  
  player.vue.y =player.vue.y+ (mouseY-pmouseY)*rate;
  if(player.vue.y>3) player.vue.y=3;
  
  
  
  player.rotateY(-(mouseX-pmouseX) * rate);
  
 
  
  
}
