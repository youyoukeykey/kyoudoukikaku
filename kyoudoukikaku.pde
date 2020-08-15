void setup(){
  noiseSeed(1);
}
float offz=0;
void draw(){
  loadPixels();
  int t=0;
  for(int i=0;i<width;i++){
    for(int k=0;k<height;k++){
      float offx=i*0.02;
      float offy=k*0.02;
      pixels[i+k*width]=color(noise(offx,offy,offz)*255,0,0);
      offz+=0.00001;
  }
  }
  updatePixels();
}
