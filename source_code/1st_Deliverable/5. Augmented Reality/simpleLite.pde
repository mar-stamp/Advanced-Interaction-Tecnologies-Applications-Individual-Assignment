/**
 * NyARToolkit for proce55ing/3.0.5
 * (c)2008-2017 nyatla
 * airmail(at)ebony.plala.or.jp
 * 
 * 最も短いARToolKitのコードです。
 * Hiroマーカの上に立方体を表示します。
 * 全ての設定ファイルとマーカファイルはスケッチディレクトリのlibraries/nyar4psg/dataにあります。
 * 
 * This sketch is shortest sample.
 * The sketch shows cube on the marker of "patt.hiro".
 * Any pattern and configuration files are found in libraries/nyar4psg/data inside your sketchbook folder. 
*/
PImage img; 
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;

void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("patt.hiro",80);
  cam.start();
  img = loadImage("jkayyy.jpg");
}

void draw()
{
  if (cam.available() !=true) {
      return;
    
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  image(img, 0, 0, width, height);
  nya.endTransform();
}
