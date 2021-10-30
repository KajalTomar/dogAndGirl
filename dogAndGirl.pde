//------------------------------------------------------------------------------
// NAME: Kajal Tomar
// STUDENT NUMBER: 7793306
// COURSE: COMP3490
// INSTRUCTOR: John Braico
// ASSIGNMENT: 2, QUESTION: 1
//------------------------------------------------------------------------------

float SECTOR_SIZE = 0.67; // 2/3

void setup() {
  size(640, 640, P3D);
  frameRate(30);
  ortho(-1, 1, 1, -1);
  colorMode(RGB, 1.0);
  noLoop();
  hint(DISABLE_OPTIMIZED_STROKE);
}

void draw() {
  background(0.75, 0.75, 0.75);

  resetMatrix();
  draw_sectors();
}

// initates all the scence to be drawn, by drawing the first sector
void draw_sectors(){
  sector_1(); 
}


// 1. Hungry puppy: 
// The x-centre of each object is swapped (PUPPY is drawn at girl's x-centre, and vice versa). 
// The PUPPY is reflected around his own y-axis.
void sector_1(){ 

  float centre_difference = GIRL_CENTRE[0]-PUPPY_CENTRE[0];

  // draw the PUPPY ------------------------------------------------------
  pushMatrix();
  
  translate(-SECTOR_SIZE,SECTOR_SIZE); // translate to the sector 1
  scale(SECTOR_SIZE); // scale to sector size 
  scale(-1,1);  // reflect. Hungry puppy!
  translate(-0.5,-0.5); // move the scene to the center of the screen 
  
  drawPUPPY();

  popMatrix();
  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------
  pushMatrix();
  
  translate(-SECTOR_SIZE,SECTOR_SIZE); // translate to the sector 1
  scale(SECTOR_SIZE); // scale to sector size 
  translate(-centre_difference,0); // change centre
  translate(-0.5,-0.5); // move the scene to the center of the screen 
  
  drawGirl();

  popMatrix();
   // --------------------------------------------------------------------

  sector_2(); // draw the next scence

} //sector_1

// 2. Squished: 
// The entire sector is non-uniformly scaled by 110% horizontally and 60% vertically. 
// The bottom of the figures are at the bottom of the sector.
void sector_2(){

  // draw the PUPPY  and the girl ----------------------------------------------------------
  pushMatrix();

  translate(0,SECTOR_SIZE-((SECTOR_SIZE-(SECTOR_SIZE*0.6)))/2); // translate to sector 2
  // size after squish = 0.67 * 0.6 = 0.402 (0.67-0.402=0.268 space top and bottom -> 0.268/2 = 0.134 top)
  scale(1.1,0.6); // squish! 
  scale(SECTOR_SIZE); // scale to sector size
  translate(-0.5,-0.5); // move the scene to the center of the screen 
 
  drawGirl();
  drawPUPPY();
  
  popMatrix();
  // -------------------------------------------------------------------------------------

  sector_3(); // draw the next sector

} //sector_2

// 3. Topsy-turvy: 
// The entire sector is rotate by 30 degrees counter-clockwise around its centre.
void sector_3(){
  
  // draw the PUPPY  and the girl ----------------------------------------------------------
  pushMatrix();

  translate(SECTOR_SIZE,SECTOR_SIZE); // translate to the sector 3
  scale(SECTOR_SIZE); // scale to sector size
  rotate(radians(30));  // Topsy-turvy!
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawGirl();
  drawPUPPY();

  popMatrix();
  // --------------------------------------------------------------------------------------

  sector_4(); // draw the next sector

} //sector_3

// 4) Tiny: 
// Each object is scaled to 30% of its original size, 
// and centred at the original object centre.
void sector_4(){

  // draw the PUPPY ------------------------------------------------------
  pushMatrix();

  translate(-SECTOR_SIZE-(PUPPY_CENTRE[0]*SECTOR_SIZE),-PUPPY_CENTRE[1]); // translate to the sector 4
  scale(SECTOR_SIZE); // scale to sector size
  scale(0.30); // scale to 30%. Tiny!
  translate(PUPPY_CENTRE[0],PUPPY_CENTRE[1]); // move the PUPPY to the centre of the screen 
  translate(-0.5,-0.5); // move to the scence to center of the screen 

  drawPUPPY();

  popMatrix();
  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------
  pushMatrix();

  translate(-SECTOR_SIZE+((GIRL_CENTRE[0]-0.5)*SECTOR_SIZE),0); // translate to the sector 4
  scale(SECTOR_SIZE); // scale to sector size   
  scale(0.30); // scale to 30%. Tiny!
  translate(-GIRL_CENTRE[0]+0.5, 0);  // move the girl to the centre of the screen
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawGirl();

  popMatrix();
  // --------------------------------------------------------------------

  sector_5(); // draw the next sector

} // sector_4

