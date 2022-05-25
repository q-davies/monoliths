PFont font;
String[] lines;

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void setup()
{
  lines = loadStrings("../data/onthesea.txt");

  size(1000, 1000, P3D);

  background(255);
  font = createFont("../data/YujiSyuku-Regular.ttf", 150);
  textFont(font);
  textAlign(CENTER);
  fill(255);
  int total_char = 0;
  for (int i = 0; i < lines.length; i=i+1) {
    total_char += lines[i].length();
  }
  float avg = total_char/lines.length;
  float percent= avg/100;
  randomSeed(int(avg));
  int shape = int(random(3,8));
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      //int color_text = lines[int(random(lines.length))].length();
      stroke(x/5,y/5,random(255)*percent+(y/3));
      polygon(x-200,y-200,705,9);
      //point(x,y);
    }
  }
}

void draw() {
  fill(255);
  //for (int i = 0; i < lines.length; i=i+1) {
  //  textSize(10);
  //  text("seahorse", width/2, i*12);
  //}
  textSize(25);
  text("on the sea",(width/2)-200,(height/2)-200);
  noLoop();
}
