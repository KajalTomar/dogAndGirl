import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dogAndGirl extends PApplet {

public void setup() {
  
  frameRate(30);
  ortho(-1, 1, 1, -1);
  colorMode(RGB, 1.0f);
  noLoop();
  hint(DISABLE_OPTIMIZED_STROKE);
}

public void draw() {
  background(0.75f, 0.75f, 0.75f);

  resetMatrix();
  draw_scenes();
}

public void draw_scenes(){
  scene_1();
}

// 1. Hungry puppy: 
// The x-centre of each object is swapped (dog is drawn at girl's x-centre, and vice versa). 
// The dog is reflected around his own y-axis.
public void scene_1(){ 

  // scales the original picture to the correct size
  // and centres it on the screen
  scale(0.67f);
  translate(-0.5f,-0.5f);

  translate(-1,1);

  pushMatrix();
 
  drawGirl();
  drawDog();
  
  popMatrix();
  
  scene_2();
}

// 2. Squished: 
// The entire scene is non-uniformly scaled by 110% horizontally and 60% vertically. 
// The bottom of the figures are at the bottom of the sector.
public void scene_2(){
  translate(1,0);

  pushMatrix();
  
  scale(1.1f,0.6f);
  drawGirl();
  drawDog();

  popMatrix();

  scene_3();
}

// 3. Topsy-turvy: 
// The entire scene is rotate by 30 degrees counter-clockwise around its centre.
public void scene_3(){
  translate(1,0);

  pushMatrix();

  // rotate(PI/6);
 
  drawGirl();
  drawDog();

  popMatrix();
  scene_6();
}

// 4) Tiny: 
// Each object is scaled to 30% of its original size, 
// and centred at the original object centre.
public void scene_4(){
  translate(-1,0);
  
  pushMatrix();

  drawGirl();
  drawDog();

  popMatrix();

  scene_7();
}

public void scene_5(){
  translate(-1, 0);
  
  pushMatrix();

  drawGirl();
  drawDog();

  popMatrix();

  scene_4();
}

// Wind storm: 
// The dog is sheared by -40% along his x axis (vertical centre), 
// the girl is sheared by 50% along her y axis (horizontal centre).
public void scene_6(){
  translate(0,-1);
  
 

  pushMatrix();

  //shearX((-2/9)*PI);
  drawDog();
  popMatrix();

  pushMatrix();
  shearY(-PI/3);
  drawGirl();
  popMatrix();

  scene_5();
}

public void scene_7(){
  translate(0,-1);

  pushMatrix();

  drawGirl();
  drawDog();

  popMatrix();

  scene_8();
}

public void scene_8(){
  translate(1,0);

  pushMatrix();

  drawGirl();
  drawDog();

  popMatrix();

  scene_9();
}

public void scene_9(){
  translate(1,0);



  drawGirl();
  drawDog();


}


public void drawSquare(){
  beginShape(QUADS);
    vertex(0,0);
    vertex(0,1);
    vertex(1,1);
    vertex(1,0);
  endShape();
}

public void drawGirl() {
  float[] v;
  beginShape(TRIANGLES);
  for (int[] tri: GIRL_TRIANGLES) {
    float[] colour = COLOURS[tri[3]];
    fill(colour[0], colour[1], colour[2]);
    v = GIRL_VERTICES[tri[0]];
    vertex(v[0], v[1]);
    v = GIRL_VERTICES[tri[1]];
    vertex(v[0], v[1]);
    v = GIRL_VERTICES[tri[2]];
    vertex(v[0], v[1]);
  }
  endShape();
}

public void drawDog() {
  float[] v;
  beginShape(TRIANGLES);
  for (int[] tri: DOG_TRIANGLES) {
    float[] colour = COLOURS[tri[3]];
    fill(colour[0], colour[1], colour[2]);
    v = DOG_VERTICES[tri[0]];
    vertex(v[0], v[1]);
    v = DOG_VERTICES[tri[1]];
    vertex(v[0], v[1]);
    v = DOG_VERTICES[tri[2]];
    vertex(v[0], v[1]);
  }
  endShape();
}

public void mouseClicked() {
  redraw();
}

final float[][] COLOURS = new float[][] {
  { 0.0f, 0.0f, 1.0f },
  { 0.0f, 1.0f, 0.0f },
  { 1.0f, 0.0f, 0.0f },
  { 0.0f, 1.0f, 1.0f },
  { 1.0f, 0.0f, 1.0f },
  { 1.0f, 1.0f, 0.0f },
  { 0.0f, 0.5f, 0.5f },
  { 0.5f, 0.0f, 0.5f },
  { 0.5f, 0.5f, 0.0f },
  { 0.5f, 0.5f, 0.5f }
};
final float[][] GIRL_VERTICES = new float[][] {
  { 0.753125f, 0.71802497f },
  { 0.9106249f, 0.98945f },
  { 0.65375f, 1.0f },
  { 0.644375f, 0.29837498f },
  { 0.58625f, 0.0038499997f },
  { 0.689375f, 0.0038499997f },
  { 0.831875f, 0.30607498f },
  { 0.77562493f, 0.013475f },
  { 0.87500006f, 0.0f },
  { 0.57499987f, 0.2233f },
  { 0.91624993f, 0.21367499f },
  { 0.753125f, 0.71994996f },
  { 0.53749996f, 0.68915f },
  { 0.485f, 0.61022496f },
  { 0.71750003f, 0.55439997f },
  { 0.94812495f, 0.65834993f },
  { 0.9612499f, 0.56595f },
  { 0.77187496f, 0.5775f },
  { 0.8975f, 0.72187495f },
  { 0.9931249f, 0.72765f },
  { 0.9668749f, 0.51205f },
  { 0.88062495f, 0.798875f },
  { 0.9931249f, 0.806575f }
};
final int[][] GIRL_TRIANGLES = new int[][] {
  { 0, 1, 2, 3 },
  { 3, 4, 5, 7 },
  { 6, 7, 8, 7 },
  { 9, 10, 11, 4 },
  { 12, 13, 14, 6 },
  { 15, 16, 17, 6 },
  { 18, 19, 20, 5 },
  { 21, 18, 22, 1 },
  { 19, 22, 18, 1 }
};
final float[] GIRL_CENTRE = new float[] { 0.739f, 0.5f };

final float[][] DOG_VERTICES = new float[][] {
  { 0.11125f, 0.1375f },
  { 0.0725f, 0.0f },
  { 0.15875f, 0.0025f },
  { 0.32f, 0.17f },
  { 0.28f, 0.0f },
  { 0.35375f, 0.0025f },
  { 0.0525f, 0.106249996f },
  { 0.44f, 0.17125f },
  { 0.415f, 0.31875f },
  { 0.049999997f, 0.2225f },
  { 0.022499999f, 0.26874998f },
  { 0.0f, 0.24374999f },
  { 0.51625f, 0.4f },
  { 0.52625f, 0.32f },
  { 0.51375f, 0.2575f }
};
final int[][] DOG_TRIANGLES = new int[][] {
  { 0, 1, 2, 9 },
  { 3, 4, 5, 9 },
  { 6, 7, 8, 8 },
  { 9, 6, 8, 8 },
  { 10, 11, 9, 6 },
  { 8, 12, 13, 9 },
  { 14, 13, 8, 9 }
};
final float[] DOG_CENTRE = new float[] { 0.263125f, 0.2f };
  public void settings() {  size(640, 640, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dogAndGirl" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
