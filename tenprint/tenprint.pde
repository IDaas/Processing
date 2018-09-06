int x,y,resolution=10;

void setup(){
  size(800,800);
  resolution=width/resolution;
  x=0;y=0;
  background(0);
}
void draw(){
//background(0);
stroke(255);
if(random(2)<1){
line(x,y,x+resolution,y+resolution);}
else{
line(x+resolution,y,x,y+resolution);}

if(x==width){x=-resolution;y+=resolution;}
x+=resolution;


}
