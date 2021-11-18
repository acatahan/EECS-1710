class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;
  
  Dot(float x, float y, color _col) {
    position = new PVector(x, y);
    
    col = _col;
    if(col > 100)
      target = new PVector(random( width), random( height));
    else if(col <= 100)
      target = new PVector(random(300, width), random(200, height));
    
    float b = brightness(col) / 255;
    speed = b / 1000;
    dotSize = abs( 10 - (b * 10)) + 2;
  }
  
  void update() {
    position.lerp(target, speed);
  }
  
  void draw() {
    col++;
    stroke(col);
    strokeWeight(dotSize);
    strokeCap(PROJECT);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}
