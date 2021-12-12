color bgCol = #F2E9D6;
color[] cols = {#D93814, #F27127, #F2A922, #F2CD13, #102D40};

float margin = 100;
float noiseScale = 1000, noiseStrength = 60;
Agent[] agents = new Agent[20000];

void setup() {
  size(1080, 1080);
  background(bgCol);
  
  noFill();
  
  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent(random(margin, width-margin),
    random(margin, height-margin));
  }
  
  frameRate(24);
  
  
}

void draw() {
  background(bgCol);
  
  push();
  noStroke();
  fill(bgCol, 150);
  rect(0, 0, width, height);
  pop();

  for (Agent agent : agents) {
    agent.update();
  }
  
  //if (frameCount <= 720) {
  //  saveFrame("Output/###.png");
  //} else {
  //  exit();
  //}
}
