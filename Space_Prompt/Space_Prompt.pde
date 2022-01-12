color[] cols = {#EDFF33, #ADD9FF, #A3D9CF, #025951, #A6367B, #F6CA07};
color bg = 30;

float margin = 100;
Agent[] agents = new Agent[1000];

void setup() {
  size(1080, 1080);
  background(bg);

  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
}

void draw() {
  // for not tracing
  //background(bg);

  // or a rectangle with low transparency
  // for tracing particles paths
  push(); 
  noStroke();
  fill(bg, 150);
  rect(0, 0, width, height);
  pop();

  for (Agent a : agents) {
    a.display();
    a.update();
  }
}
