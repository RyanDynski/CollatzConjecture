public class factorString {

  public int length;
  public boolean result;
  
  public factorString() {
    length = 0;
    result = false;
  }
  
  public factorString(int i) {
    length = factorLength(i);
    result = false;
  }

  public int getLength() {
    return length;
  }

  public void setLength(int length) {
    this.length = length;
  }

  public boolean isResult() {
    return result;
  }

  public void setResult(boolean result) {
    this.result = result;
  }
  
  public int factorLength(int i) {
    if(factorFunc(i) == 1)
      return 1;
    return 1 + factorLength(factorFunc(i));
  }
  
  public int factorFunc(int i) {
    for(int j = i-1; j>1; j--) {
      if(i%j==0) {
        return j;
      }
    }
    return 1;
  }
  
  public boolean[] stringProducer(int i) {
    boolean[] retArr = new boolean[length];
    int comp = 0;
    int arg = i;
    int n = 0;
    while(true) {
      comp = factorFunc(arg);
      arg = comp;
      if(comp <= .3*i) {
        retArr[n] = true;
      } else {
        retArr[n] = false;
      }
      if(comp==1){
        return retArr;
      }
      n++;
    }
  }

}
