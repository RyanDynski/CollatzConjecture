import peasy.*;

/**
 * Setup and Draw. 
 * 
 * The code inside the draw() function runs continuously
 * from top to bottom until the program is stopped. The
 * code in setup() is run once when the program starts.
 */
PeasyCam cam; //and pans screen
// The statements in the setup() block run once 
// when the program begins
void setup() {
  size(1000, 1000, P3D);  // Size using 1000X1000 pixels, and 3D plotting tool
  cam = new PeasyCam(this, 1000); // for panning the screen and zooming

}
 
// The statements in draw() are run until the program 
// is stopped. Each statement is run in sequence from top 
// to bottom and after the last line is read, the 
// first line is run again.
void draw() { 
  rotateX(-.5);
  rotateY(-.5); //used to pan
  background(50,50,50); //set background to gray
  for(int i = 2; i <= 30; i++){ //how many lines we want
    factorString c = new factorString(i); //creating a new factorString object
    RingCoordinateMaker test = new RingCoordinateMaker(c.getLength());     //creating a new RingCoordinateMaker object
    //HelixCoordinateMaker test = new HelixCoordinateMaker(c.getLength()); //creating a new HelixCoordinateMaker object
    boolean [] tab = c.stringProducer(i);  //produce boolean array
    test.getCoords(i, 300, tab);           //getting the coordinates to create splines
    float [] x = test.getX();              //getting the float array of x for creating splines
    float [] y = test.getY();              //getting the float array of y for creating splines
    float [] z = test.getZ();              //getting the float array of z for creating splines
    stroke(255 - i * 10, 255, i * 4 + 150);// Set line drawing color to gradient
    smooth();                            
    noFill();                             
    createSpline(x, y, z);          
    //stroke(100, 100, 0);
  }
   fill(0);
    sphere(15.0);                           //central sphere
}

void createSpline(float [] x, float [] y, float [] z){
  beginShape();
  curveVertex(x[0] * 3, y[0] * 3, z[0] * 3); //scaling the coordinates to be more visually pleasing
  for(int i = 0; i < x.length ; i++){        // creating a line from one coordinate to another
    strokeWeight(2);
    curveVertex(x[i] * 3, y[i] * 3, z[i] * 3);
  }
  curveVertex(x[x.length-1] * 3,y[y.length-1] * 3, z[z.length-1] * 3); //ending the shape
  endShape();
  fill(0);
  noStroke();
  for (int i = 0; i < x.length; i++) {       // creating a sphere on the line for each step
    translate(x[i] * 3, y[i] * 3, z[i] * 3);
    sphere(1.0);
    translate(-x[i] * 3, -y[i] * 3, -z[i] * 3);
  }
}
