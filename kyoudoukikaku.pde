String path;
player p;
void setup(){
  noiseSeed(1);
  size(700,700);
  String  path  =  sketchPath( ) ;
  println(path);
  p=new player();
}
void draw(){
  background(255);
  p.draw();
}
