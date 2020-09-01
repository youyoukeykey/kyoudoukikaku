void attacktoe(player p,enemy e){
  e.hp-=p.attack-e.def;
  anims.add(new damageanim(e.enemypos.x,e.enemypos.y,""+(p.attack-e.def)));
  if(e.hp<0){
    teki.remove(e);
  }
}
void knockbacktoe(player p,enemy e,float val){
  e.hx=(e.enemypos.x-p.x)/dist(e.enemypos.x,e.enemypos.y,p.x,p.y)+val;
  e.hy=(e.enemypos.y-p.y)/dist(e.enemypos.x,e.enemypos.y,p.x,p.y)+val;
}
