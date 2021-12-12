color bgCol = #F2E9D6;
color[] cols = {#D93814, #F27127, #F2A922, #F2CD13, #102D40};

int factor = 5;
int xcount = 9*factor;
int ycount = 16*factor;
float margin = 100;

Agent[] agents = new Agent[xcount*ycount];

void setup() {
  size(1080, 1080);
  background(bgCol);
  
  noFill();
  
  float cellw = (width-margin*2)/(float)xcount;
  float cellh = (height-margin*2)/(float)ycount;
  
  for (int n = 0; n < agents.length; n++) {
    float i = n%xcount;
    float j = n/xcount;
    float xpos = i*cellw + margin;
    float ypos = j*cellh + margin;
    agents[n] = new Agent(xpos, ypos, cellw, cellh);
  }
  
  
}

void draw() {
  //background(bgCol);
  
  push();
  noStroke();
  fill(bgCol, 50);
  rect(0, 0, width, height);
  pop();

  for (Agent agent : agents) {
    agent.update();
  }
  
  //if (frameCount > 126 && frameCount <= (126*2)) { 
  //  saveFrame("Output/###.png");
  //} else if (frameCount > (126*2)) {
  //  exit();
  //}
  
}
