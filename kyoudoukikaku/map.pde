//まるまるコピペしました。
final int chipSize = 32;
PImage images;
int x, y = 0;
int w = width / chipSize;
int h = height / chipSize;
float px = 100;
float py = 100;
Map map;
void mapsetup() {
  background(255);
  noStroke();
  frameRate(60);
  smooth();
  map = new  Map(chipSize, width, height);
}
int cx(int x) {
  return x*chipSize;
}
int cy(int y) {
  return y*chipSize;
}
void mapdraw(int x, int y) {
  background(255);
  map.map_draw((int)x, (int)y);
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
  color[] chipColors={
    color(#130983), //deap_sea
    color(#62AAE3), //sea
    color(#53EA89), //glass
    color(#1CD82A), //forest
    color(#D8BD1C), //mountain
    color(#D84F1C)  //crater
  };
  Map(int _chipSize, int _w, int _h) {
    chipSize=_chipSize;
    w=_w/chipSize;
    h=_h/chipSize;
  }
  int cx(int x) {
    return x*chipSize;
  }
  int cy(int y) {
    return y*chipSize;
  }
  int icx(int x) {
    return x/chipSize;
  }
  int icy(int y) {
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
  void map_draw(int _x, int _y) {
    int x, y;//=0
    x=_x;
    y=_y;
    noiseSeed(100);
    noStroke();
    for (int iy=0; iy<=h; iy++) {
      for (int ix=0; ix<=w; ix++) {
        int type = chipType(x -h/2+ ix, y -w/2+ iy);
        //fill(chipColors[type]);
        //rect(cx(ix), cy(iy), chipSize, chipSize);
        image(images[type], (float)cx(ix), (float)cy(iy), (float)chipSize, (float)chipSize);
        if (p.x==x -h/2+ ix&&p.y== y -w/2+ iy) {//プレイヤーの位置に四角を描くタイミングで一緒にプレイヤーも描画
          //println("a");
          fill(0);
          // rect(cx(ix), cy(iy), chipSize, chipSize);
          p.draw(cx(ix), cy(iy));
        }
        for (int i=0; i<teki.size(); i++) {
          enemy t=teki.get(i);
          if (t.enemypos.x==x -h/2+ ix&&t.enemypos.y== y -w/2+ iy) {
            fill(255, 255, 0);
            //rect(cx(ix), cy(iy), chipSize, chipSize);
          }
        }
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
