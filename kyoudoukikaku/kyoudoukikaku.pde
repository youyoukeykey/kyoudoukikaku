String path;
player p;
ArrayList<enemy> teki=new ArrayList();
UI ui;
void setup() {
  noiseSeed(1);//a
  size(700, 700);
  String  path  =  sketchPath( ) ;
  p=new player();
  mapsetup();
  randomSeed(100);
  enemy e=new enemy();
  e.enemypos.x=10;
  e.enemypos.y=10;
  teki.add(e);
  ui=new UI();
}
void draw() {
  background(255);
  mapdraw(p.x, p.y);
  //pp.draw();
  for (int i=0; i<teki.size(); i++) {
    enemy t=teki.get(i);
    t.run();
  }
  if (keyp==true) {
    keysyori();
  }
  animupdate();
  if (map.MaOf==0) {
    ui.draw();
  }
}
