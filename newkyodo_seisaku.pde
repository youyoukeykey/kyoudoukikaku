enemy enemy1;
void setup() {
  enemy1=new enemy();
  size(640, 640);
}
void draw() {
  background(255);
  enemy1.run(int(mouseX), int(mouseY));
  delay(1000);
}

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
    move=true;
    oikake=false;
  }
  void run(int x, int y) {
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
        if (dist(enemypos.x, enemypos.y, x, y)<=160) {
          switch(houkou) {
          case 0:
            if (enemypos.y<=y) {
              oikake=true;
            }
            break;
          case 1:
            if (enemypos.x<=x) {
              oikake=true;
            }
            break;
          case 2:
            if (enemypos.y>=y) {
              oikake=true;
            }
            break;
          case 3:
            if (enemypos.x>=x) {
              oikake=true;
            }
            break;
          }
        }
      }
    } else {
      //oikake
      if (enemypos.x<x) {
        enemypos.x+=32;
      } else if (enemypos.x>x) {
        enemypos.x-=32;
      }
      if (enemypos.y<y) {
        enemypos.y+=32;
      } else if (enemypos.y>y) {
        enemypos.y-=32;
      }
      oikake=false;
    }
    rect(enemypos.x, enemypos.y, 32, 32);
  }
}
