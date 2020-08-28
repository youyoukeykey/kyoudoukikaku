class enemy {
  int houkou;        //0=up 1=right 2=down 3=left
  PVector enemypos;
  int yoko;
  int tate;
  boolean move;
  boolean oikake;
  enemy() {
    yoko=20;
    tate=20;
    enemypos=new PVector(32*int(random(yoko))+1, 32*int(random(tate))+1);
    move=false;
    oikake=true;
  }
  void run() {
    if (oikake==false) {
      if (move==true) {
        houkou=int(random(4));
        switch(houkou) {
        case 0:
          enemypos.y+=32;

          break;
        case 1:
          enemypos.x+=32;

          break;
        case 2:
          enemypos.y-=32;

          break;
        case 3:
          enemypos.x-=32;

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
        enemypos.x+=1;
      } else if (enemypos.x>p.x) {
        enemypos.x-=1;
      }
      if (enemypos.y<p.y) {
        enemypos.y+=1;
      } else if (enemypos.y>p.y) {
        enemypos.y-=1;
      }
      //oikake=false;
    }
    //rect(enemypos.x, enemypos.y, 32, 32);
    println(enemypos.x,enemypos.y);
  }
}
