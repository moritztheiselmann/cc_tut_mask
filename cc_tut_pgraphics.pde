// 252, 247, 127
// 60, 151, 163
// 142, 203, 190
// 228, 228, 228

color colors[];
PGraphics layer1;
PGraphics mask;

void setup() {
  size(1000, 1000);
  
  colors = new color[4];
  colors[0] = color(252, 247, 127);
  colors[1] = color(60, 151, 163);
  colors[2] = color(142, 203, 190);
  colors[3] = color(228);
  
  layer1 = createGraphics(width, height);
  mask = createGraphics(width, height);
}

void draw() {
  background(0);
  // define width of the area 
  int w = width;
  // iterate through every pixel (x-axis) after mouseX
  layer1.beginDraw();
  for(int i = 0; i < w; i++) {
    // calculate fraction for every pixel
    float fraction = (float)(i) / width;
    
    // interpolate between 2 colors based on the index (i)
    color cInter = lerpColor(colors[0], colors[1], fraction);
    layer1.stroke(cInter);
    layer1.line(i, 0, i, height);
  }
  layer1.endDraw();
  
  mask.beginDraw();
  mask.background(0);
  mask.translate(width/2, height/2);
  mask.noStroke();
  mask.fill(255);
  mask.textSize(width);
  mask.textAlign(CENTER, CENTER);
  mask.text("A", 0, 0);
  mask.endDraw();
  
  layer1.mask(mask);
  image(layer1, 0, 0);
  
}
