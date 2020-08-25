class player extends people{//プレイヤー
  anim[] walk=new anim[4];//上は１、右は２、下は３、左は４
  int fcount;
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
