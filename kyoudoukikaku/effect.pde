ArrayList<eanim> anims=new ArrayList();
void animupdate(){
  for(int i=0;i<anims.size();i++){
    eanim m=anims.get(i);
    m.draw();
    if(m.delete==1){
      anims.remove(m);
    }
  }
}
class eanim{
  int delete=0;
  void draw(){
  }
}
class damageanim extends eanim{
  float x,y;
  String t;
  float toumei=0;
  damageanim(){
  }
  damageanim(float x,float y,String t){
    this.x=x;
    this.y=y;
    this.t=t;
  }
  void draw(){
    fill(0,255,255,toumei);
    textSize(32);//仮
    text(t,x,y);
    y-=1;
    toumei-=10;
    if(toumei<0){
      delete=1;
    }
  }
}
class effectanim extends eanim{
}