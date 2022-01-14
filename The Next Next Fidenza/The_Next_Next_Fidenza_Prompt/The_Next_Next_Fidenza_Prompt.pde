import processing.pdf.*;

color[] cols = {#2B4C8C, #7798D9, #A6367B, #00343B, #DBB5BE, #FEFFF0, #025951};
color bgCol = #F2F2EB;

long seed;

float margin = 100;
int count = 100;
Agent[] agents = new Agent[count];

float noiseScale = 2000, noiseStrength = 10;
float curlx, curly;
int steps = 40;

void setup() {
  size(1080, 1080);
  
  seed = (long)random(1000);
  println(seed);
  randomSeed(seed);
  noiseSeed(seed);
  
  // uncomment this and endRecord in draw() to save
  // beginRecord(PDF, "Output/noise with thick lines_" + seed + ".pdf");
  
  background(bgCol);
  
  curlx = randomGaussian() + width/2;
  curly = random(margin*2, height-margin*2);
  
  for (int n = 0; n < agents.length; n++) {
    agents[n] = new Agent();
  }
  
  noLoop();
  
}

void draw() {
  for (Agent a : agents) {
    a.display(steps);
  }
  
  // uncomment to save
  // endRecord();
}
