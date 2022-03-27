import java.lang.Math;

public class CoordinateMaker {

    private float[] x;
    private float[] y;
    private float[] z;
    private int length;
    private boolean result;
    //private boolean prev;

    public CoordinateMaker() {
        x = new float[1];
        y = new float[1];
        z = new float[1];
        length = 0;
    //    prev = false;
    }

    public CoordinateMaker(int i) {
        length = CollatzLength(i);
        x = new float[length];
        y = new float[length];
        z = new float[length];
        result = false;
        //prev = false;
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

    public int CollatzLength(int i) {
        if(i == 1)
            return 0;
        return 1 + CollatzLength(Collatz(i));
    }

    public int Collatz(int i) {
        //System.out.println(i);
        if(i%2 == 0) {
            result = false;
            return i/2;
        } else {
            result = true;
            return (3*i) + 1;
        }
    }

    public boolean[] StringProducer(int i) {
        boolean[] retArr = new boolean[length];
        int arg = i;
        int n = 0;
        while(true) {
            arg = Collatz(arg);
            retArr[n] = result;
            n++;
            if(arg == 1) {
                return retArr;
            }
        }
    }
public void getCoords(int n, int range, boolean[] input) {
        double R = 5;
        
        double phi_diff = 0.2;
        double theta_diff = 0.2;
        double theta = (2*n*(Math.PI)/range);
        double phi = (37*n*(Math.PI)/range) - Math.PI;
        boolean prev = false;
        double r_x = 0*R*Math.sin(theta)*Math.cos(phi);
        double r_y = 0*R*Math.sin(theta)*Math.sin(phi);
        double r_z = 0*R*Math.cos(theta);

        for(int i = 0; i<length; i++) {
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
            x[i] = (float) (r_x);
            r_y += R*Math.sin(theta)*Math.sin(phi);
            y[i] = (float) (r_y);
            r_z += R*Math.cos(theta);
            z[i] = (float) (r_z);
        }
    }


}
