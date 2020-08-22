int chipSize = 16;
int x, y = 0;
int w = width / chipSize;
int h = height / chipSize;
float px = 100;
float py = 100;
Map map;
void setup() {
  size(1000, 1000);
  background(255);
  noStroke();
  frameRate(60);
  smooth();
  map = new  Map(32, width, height, px, py);
}
int cx(int x) {
  return x*chipSize;
}
int cy(int y) {
  return y*chipSize;
}
void draw() {
  background(255);
  map.map_draw();
  /*pushMatrix();
   translate(px,py);
   popMatrix();*/
}
void keyPressed() {
  if (keyCode==UP) {
    py--;
    map = new  Map(32, width, height, px, py);
  } else if (keyCode==RIGHT) {
    px++;
    map = new  Map(32, width, height, px, py);
  } else if (keyCode==DOWN) {
    py++;
    map = new  Map(32, width, height, px, py);
  } else if (keyCode==LEFT) {
    px--;
    map = new  Map(32, width, height, px, py);
  }
}
class Map {
  int chipSize;//=32
  int w;//=width/chipSize
  int h;//=height/chipSize
  int x, y;//=0
  color[] chipColors={
    color(#130983), //deap_sea
    color(#62AAE3), //sea
    color(#53EA89), //glass
    color(#1CD82A), //forest
    color(#D8BD1C), //mountain
    color(#D84F1C)  //fire_mouth
  };
  Map(int _chipSize, int _w, int _h, float _x, float _y) {
    chipSize=_chipSize;
    w=_w/chipSize;
    h=_h/chipSize;
    x=(int)_x;
    y=(int)_y;
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
  void map_draw() {
    noiseSeed(1);
    noStroke();
    for (int iy=0; iy<=h; iy++) {
      for (int ix=0; ix<=w; ix++) {
        int type = chipType(x + ix, y + iy);
        fill(chipColors[type]);
        rect(cx(ix), cy(iy), chipSize, chipSize);
      }
    }
  }
  int chipType(int x, int y) {
    float n = noise(x / (float)w, y / (float)h);
    if(x < 0&&y < 0){
      n += 0.04;
    }else if(x < 0){
      n += 0.03;
    }else if(y < 0){
      n += 0.02;
    }
    int type = 0;
    if (n<0.3) {
      type = 0;
    } else if (n<0.35) {
      type = 1;
    } else if (n>0.8) {
      type = 5;
    } else if (n>0.75) {
      type=4;
    } else if (n>0.65) {
      type=3;
    } else {
      type=2;
    }
    return type;
  }
}
