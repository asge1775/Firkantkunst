int BSize = 50;      //Size of individual boxes
int BCount = 4;      //number of boxes on one edge (total number of boxes is BCount^3)
int scaleFact = 10;  //How much variation the box sizes should have

float scale;      //used for the scale of cubes

void setup(){
  size(500,500,P3D);        //size of window
  fill(255);                //shade of cubes
  rectMode(CENTER);         //sets origin of cubes in its center
}

void draw(){
  background(100);      //background color
  pointLight(255,200,0,(width/2), (height/2), BSize * BCount * 3);      //Color and position of light

  translate((width/2), (height/2),BSize);      //Sets origin of cube cluster at the middle of screen
  
  rotateX(-(2 * PI * mouseY) / width);         //Rotation of x-axis dependent of mouse position, where screen width is one full rotation
  rotateY(-(2 * PI * mouseX) / height);        //Rotation of x-axis dependent of mouse position, where screen height is one full rotation
  
  for(int x = 0; x < BCount; x++){             //Iteration of x position
    for(int y = 0; y < BCount; y++){           //Iteration of y position
      for(int z = 0; z < BCount; z++){         //Iteration of z position
        scale = random(scaleFact);             //Random scale op to scaleFact
        pushMatrix();
          translate(BSize * x - BSize * (BCount - 1)/2 ,     //sets position of box, dependent on xyz position and origin of cube cluster
                    BSize * y - BSize * (BCount - 1)/2 , 
                    z * BSize - BSize * (BCount - 1)/2);     
          box(BSize - scale);    //Sets size of box
        popMatrix();             //forgets box position
      }
    }
  }
} 
