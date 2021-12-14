import themidibus.*;
import peasy.*;

PGraphics buffer;
PImage img;
PeasyCam cam;
MidiBus myBus;

float contrast;
float colour;
float spreadVal = 0.1;

void setup() {
  size(640, 480, P3D);
  colorMode(HSB, 360, 100, 100);
  
  img = loadImage("background.png");
  
  text("Move the Mouse to Controll the Instrument", 40, 120); 
  
  buffer = createGraphics(width, height, P2D);
  
  MidiBus.list();
  myBus = new MidiBus(this, -1, 2);
 
  cam = new PeasyCam(this, 400);
}

void draw() {
  
  background(img);
  
  /* Instrument Control
  * Tracks mouse and adjusts pitch depending on Y position
  * Adjusts note velocity depeding on Z position
  * Tracks speed of mouse to control the rate of notes
  */
  int mouse = int(map(mouseY, height, 0, 0, 127));
  if(mouse%2 != 0)
    mouse -= 1;
  int mouseSpeed = Math.abs(pmouseX - mouseX);
  if(mouseSpeed < 0)
    mouseSpeed = 0;
  
  float velocityX = mouseX /3;
  int velocity =  (int)velocityX;
  int mouseInt = Math.abs(mouseSpeed * -2 + 600);
  int channel = 0;
  
  //Maps contrast and colour with the X and Y positions of the mouse
  contrast = mouseX * 0.15625 +  0.84375;
  colour = mouseY * 0.75 + 0.25;
  fill(colour, 100, contrast);
  stroke(colour, 100, contrast);
  
  //Zooms in and out with the velocity of the instrument
  cam.setDistance(velocity * -5/7 + 300);
  lights();
  sphere(70);
  
  //Sphere follows mouse
  cam.setRotations(-mouseX /10 , mouseY / 10, 1);
  
  myBus.sendNoteOn(channel, mouse, velocity);
  delay(mouseInt);
  myBus.sendNoteOff(channel, mouse, velocity);

  surface.setTitle("" + frameRate);
}
