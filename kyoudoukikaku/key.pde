//キー入力処理はここだけでたりてるはず
boolean keyp;
void keysyori(){
   if(keyCode==UP){
    p.direction=2;
    p.move(0,-0.1);
    println("up");
  }
  if(keyCode==RIGHT){
    p.direction=1;
    p.move(0.1,0);
  }
  if(keyCode==DOWN){
    p.direction=0;
    p.move(0,0.1);
  }
  if(keyCode==LEFT){
    p.direction=3;
    p.move(-0.1,0);
  }
}
void keyPressed(){
  //mapkeyPressed();
  keyp=true;
  if(key=='z'){
    p.attacking=true;
  }
}
void keyReleased(){
  keyp=false;
}
