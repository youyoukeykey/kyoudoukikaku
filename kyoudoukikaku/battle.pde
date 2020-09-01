void attacktoe(player p,enemy e){
  e.hp-=p.attack-e.def;
  anims.add(new damageanim(e.enemypos.x,e.enemypos.y,""+(p.attack-e.def)));
}
void knockbacktoe(player p,enemy e,float val){
}
