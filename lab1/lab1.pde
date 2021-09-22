color bgColor = color(0, 200, 0);
float circleSize = 50;
int weight = 20;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {  
  
  if (mousePressed) {
    rectMode(CENTER);
    strokeWeight(weight);
    stroke(0, 0, 250);
    strokeCap(ROUND);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
}

/** Up and down arrow keys control the weight of the brush stroke
*/

void keyPressed() {
    if(key == CODED){
        if(keyCode == UP){
         weight += 5;
          System.out.println(weight);
        }
        if(keyCode ==DOWN){
         weight -= 5;
          System.out.println(weight);
        }
  }
}
