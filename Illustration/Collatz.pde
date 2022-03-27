public class Collatz {

  private boolean result;
  private int length;
  
  public Collatz() {
    length = 0;
    result = false;
  }
  
  public Collatz(int i) {
    length = collatzLength(i);
    result = false;
  }

  public boolean isResult() {
    return result;
  }

  public void setResult(boolean result) {
    this.result = result;
  }

  public int getLength() {
    return length;
  }

  public void setLength(int length) {
    this.length = length;
  }
  
  public int collatzLength(int i) {
    if(i == 1)
      return 0;
    return 1 + collatzLength(collatzFunc(i));
  }
  
  public int collatzFunc(int i) {
    //System.out.println(i);
    if(i%2 == 0) {
      result = false;
      return i/2;
    } else {
      result = true;
      return (3*i) + 1;
    }
  }
  
  public boolean[] stringProducer(int i) {
    boolean[] retArr = new boolean[length];
    int arg = i;
    int n = 0;
    while(true) {
      arg = collatzFunc(arg);
      retArr[n] = result;
      n++;
      if(arg == 1) {
        return retArr;
      }
    }
  }
}
