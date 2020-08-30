class people{//継承という仕組みを用いてこれからステータスを受け継ぎます
  float x,y;
  int hp;
  int mp;
  int attack;
  int guard;
  int speed;
  int direction;
  boolean move(float nx,float ny){
    int hx=(int)(nx/abs(nx));
    int hy=(int)(ny/abs(ny));
    if(!map.isblocked(floor(x+0.5)+hx,floor(y+0.5)+hy)){
      x+=nx;
      y+=ny;
      println(y+ny);
      return true;
    }
    println("blocked");
    return false;
  }
  void attack(){
  }
  void attacked(){
  }
}
