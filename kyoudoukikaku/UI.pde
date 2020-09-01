class UI{
  PImage uim;
  UI(){
    uim=loadImage("wakuwaku.png");
  }
  void draw(){
  fill(0);
  rect(12*chipSize,19*chipSize,chipSize*6,chipSize);
  rect(12*chipSize,21*chipSize,chipSize*6,chipSize);
  fill(0,255,0);
  rect(12*chipSize,19*chipSize,chipSize*6*((float)p.hp/(float)p.maxhp),chipSize);
  fill(#EFF70C);
  rect(12*chipSize,21*chipSize,chipSize*6*((float)p.exp/(float)p.maxexp),chipSize);
  image(uim,0,0);
  }
}
