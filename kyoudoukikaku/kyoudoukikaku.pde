String path;
player p;
ArrayList<enemy> teki=new ArrayList();
void setup(){
  noiseSeed(1);
  size(700,700);
  String  path  =  sketchPath( ) ;
  p=new player();
  mapsetup();
  randomSeed(100);
  enemy e=new enemy();
  e.enemypos.x=10;
  e.enemypos.y=10;
  teki.add(e);
}
void draw(){
  background(255);
  mapdraw(p.x,p.y);//これだけで済ませたいよね
  //pp.draw();
   for(int i=0;i<teki.size();i++){
          enemy t=teki.get(i);
          t.run();
        }
  if(keyp==true){
    keysyori();
  }
}
