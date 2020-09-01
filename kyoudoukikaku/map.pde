//まるまるコピペしました。
final int chipSize = 32;
PImage images;
PImage title;
int x=0, y=0;
int w = width / chipSize;
int h = height / chipSize;
float px = 100;
float py = 100;
char maps = 0;
char ops = 1;
Map map;
Map op;
void mapsetup() {
  background(255);
  noStroke();
  frameRate(60);
  smooth();
  map = new  Map(chipSize, width, height, ops);
  op = new Map(chipSize, width, height, ops);
}
int cx(int x) {
  return x*chipSize;
}
int cy(int y) {
  return y*chipSize;
}
void opdraw(int x, int y) {
  background(255);
  op.map_draw((int)x, (int)y);
}
void mapdraw(float x, float y) {
  background(255);
  map.map_draw(x, y);
  /*pushMatrix();
   translate(px,py);
   popMatrix();*/
}
void mapkeyPressed() {
  if (keyCode==UP) {
    py--;
  } else if (keyCode==RIGHT) {
    px++;
  } else if (keyCode==DOWN) {
    py++;
  } else if (keyCode==LEFT) {
    px--;
  }
}
class Map {
  int chipSize;//=32
  int w;//=width/chipSize
  int h;//=height/chipSize
  int ix, iy;
  int[] op_images_y;
  int[][] op_nf;
  int[][] types;
  char MaOf;
  char count=0;
  char df=0;
  char deap_sea = 0;
  char sea = 1;
  char glass = 2;
  char forest = 3;
  char mountain = 4;
  char crater = 5;
  PImage[] images={
    loadImage("deap_sea.png"), 
    loadImage("sea.png"), 
    loadImage("glass.png"), 
    loadImage("forest.png"), 
    loadImage("mountain.png"), 
    loadImage("crater.png")
  };
  PImage title = loadImage("title.png");
  color[] chipColors={
    color(#130983), //deap_sea
    color(#62AAE3), //sea
    color(#53EA89), //glass
    color(#1CD82A), //forest
    color(#D8BD1C), //mountain
    color(#D84F1C)  //crater
  };
  Map(int _chipSize, int _w, int _h, char _MaOf) {
    chipSize=_chipSize;
    w=_w/chipSize;
    h=_h/chipSize;
    MaOf = _MaOf;
    op_images_y = new int[h+1];
    op_nf = new int[w+1][h+1];
    types = new int[w+1][h+1];
    for (int iy=0; iy<=h; iy++) {
      op_images_y[iy]=0;
      for (int ix=0; ix<=w; ix++) {
        op_nf[ix][iy]=0;
      }
    }
  }
  float cx(int x) {
    return x*chipSize;
  }
  float cy(int y) {
    return y*chipSize;
  }
  float icx(int x) {
    return x/chipSize;
  }
  float icy(int y) {
    return y/chipSize;
  }
  boolean isblocked(int x, int y) {//通行出来なかったらtrue
    if (chipType(x, y)==deap_sea) {
      return true;
    } else if (chipType(x, y)==crater) {
      return true;
    }
    return false;
  }
  void map_draw(float _x, float _y) {
    int x, y;
    x=0;
    y=0;//=0
    //println("aaa", x, _x, y, _y);
    x=floor(_x);
    y=floor(_y);
    float offsetx=x-(_x);
    float offsety=y-(_y);
    noiseSeed(100);
    noStroke();
    for (int iy=0; iy<=h; iy++) {
      for (int ix=0; ix<=w; ix++) {
        int type = chipType(x -h/2+ ix, y -w/2+ iy);
        types[ix][iy]=type;
        if (MaOf == 0) {//map
          //fill(chipColors[type]);
          //rect(cx(ix), cy(iy), chipSize, chipSize);
          image(images[type], (float)cx(ix)+offsetx*chipSize, (float)cy(iy)+offsety*chipSize, (float)chipSize, (float)chipSize);
          if (p.x==x -h/2+ ix&&p.y== y -w/2+ iy) {//プレイヤーの位置に四角を描くタイミングで一緒にプレイヤーも描画
            //println("a");
            fill(0);
            // rect(cx(ix), cy(iy), chipSize, chipSize);
            // p.draw(cx(ix), cy(iy));
          }
        } else if (MaOf == 1) {//op
          if (count==0) {
            char n = (char)random(2);
            op_nf[ix][iy]=n;
          }
          if (op_nf[ix][iy] == 0) {
            image(images[types[ix][iy]], (float)cx(ix), (float)cy(iy), (float)chipSize, (float)chipSize);
          } /*else if (n == 1) {
           image(images[type], (float)cx(ix), (float)cy(op_images_y[iy]), (float)chipSize, (float)chipSize);
           println("n == 1");
           if (op_images_y[iy]<iy) {
           op_images_y[iy]+=1;
           }
           }*/
        }
      }
    }
    if (MaOf == 1) {
      op_drop();
      count++;
    } else {//プレイやー、敵の描画
      p.draw((p.x-x+w/2)*chipSize+offsetx*chipSize, (p.y-y+h/2)*chipSize+offsety*chipSize);
      for (int i=0; i<teki.size(); i++) {
        enemy t=teki.get(i);
        if (dist(t.enemypos.x, t.enemypos.y, x, y)<=100) {
          fill(255, 255, 0);
          image(loadImage("messy.png").get(11,10,23,23),(t.enemypos.x-x+w/2)*chipSize+offsetx*chipSize, (t.enemypos.y-y+h/2)*chipSize+offsety*chipSize, chipSize, chipSize);
        }
      }
      for(int i=0;i<anims.size();i++){
        eanim ee=anims.get(i);
        ee.draw((x-w/2)*chipSize-offsetx*chipSize,(y-h/2)*chipSize-offsety*chipSize);
        if(ee.delete==1){
          anims.remove(ee);
        }
      }
    }
  }
  void op_drop() {
    if (keyPressed) {
      if (key=='z') {
        MaOf=0;
      }
    }
    if (df == 0) {
      for (int iiy=0; iiy<=h; iiy++) {
        for (int iix=0; iix<=w; iix++) {
          if (op_nf[iix][iiy]==1) {
            ix = iix;
            iy = iiy;
            df = 1;
            break;
          }
        }
      }
      if(df == 0){
        image(title,(width - 500)/2,(height-250)/2,500,250);
      }
    } else if (df == 1) {
      image(images[types[ix][iy]], (float)cx(ix), (float)cy(op_images_y[iy]), (float)chipSize, (float)chipSize);
      if (op_images_y[iy]<=iy) {
        op_images_y[iy]+=5;
      } else {
        op_nf[ix][iy]=0;
        op_images_y[iy]=0;
        ix=0;
        iy=0;
        df = 0;
      }
    }
  }
  int chipType(int x, int y) {
    float n = noise(x / (float)w, y / (float)h);
    if (x < 0&&y < 0) {
      n += 0.04;
    } else if (x < 0) {
      n += 0.03;
    } else if (y < 0) {
      n += 0.02;
    }
    int type = 0;
    /*crater 0.8
     mountain 0.75
     forest 0.6
     glass 0.35
     sea 0.27
     deap_sea */
    if (n<0.3) {
      type = deap_sea;
    } else if (n<0.35) {
      type = sea;
    } else if (n>0.8) {
      type = crater;
    } else if (n>0.75) {
      type = mountain;
    } else if (n>0.65) {
      type = forest;
    } else {
      type = glass;
    }
    return type;
  }
}
