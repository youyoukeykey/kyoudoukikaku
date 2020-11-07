void attacktoe(player p,enemy e){
  e.hp-=(int)p.attack-e.def;
  anims.add(new damageanim(e.enemypos.x,e.enemypos.y,""+(int)(p.attack-e.def)));
  if(e.hp<0){
    teki.remove(e);
    p.exp+=5;
    float cy=0;
    while(p.exp>=p.maxexp){
    anims.add(new damageanim(p.x,p.y+cy,"levelUP!",#EFF70C));
    p.exp=p.exp-p.maxexp;
    p.maxexp*=1.5;
    p.maxhp*=1.5;
    p.hp=p.maxhp;
    p.attack*=1.5;
    p.guard*=1.5;
    cy-=10;
    }
  }
}
void knockbacktoe(player p,enemy e,float val){
  e.hx=(e.enemypos.x-p.x)/dist(e.enemypos.x,e.enemypos.y,p.x,p.y)+val;
  e.hy=(e.enemypos.y-p.y)/dist(e.enemypos.x,e.enemypos.y,p.x,p.y)+val;
}
