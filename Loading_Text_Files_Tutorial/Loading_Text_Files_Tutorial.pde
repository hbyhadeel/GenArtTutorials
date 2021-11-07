color[] cols = {#4920D1, #EDFF33, #007558, #ADD9FF,
  #F581ED, #F0F0F0};
color bg = #0C2C40;

String[] lyrics = {"Giants - Dermot Kennedy.txt",
  "Believer - Imagine Dragons.txt",
  "Life Goes On - Oliver Tree.txt"};
int fileCount = 0;
 
String[] lines;
Flower[] flowers;

void setup() {
  size(1080, 1080);
  background(bg);
  
  lines = loadStrings(lyrics[fileCount%lyrics.length]);
  flowers = new Flower[lines.length];

  float slice = radians(360/(float)lines.length);
  for (int i = 0; i < lines.length; i++) {
    float angle = i * slice;
    float radius = 0;
    
    int charCount = lines[i].length();
    if (charCount > 0 && charCount <= 10) {
      radius = width/2 - 500;
    } else if (charCount > 10 && charCount <= 20) {
      radius = width/2 - 400;
    } else if (charCount > 20 && charCount <= 30) {
      radius = width/2 - 300;
    } else if (charCount > 30 && charCount <= 40) {
      radius = width/2 - 200;
    } else if (charCount > 40 && charCount <= 70) {
      radius = width/2 - 100;
    }
    
    float xpos = width/2 + cos(angle) * radius;
    float ypos = height/2 + sin(angle) * radius;
    flowers[i] = new Flower(lines[i], xpos, ypos);
  }
}

void draw() {
  push();
  noStroke();
  float t = map(sin(radians(frameCount)), -1, 1, 10, 45);
  fill(bg, t);
  rect(0, 0, width, height);
  pop();
  
  push();
  stroke(#F0F0F0, 10);
  noFill();
  for (int i = 550; i > 0; i-=100) {
    circle(width/2, height/2, (width/2-i)*2);
  }
  pop();
  
  for (Flower flower : flowers) {
    flower.update();
  }
  
}

void keyReleased() {
  if (key == 'n') {
    fileCount++;
    setup();
  }
}
