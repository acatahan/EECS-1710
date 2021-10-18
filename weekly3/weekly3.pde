PImage grass, sun, moon;



void setup() {
  size(800, 600, P2D);
  grass  = loadImage("grass.png");
  grass.resize(grass.width * 2, grass.height * 2);
  sun = loadImage("sun.png");
  sun.resize(sun.width / 3, sun.height / 3);
  moon = loadImage("moon.png");
  moon.resize(moon.width / 8, moon.height / 8);
}

void draw() {

  background(102, 178, 255);
  
  int m = minute();
  int h = hour();


  
  
  //image(moon, 0, 0);

  switch(h) {
    case 0: 
      background(0, 0, 0);
      image(moon, 350, 0);
      break;
    case 1:
      background(0, 0, 0);
      image(moon, 450, 50);
      break;
    case 2:
      background(0, 0, 0);
      image(moon, 550 , 100);
      break;
    case 3:
      background(0, 0, 0);
      image(moon, 600 , 150);
      break;
    case 4:
      background(0, 0, 0);
      image(moon, 650, 220);
      break;
    case 5:
      background(0, 0, 0);
      image(moon, 700, 300);
      break;
    case 6:
      image(sun, 50, 300);
      break;
    case 7:
      image(sun, 100, 220);
      break;
    case 8:
      image(sun, 120, 150);
      break;
    case 9:
      image(sun, 160, 100);
      break;
    case 10:
      image(sun, 275, 110);
      break;
    case 11:
      image(sun, 300, 0);
      break;
    case 12:
      image(sun, 350, 0);
      break;
    case 13:
      image(sun, 450, 50);
    case 14:
      image(sun, 550 , 100);
      break;
    case 15:
      image(sun, 600 , 150);
      break;
    case 16:
      image(sun, 650, 220);
      break;
    case 17:
      image(sun,  700, 300);
      break;
    case 18:
      image(sun, 50, 300);
      break;
    case 19:
      image(sun, 100, 220);
      break;
    case 20:
       background(0, 0, 0);
      image(moon,  120, 150);
      break;
    case 21:
       background(0, 0, 0);
      image(moon, 160, 100);
      break;
    case 22:
       background(0, 0, 0);
      image(moon,  275, 110);
      break;
    case 23:
     background(0, 0, 0);
      image(moon, 350, 0);
      break;
    
  }



image(grass, 0,- 100);

}
