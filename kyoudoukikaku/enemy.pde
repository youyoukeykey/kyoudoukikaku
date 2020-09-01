class enemy {
  int houkou;        //0=up 1=right 2=down 3=left
  PVector enemypos;
  int yoko;
  int tate;
  boolean move;
  boolean oikake;
  int hp=20;
  int fc;
  int def=1;
  float hx=0;//ノックバックｘ
  float hy=0;//ノックバックｙ
  enemy() {
    yoko=20;
    tate=20;
    enemypos=new PVector(32*int(random(yoko))+1, 32*int(random(tate))+1);
    move=true;
    oikake=false;
  }
  void knockback(){
    enemypos.x+=hx;
    enemypos.y+=hy;
    hx*=0.7;
    hy*=0.7;
    if(hx<=0.3){
      hx=0;
    }
    if(hy<=0.3){
      hy=0;
    }
  }
  void run() {
    knockback();
    if (oikake==false) {
      if (move==true) {
        fc++;
        if(fc%100==0){
        houkou=int(random(4));
        }
        switch(houkou) {
        case 0:
          enemypos.y+=0.01;
          break;
        case 1:
          enemypos.x+=0.01;
          break;
        case 2:
          enemypos.y-=0.01;
          break;
        case 3:
          enemypos.x-=0.01;
          break;
        }
      } else {
        if (dist(enemypos.x, enemypos.y, p.x, p.y)<=160) {
          switch(houkou) {
          case 0:
            if (enemypos.y<=p.y) {
              oikake=true;
            }
            break;
          case 1:
            if (enemypos.x<=p.x) {
              oikake=true;
            }
            break;
          case 2:
            if (enemypos.y>=p.y) {
              oikake=true;
            }
            break;
          case 3:
            if (enemypos.x>=p.x) {
              oikake=true;
            }
            break;
          }
        }
      }
    } else {
      //oikake
      if (enemypos.x<p.x) {
        enemypos.x+=0.1;
      } else if (enemypos.x>p.x) {
        enemypos.x-=0.1;
      }
      if (enemypos.y<p.y) {
        enemypos.y+=0.1;
      } else if (enemypos.y>p.y) {
        enemypos.y-=0.1;
      }
      //oikake=false;
    }
    //rect(enemypos.x, enemypos.y, 32, 32);
    //println(p.x,p.y,enemypos.x,enemypos.y);
  }
}
