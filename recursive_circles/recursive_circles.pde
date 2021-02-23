import processing.pdf.*;
color[] cols = {#F5AD27, #C6A1EB, #36604B, #F5F5EE, #8D2500};

void setup() {
  size(500, 500);
  background(#F5F5EE);
  
  beginRecord(PDF, "Output/test.pdf");

  noStroke();
  noLoop();
}

void draw() {
  translate(width/2, height/2);
  rotate(QUARTER_PI);
  generate(0, 0, width/1.5);
  
  endRecord();
}

void generate(float x, float y, float radius) {
  fill(cols[(int)random(cols.length)]);
  circle(x, y, radius);

  if (radius > 8) {
    generate(x + radius/2, y, radius/2);
    generate(x - radius/2, y, radius/2);
    generate(x, y + radius/2, radius/2);
    generate(x, y - radius/2, radius/2);
  }
}
