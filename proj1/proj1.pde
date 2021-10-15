Germ[] germs = new Germ[4];

void setup() {
  size(800, 600, P2D);
  
  germs[0] = new Germ(100, 200);
  germs[1] = new Germ(200, 200);
  germs[2] = new Germ(300, 200);
  germs[3] = new Germ(400, 200);
  
  for (int i=0; i<germs.length; i++) {
    //germs[i] = new Germ(random(width), random(height));
    germs[i].setup();
  }
}

void draw() {
  
  for(int i = 0; i<germs.length; i++){
    germs[i].draw();
  }
}
