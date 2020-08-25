class sub{
  //hello
}

class anim{//くっついた画像から読み込むの専用のやつ
  gazou[] anim;
  int count=0;
  PImage img;
  int sx,sy,w,h,flame;
  anim(){
  }
  anim(PImage iimg,int isx,int isy,int iw,int ih,int iflame,boolean tate){
    sx=isx;
    sy=isy;
    w=iw;
    h=ih;
    flame=iflame;
    anim=new gazou[flame];
    img=iimg;
    for(int i=0;i<flame;i++){
      if(tate){
      anim[i]=new gazou(sx,sy+(i*h/flame),sx+w,sy+((i+1)*h/flame));
      }else{
      anim[i]=new gazou(sx+(i*w/flame),sy,sx+((i+1)*w/flame),sy+h);
      }
    }
  }
  PImage get(){
    return(anim[count].get());
  }
  class gazou{//画像管理用
  int sx,sy,ox,oy;
  gazou(int isx,int isy,int iox,int ioy){
    sx=isx;
    sy=isy;
    ox=iox;
    oy=ioy;
  }
  PImage get(){
    return(img.get(sx,sy,ox-sx,oy-sy));
  }
}
}
