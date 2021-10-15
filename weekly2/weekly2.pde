PImage stars;
PImage ship;
PImage station;
PImage star;

float x1, y1, x2, y2, stX1, stY1, stX2, stY2, shX1, shY1, shX2, shY2;
float speedX1, speedX2, stSpeedX1, stSpeedX2, shSpeedY1, shSpeedY2;

void setup() {
  size(800, 600, P2D);
  stars = loadImage("stars.jpg");
  stars.resize(width, height);
  ship = loadImage("rocket.png");
  ship.resize(ship.width/2, ship.height/2);
  station = loadImage("spacestation.png");
  station.resize(station.width * 2, station.height * 2);
  star = loadImage("star.png");
  star.resize(star.width / 3, star.height / 3);
  
  imageMode(CENTER); 

  //Setup for space station
  x1 = 400;
  y1 = 400;
  x2 = x1 + 5;
  y2 = y1 - 5;
  speedX1 = 5;
  speedX2 = speedX1 * 0.5;
  
  //Setup for shooting star
  stX1 = 0;
  stY1 = 600;
  stX2 = stX1 + 5;
  stY2 = stY1 - 5;
  stSpeedX1 = speedX1 * 10;
  stSpeedX2= stSpeedX1 * 0.5;
  
  shX1 = random(0, 800);
  shY1 = 600;
  shX2 = shX1 + 5;
  shY2 = shY1 - 5;
  shSpeedY1 = -5;
  shSpeedY2 = shSpeedY1 * 0.9;
  
  

}

void draw() {
  background(stars);
  
  tint(255, 127);
  image(station, x2, y2);
  
  noTint();
  image(station, x1, y1); // the image drawn last will be in front
  
  tint(255, 127);
  image(star, stX2, stY2);
  
  noTint();
  image(star, stX1, stY1);
  
  tint(255, 127);
  image(ship, shX2, shY2);
  
  noTint();
  image(ship, shX1, shY1);
  
  x1 += speedX1;
  x2 += speedX2;
  
  stX1 += stSpeedX1;
  stX2 += stSpeedX2;
  
  shY1 += shSpeedY1;
  shY2 += shSpeedY2;
  
    
  if (x1 > width || x1 < 0) {
    speedX1 *= -1;  
    speedX2 *= -1;
  }
  
  if (stX1 > (width + 200)|| stX1 <( 0 - 200)) {
    stSpeedX1 *= -1;  
    stSpeedX2 *= -1;
  }
  
  if(shY1 < - 500) {
    shY1 = 600;
    shX1 = random(0, 800);
    shX2 = shX1 + 5;
    shY2 = shY1 - 5;
  }
  
}
