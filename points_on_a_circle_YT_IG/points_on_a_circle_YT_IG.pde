float angle;
float slice;
float numSlices = 10;
float radius = 200;
float centerx, centery;

void setup() {
  size(500, 500);
  background(255);
  
  slice = radians(360/numSlices);
  centerx = width/2;
  centery = height/2;
  
  noStroke();
  fill(255, 0, 0);
  noLoop();
}

void draw() {
  
  for (int i = 0; i < numSlices; i++) {
    float angle = i * slice;
    float x = centerx + cos(angle) * radius;
    float y = centery + sin(angle) * radius;
    circle(x, y, 20);
  }
  
}
