class player extends people{
  anim[] walk=new anim[4];//上は１、右は２、下は３、左は４
  anim[] run=new anim[4];
  int fcount;
  player(){
    hp=10;
    mp=10;
    speed=1;
    guard=1;
    attack=1;
    x=0;
    y=0;
    direction=3;
    final int wh=16;
    for(int i=0;i<4;i++){
        walk[i]=new anim(loadImage("cloakandleather.png"),0,i*wh,32,16,2,false);
    }
    for(int i=0;i<4;i++){
       run[i]=new anim(loadImage("cloakandleather.png"),0,(i+4)*wh,64,16,4,false);
    }
  }
  void draw(){
    fcount++;
    image(walk[direction].get(),100,100,320,320);
    if(fcount%10==0){
    if(walk[direction].count+1<walk[direction].flame){
    walk[direction].count++;
    }else{
      walk[direction].count=0;
    }
  }
  }
}
