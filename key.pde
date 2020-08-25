//キー入力処理はここだけでたりてるはず
boolean keyp;
void keysyori(){
   if(keyCode==UP){
    p.direction=2;
    p.y--;
  }
  if(keyCode==RIGHT){
    p.direction=1;
    p.x++;
  }
  if(keyCode==DOWN){
    p.direction=0;
    p.y++;
  }
  if(keyCode==LEFT){
    p.direction=3;
    p.x--;
  }
}
void keyPressed(){
  //mapkeyPressed();
  keyp=true;
  if(key=='z'){
  }
}
void keyReleased(){
  keyp=false;
}
