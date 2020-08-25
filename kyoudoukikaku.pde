String path;
player p;
void setup(){
  noiseSeed(1);
  size(700,700);
  String  path  =  sketchPath( ) ;
  p=new player();
  mapsetup();
}
void draw(){
  background(255);
  mapdraw(p.x,p.y);
  //pp.draw();
  if(keyp==true){
    keysyori();
  }
}
