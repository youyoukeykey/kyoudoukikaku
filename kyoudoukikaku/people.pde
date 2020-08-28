class people{//継承という仕組みを用いてこれからステータスを受け継ぎます
  int x,y;
  int hp;
  int mp;
  int attack;
  int guard;
  int speed;
  int direction;
  boolean move(int nx,int ny){
    if(!map.isblocked(x+nx,y+ny)){
      x+=nx;
      y+=ny;
      return true;
    }
    return false;
  }
}
