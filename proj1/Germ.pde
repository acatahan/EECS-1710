class Germ {

  String[] slideUrls = { "image01.png", "image02.png", "image03.png", "image04.png" };
  PImage[] slides = new PImage[slideUrls.length];
  int slideCounter = 3; 
  PVector position, target;
  float margin = 50;
  boolean isBothered = false;
  float triggerDistance1 = 100;
  float movementSpeed = 0.01;
  float botheredSpread = 20;
  boolean blink, bothered;

  Germ(float x, float y) {
   position = new PVector(x, y); 
  }

  void setup(){
    for (int i=0; i<slides.length; i++) {
      slides[i] = loadImage(slideUrls[i]);
      slides[i].resize(width/4, height/4);
    }
    pickTarget();
  }
  
  void draw(){
    background( 255, 172, 84 );
    
    position =new PVector( position.x + random(-10, 10),  position.y + random(-10, 10));
  
    if(position.x < 0 || position.x > 600 || position.y < 0|| position.y > 800){
      bothered = true;
      //System.out.println("Uh-oh");
      background(255, 0, 0);
      if(position.x < 0)
        position.x += 20;
      else if(position.x > 0)
        position.x -= 20;
      else if(position.y < 0)
        position.y += 20;
      else
      position.y -= 20;
    }
    else {
      bothered = false;
      slideCounter = 0;
      background( 255, 172, 84 );
    }
     
    millis();

    if(millis() % 5000 == 0)
      blink = true;
    else
      blink = false;
      
    if(blink && !bothered) {
       slideCounter = 1; 
       //System.out.println("Blink");
    }
    else if(blink && bothered) {
      slideCounter = 3;
      //System.out.print("Ouch");
    }
    else
      slideCounter = 0;
    
    
    //System.out.println(millis());
    image(slides[slideCounter], position.x, position.y); 
  }
  
  void pickTarget() {
  target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
 

}
