boolean isLine = true;
int count = 15;
float time;
float amp;

// line param
float spacing = 20;

// circle param
float slice = radians(360/count);

void setup() {
  size(1080, 1080);
  background(255);


  strokeWeight(3);
  noFill();

  frameRate(24);
}

void draw() {
  background(255);
  translate(-width, -height);
  scale(3);
  
  time += .03;
  amp = map(mouseX, 0, width, 10, 40);

  if (isLine) {
    pushMatrix();
    translate(width/2 - count*spacing/2, 0);

    beginShape();
    curveVertex(0, height/2);
    for (int i = 0; i < count; i++) {
      float x = i * spacing;
      
      // uncomment any based on what movement you want
      // sine and random
      float y = height/2 + (sin(x + time) * amp + random(-.4, .4));
      
      // random
      //float y = height/2 + random(-4, 4);
      
      // sine
      //float y = height/2 + (sin(x + time) * amp);
      
      curveVertex(x, y);
      //ellipse(x, y, 10, 10);
    }
    curveVertex(count*spacing, height/2);
    endShape();
    popMatrix();
  }

  if (!isLine) {
    // to make the circle's last point connect
    // with the first point, you need to store all points of the circle
    // in an array. this will make your curveVertex control points and
    // last point to be assigned to the correct positions. Meaning,
    // some points will share the same position and randomization
    pushMatrix();
    translate(width/2, height/2);

    beginShape();
    float r = random(30, 50);
    curveVertex(cos(slice*count) * r, sin(slice * count) * r);
    for (int i = 0; i < count; i++) {
      float angle = i * slice;
      float radius = random(30, 50);
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      curveVertex(x, y);
      //ellipse(x, y, 10, 10);
    }
    curveVertex(cos(0) * r, sin(0) * r);
    curveVertex(cos(slice) * r, sin(slice) * r);
    endShape();

    popMatrix();
  }
  
  //saveFrame("Output/###.png");
}

void keyReleased() {
  // if you hit c on the keyboard
  // this will toggle between line and circle
  if (key == 'c') isLine = !isLine;
}