// 5. Easy one!: The scene is drawn at the correct size to fill the sector.
void sector_5(){

   // draw the PUPPY  and the girl ----------------------------------------------------------
  pushMatrix();

  scale(SECTOR_SIZE); // scale to sector size
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawGirl();
  drawPUPPY();

  popMatrix();
  // --------------------------------------------------------------------------------------

  sector_6(); // draw the next scence

} // sector_5

// 6. Wind storm: 
// The PUPPY is sheared by -40% along his x axis (vertical centre), 
// the girl is sheared by 50% along her y axis (horizontal centre).
void sector_6(){
  
  // draw the PUPPY -------------------------------------------------------
  pushMatrix();

  translate(SECTOR_SIZE-(0.4/(SECTOR_SIZE*10)),0); // translate to the sector 6
  scale(SECTOR_SIZE); // scale to sector size
  shearX(-0.4); // shear by -40% along the x axis. The wind!
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawPUPPY();

  popMatrix();
  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------
  pushMatrix();

  translate(SECTOR_SIZE,-0.5/(SECTOR_SIZE*10)); // translate to the sector 6
  scale(SECTOR_SIZE); // scale to sector size
  shearY(0.5); // shear by 50% along the y axis. The Wind!
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawGirl();
  popMatrix();
  // --------------------------------------------------------------------

  sector_7(); // draw the next sector
 
} //draw sector_6

// Happy puppy: The PUPPY is scaled to 20% of his original size, 
// and rotated from 0 to 180 degrees by 30 degrees at a time,
// and drawn after each (seven times total). The PUPPY's x-centre is unchanged. 
// The PUPPY's y position is evenly distributed from the top to the bottom of the scene.
// The girl is reflected around her y-axis.
void sector_7(){
  float difference = SECTOR_SIZE/6; // the amount of space between each puppy
  final int ROTATE_BY = 30; 
  int rotationAmount = 0;
  
  for(float i = -(SECTOR_SIZE/2); i < SECTOR_SIZE/2; i+=difference){

     // draw the PUPPY -------------------------------------------------------
    pushMatrix();

    translate(-SECTOR_SIZE-(PUPPY_CENTRE[0]*SECTOR_SIZE),-SECTOR_SIZE+0.04); // translate to the sector 7
    translate(0,i); // translate up to the right place
    scale(SECTOR_SIZE); // scale to sector size
    scale(0.20); // scale to 20%
    rotate(radians(rotationAmount));
    translate(PUPPY_CENTRE[0],PUPPY_CENTRE[1]); // move the PUPPY to the centre of the screen
    translate(-0.5,-0.5); // move the scene to the center of the screen 

    drawPUPPY();
    popMatrix();

    rotationAmount+= ROTATE_BY;
    if(rotationAmount > 180){
      rotationAmount = 0;
    }
  }

  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------
  pushMatrix();
  
  translate(-SECTOR_SIZE,-SECTOR_SIZE); // translate to the sector 7
  scale(SECTOR_SIZE); // scale to sector size 
  translate(GIRL_CENTRE[0]*SECTOR_SIZE,0); 
  scale(-1,1);  // reflect!
  translate(-0.5,-0.5); // move the scene to the center of the screen 
  
  drawGirl();

  popMatrix();
  // --------------------------------------------------------------------

  sector_8(); // draw the next sector

} // sector_7

