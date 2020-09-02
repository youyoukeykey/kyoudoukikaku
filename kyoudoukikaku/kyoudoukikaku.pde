String path;
player p;
ArrayList<enemy> teki=new ArrayList();
UI ui;
PImage messy;
void setup() {
  messy=loadImage("messy.png");
  noiseSeed(1);//a
  size(700, 700);
  String  path  =  sketchPath( ) ;
  p=new player();
  mapsetup();
  randomSeed(100);
  for(int i=-0;i<60;i++){
  enemy e=new enemy();
  e.enemypos.x=random(-60,60);
  e.enemypos.y=random(-60,60);
  teki.add(e);
  }
  ui=new UI();
}
void draw() {
  background(255);
  mapdraw(p.x, p.y);
  //pp.draw();
  if (keyp==true) {
    keysyori();
  }
  animupdate();
  if (map.MaOf==0) {
    ui.draw();
  }
  
}
