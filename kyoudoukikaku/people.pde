class people{//継承という仕組みを用いてこれからステータスを受け継ぎます
  float x,y;
  int hp;
  int mp;
  int attack;
  int guard;
  int speed;
  float hx=0;
  float hy=0;
  int direction;
  boolean move(float nx,float ny){
    int hx=(int)(nx/abs(nx));
    int hy=(int)(ny/abs(ny));
    if(!map.isblocked(floor(x+0.5)+hx,floor(y+0.5)+hy)){
      x+=nx;
      y+=ny;
      //println(y+ny);
      return true;
    }
    //println("blocked");
    return false;
  }
  void knockback(){
    move(hx,hy);
    hx*=0.7;
    hy*=0.7;
    if(hx<=0.3){
      hx=0;
    }
    if(hy<=0.3){
      hy=0;
    }
  }
  void attack(){
  }
  void attacked(){
  }
}
