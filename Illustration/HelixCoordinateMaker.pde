public class HelixCoordinateMaker {
    
    private float[] x;
    private float[] y;
    private float[] z;
    private int length;
    
    public HelixCoordinateMaker() {
      x = new float[1];
      y = new float[1];
      z = new float[1];
      length = 0;
    }
    
    public HelixCoordinateMaker(int i) {
      length = i;
      x = new float[length];
      y = new float[length];
      z = new float[length];
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
    
    public void getCoords(int n, int range, boolean[] input) {
      double R = 5;
      double phi = 37*Math.PI*(n/range);
      double d_phi = 0.1;
      //Store previous bool to determine extra curve decision
      boolean prev = false;
      
      //Calc initial positions and set them
      double r_x = 0;
      double r_y = 0;
      double r_z = (n/range)*25;
      double dz = 5;
      x[0] = (float) r_x;
      y[0] = (float) r_y;
      z[0] = (float) r_z;
      
      //For each element, going backwards to track from initial position
      //Change the angles, then move forward with new angles
      for(int i = 0; i < length -1 ; i++) {
        boolean val = input[length-i-1];
        
        
        
        if(val) {
          phi -= d_phi;
          dz = -dz;
          if(prev) {
            phi -= 2*d_phi;
          } 
        } else {
          phi += d_phi;
          if(prev) {
            phi += 2*d_phi;
          } 
        }
        prev = val;
        
        r_x += R*Math.cos(phi);
        x[i+1] = (float) (r_x);
        r_y += R*Math.sin(phi);
        y[i+1] = (float) (r_y);
        r_z += dz;
        z[i+1] = (float) (r_z);
      }
    }
  }
