public class RingCoordinateMaker {
  
  private float[] x;
  private float[] y;
  private float[] z;
  private int length;
  //private int[] color;
  
  public RingCoordinateMaker() {
    x = new float[1];
    y = new float[1];
    z = new float[1];
  //  color = new int[3];
    length = 0;
  }
  
  public RingCoordinateMaker(int i) {
    length = i;
    x = new float[length];
    y = new float[length];
    z = new float[length];
    //color = new int[3];
  }

  public float[] getX() {
    return x;
  }

  public void setX(float[] x) {
    this.x = x;
  }

  public float[] getY() {
    return y;
  }

  public void setY(float[] y) {
    this.y = y;
  }

  public float[] getZ() {
    return z;
  }

  public void setZ(float[] z) {
    this.z = z;
  }
  
  public int getLength() {
    return length;
  }

  public void setLength(int length) {
    this.length = length;
  }
  
//  public int getColorR() {
//    return color[0];
//  }
//  
//  public int getColorG() {
//    return color[1];
//  }
//  
//  public int getColorB() {
//    return color[2];
//  }
  
//  public void setColor(int[] color) {
//    this.color = color;
//  }
  
//  public void calcColor(int n, float range){
//    color[0] = (int) (232 - ((n/range) * 186));
//    color[1] = (int) (104 - ((n/range) * 79));
//    color[2] = (int) (146 - (n/range)* 127);
//  }
  
  public void getCoords(int n, int range, boolean[] input) {
    double R = 5;
    
    //Decrease this to have them all start together
    double R0 = 5;
    
    //Change these to increase curviness
    double phi_diff = 0.07;
    double theta_diff = 0.07;
    
    //Evenly distributes across the sphere/ring 
    double theta = (2*n*(Math.PI)/range);
    
    //Multiply this by a big number to more evenly distribute it around sphere, have it as
    //0 to do the ring
    double phi = 37*n*(Math.PI)/range;
    
    //Store previous bool to determine extra curve decision
    boolean prev = false;
    
    //Calc initial positions and set them
    double r_x = R0*Math.sin(theta)*Math.cos(phi);
    double r_y = R0*Math.sin(theta)*Math.sin(phi);
    double r_z = R0*Math.cos(theta);
    x[0] = (float) r_x;
    y[0] = (float) r_y;
    z[0] = (float) r_z;
    
    //For each element, going backwards to track from initial position
    //Change the angles, then move forward with new angles
    //Legend: false increases phi, true decreases
    //00 inc theta, 01 dec theta, 10 2x dec theta, 11 2x inc theta
    for(int i = 0; i < length -1 ; i++) {
      boolean val = input[length-i-1];
      
      if(val) {
        phi -= phi_diff;
        if(prev) {
          theta += 2*theta_diff;
        } else {
          theta -= theta_diff;
        }
      } else {
        phi += phi_diff;
        if(prev) {
          theta -= 2*theta_diff;
        } else {
          theta += theta_diff;
        }
      }
      prev = val;
      
      r_x += R*Math.sin(theta)*Math.cos(phi);
      x[i+1] = (float) (r_x);
      r_y += R*Math.sin(theta)*Math.sin(phi);
      y[i+1] = (float) (r_y);
      r_z += R*Math.cos(theta);
      z[i+1] = (float) (r_z);
    }
  }
}
