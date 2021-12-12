class Noise {
  ArrayList<Float> nVals = new ArrayList();
  float maxNoise = 10, inc = 0.05;
  float noiseStrength = 2;
  float zoff;
  float xscale, yscale;
  
  Noise(float mxn) {
    maxNoise = mxn;
    params(random(0.025, 0.5), random(0.025, 0.5));
  }
  
  void params(float _xs, float _ys) {
    zoff = random(0.05, 0.5);
    noiseStrength = random(7, 15);
    xscale = _xs;
    yscale = _ys;
    
    noiseSeed(0);
    //println(ceil(TWO_PI/inc));
  }
  
  void init() {
    for (float a = 0; a < TWO_PI; a+=inc) {
      float xoff = map(cos(a), -1, 1, 0, maxNoise);
      float yoff = map(sin(a), -1, 1, 0, maxNoise);
      float n = noise(xoff*xscale, yoff*yscale, zoff);
      float r = map(n, 0, 1, 0, noiseStrength);
      nVals.add(r);
    }
  }
}
