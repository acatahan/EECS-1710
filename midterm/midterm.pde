PImage background, background2, heli, building, welcomescreen;
int score, highscore, x, y, vertical;
int wallX[] = new int[2];
int wally[] =new int[2];
boolean playing;

void setup() {
   background =loadImage("sky.png");
   background2 = loadImage("background2.png");
   heli =loadImage("helicopter.gif");
   building =loadImage("wall2.png");
   playing = false; 
   score = 0; 
   highscore = 0; 
   x = -200; 
   vertical = 0; 
   
   size(600,800);
   textSize(20);  
}

void draw() { 
  if(playing == true) {
    imageMode(CORNER);
    image(background, x, 0);
    image(background2, x + 100, -100);
    
    image(background, x + background.width, 0);
    image(background2, x + 100 + background.width, -100);
    x -= 5;
    vertical += 1;
    y += vertical;
    
    
    if(x == -1800)
      x = 0;
      
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(building, wallX[i], wally[i] - (building.height/2+150));
      image(building, wallX[i], wally[i] + (building.height/2+150));
      
      if(wallX[i] < 0) {
        wally[i] = (int)random(200,height-200);
        wallX[i] = width;
      }
      
      if(wallX[i] == width/2) 
        highscore = max(++score, highscore);
     
      if(y > height || y < 0 || (abs(width / 2 - wallX [i]) < 25 && abs(y-wally[i]) > 100)) 
        playing = false;
        
        wallX[i] -= 6;
    }
    image(heli, width/2, y, 75, 75);
    text("Score: "+score, 10, 20);
  }
  else {
    background(127);
    imageMode(CORNER);
    image(background, 0, 0);
    text("High Score: "+highscore, 250, 130);
    text("Click to Navigate the Helicopter throught the buildings!", 100, 200);
  }
}

void mousePressed() {
  vertical = -15;
  if( playing == false) {
    wallX[0] = 600;
    wally[0] = y = height/2;
    wallX[1] = 900;
    wally[1] = 600;
    x = score = 0;
    playing = true;
  }
}