// Draw a crowd: The girl and the dog are each drawn ten times, 
// with randomly-selected sizes between 10% and 50% of their original, 
// and randomly-selected positions that ensure they stay in the bounds 
// of the sector. Sizes and positions are randomly chosen at run-time, 
// and will be different on redraw. Images may overlap each other as long as
// they don't go outside the sector.
void sector_8(){
  float scaleAmount = 0; 
  float positionX = 0;
  float positionY = 0;

  // draw the PUPPY -------------------------------------------------------
  for(int i = 0; i < 10; i++){

  // pick all the random values 
  scaleAmount = random(0.1,0.5); 
  positionX = random((-SECTOR_SIZE/2)+(PUPPY_CENTRE[0]*scaleAmount),(SECTOR_SIZE/2)-(PUPPY_CENTRE[0]*scaleAmount));
  positionY = random((-SECTOR_SIZE/2)+(PUPPY_CENTRE[1]*scaleAmount),(SECTOR_SIZE/2)-(PUPPY_CENTRE[1]*scaleAmount));
  
  pushMatrix();
  
  translate(0,-SECTOR_SIZE); // translate to the sector 6
  translate(positionX,positionY);
  scale(SECTOR_SIZE); // scale to sector size
  scale(scaleAmount);
  translate(PUPPY_CENTRE[0], PUPPY_CENTRE[1]); // move the puppy to the centre of the screen
  translate(-0.5,-0.5); // move the scene to the center of the screen 
  
  drawPUPPY();

  popMatrix();
  }
  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------

  for(int i = 0; i < 10; i++){

  // pick all the random values 
  scaleAmount = random(0.1,0.5); 
  positionX = random((-SECTOR_SIZE/2)+(GIRL_CENTRE[0]*scaleAmount),(SECTOR_SIZE/2)-(GIRL_CENTRE[0]*scaleAmount));
  positionY = random((-SECTOR_SIZE/2)+(GIRL_CENTRE[1]*scaleAmount),(SECTOR_SIZE/2)-(GIRL_CENTRE[1]*scaleAmount));
  
  pushMatrix();

  translate(0,-SECTOR_SIZE); // translate to the sector 6
  translate(positionX,positionY);
  scale(SECTOR_SIZE); // scale to sector size
  scale(scaleAmount);
  translate(-GIRL_CENTRE[0]+0.5, 0);  // move the girl to the centre of the screen
  translate(-0.5,-0.5); // move the scene to the center of the screen 
  
  drawGirl();

  popMatrix();
  }
  // --------------------------------------------------------------------

  sector_9(); // draw the next sector

} //sector_8

// Dog time: The girl is scaled to 40% of her original size and drawn at 
// the centre of the scene. The dog is scaled to 20% of his original size 
// and drawn "clock style" (12 evenly-spaced rotations) around the centre, 
// chasing his tail.
void sector_9(){
  float x = 1;
  float y = 0;

   // draw the PUPPY -------------------------------------------------------
  for(float i = 0; i <= 360; i+=30){

    pushMatrix();

    translate(SECTOR_SIZE,-SECTOR_SIZE); // translate to the sector 6
    scale(SECTOR_SIZE); // scale to sector size
    scale(0.20); // scale to 20%
    translate(2*cos(radians(i)),2*sin(radians(i))); // move in a circle
    rotate(radians(i+270));
    translate(PUPPY_CENTRE[0], PUPPY_CENTRE[1]); // move the puppt to the center of the screen
    translate(-0.5,-0.5); // move the scene to the center of the screen 

    drawPUPPY();
    popMatrix();
  }

  // --------------------------------------------------------------------

  // draw the girl ------------------------------------------------------

  pushMatrix();

  translate(SECTOR_SIZE,-SECTOR_SIZE);
  scale(SECTOR_SIZE); // scale to sector size
  scale(0.40); // scale to 40%
  translate(-GIRL_CENTRE[0]+0.5, 0);  // move the girl to the centre of the screen
  translate(-0.5,-0.5); // move the scene to the center of the screen 

  drawGirl();
  
  // --------------------------------------------------------------------
} //sector_9

// CODE GIVEN TO US -----------------------------------------------------

void drawGirl() {
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

void drawPUPPY() {
  float[] v;
  beginShape(TRIANGLES);
  for (int[] tri: PUPPY_TRIANGLES) {
    float[] colour = COLOURS[tri[3]];
    fill(colour[0], colour[1], colour[2]);
    v = PUPPY_VERTICES[tri[0]];
    vertex(v[0], v[1]);
    v = PUPPY_VERTICES[tri[1]];
    vertex(v[0], v[1]);
    v = PUPPY_VERTICES[tri[2]];
    vertex(v[0], v[1]);
  }
  endShape();
}

void mouseClicked() {
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

final float[][] PUPPY_VERTICES = new float[][] {
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
final int[][] PUPPY_TRIANGLES = new int[][] {
  { 0, 1, 2, 9 },
  { 3, 4, 5, 9 },
  { 6, 7, 8, 8 },
  { 9, 6, 8, 8 },
  { 10, 11, 9, 6 },
  { 8, 12, 13, 9 },
  { 14, 13, 8, 9 }
};
final float[] PUPPY_CENTRE = new float[] { 0.263125f, 0.2f };
