class player extends people{//プレイヤー
  anim[] walk=new anim[4];//上は2、右は1、下は0、左は3
  anim[] attackanim=new anim[4];
  int fcount;
  boolean attacking;
  player(){//ここはまだfeeling
    hp=10;
    mp=10;
    speed=1;
    guard=1;
    attack=1;
    x=0;
    y=0;
    direction=3;
    final int wh=32;
    for(int i=0;i<4;i++){//アニメ読み込み
        walk[i]=new anim(loadImage("character.png"),0,i*wh,64,32,4,false);
    }
    for(int i=0;i<4;i++){//アニメ読み込み
    if(i==1){
        attackanim[2]=new anim(loadImage("character.png"),0,(2+4)*wh,128,32,4,false);
    }else if(i==2){
        attackanim[1]=new anim(loadImage("character.png"),0,(1+4)*wh,128,32,4,false);
    }else{
     attackanim[i]=new anim(loadImage("character.png"),0,(i+4)*wh,128,32,4,false);
    }
    }
  }
  void draw(int _x,int _y){//座標指定あり描画
    fcount++;
    image(walk[direction].get(),_x,_y-chipSize,chipSize,chipSize*2);
    if(fcount%10==0){
    if(walk[direction].count+1<walk[direction].flame){
    walk[direction].count++;
    }else{
     walk[direction].count=0;
    }
  }
  }
  void draw(){//座標指定なし描画
    fcount++;
    image(walk[direction].get(),x,y-chipSize,chipSize,chipSize*2);
    if(fcount%10==0){
    if(walk[direction].count+1<walk[direction].flame){
    walk[direction].count++;
    }else{
      walk[direction].count=0;
    }
  }
  }
}
