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
  void draw(float _x,float _y){
  }
}
class damageanim extends eanim{
  float x,y;
  String t;
  float toumei=255;
  color c=color(255,255,255);
  damageanim(){
  }
  damageanim(float x,float y,String t){
    this.x=x;
    this.y=y;
    this.t=t;
  }
  damageanim(float x,float y,String t,color c){
    this.x=x;
    this.y=y;
    this.t=t;
    this.c=c;
  }
  void draw(float _x,float _y){
    fill(c,toumei);
    textSize(32);//仮
    text(t,x*chipSize-(_x),y*chipSize-(_y));
    y-=0.1;
    toumei-=10;
    if(toumei<0){
      delete=1;
    }
  }
}
class effectanim extends eanim{
}
