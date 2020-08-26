class enemy{
  int houkou;        //0=up 1=right 2=down 3=left
  PVector enemypos;
  int yoko;
  int tate;
  boolean move;
  boolean oikake;
  PImage enemyup,enemydown,enemyright,enemyleft,enemy;
  enemy(){
    enemyup=loadImage("enemyup.png");
    enemydown=loadImage("enemydown.png");
    enemyright=loadImage("enemyright.png");
    enemyleft=loadImage("enemyleft.png");
    houkou=int(random(4));
    yoko=width/32;
    tate=height/32;
    enemypos=new PVector(int(random(yoko))+1,int(random(tate))+1);
    move=true;
    oikake=false;
  }
  void run(int x, int y){
    if(move==true){
      houkou=int(random(4));
      switch(houkou){
        case 0:
          enemypos.y+=32;
          enemy=enemyup;
          break;
        case 1:
          enemypos.x+=32;
          enemy=enemyright;
          break;
        case 2:
          enemypos.y-=32;
          enemy=enemydown;
          break;
        case 3:
          enemypos.x-=32;
          enemy=enemyleft;
          break;
      }
    }else{
      if(dist(enemypos.x,x,enemypos.y,y)<=160){
        switch(houkou){
          case 0:
            if(enemypos.y<=y){
              oikake=true;
            }
            break;
          case 1:
            if(enemypos.x<=x){
              oikake=true;
            }
            break;
          case 2:
            if(enemypos.y>=y){
              oikake=true;
            }
            break;
          case 3:
            if(enemypos.x>=x){
              oikake=true;
            }
            break;
        }
      }
    }
  }
}
