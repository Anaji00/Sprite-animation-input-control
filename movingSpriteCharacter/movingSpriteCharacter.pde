PImage spritesheet = loadImage("https://i.pinimg.com/736x/9c/1b/ce/9c1bce8dbd9a3f8b8a6d09aa7d79e3ae--game-creator-game-resources.jpg");
int DIM = 4;
int W = spritesheet.width/DIM;
int H = spritesheet.height/DIM;
int posX=100, posY=100;
PImage sprite; //define a global variable for your character
boolean atBoundary = false;
void setup() {
  size(600, 400);
  imageMode(CORNER);//use the top left corner of the image to represent the image location
  frameRate(24);
  
  PFont font;
  font = loadFont("Papyrus-Regular-48.vlw");
  textFont(font, 44);
 
  fill(0, 102, 153, 128);  
  sprite = spritesheet.get(0, 0, W, H);//starting image of the character
}
 
void draw() 
{
  background(160, 151, 168);
  
    
  if (keyPressed == true)  //pick up the corresponding image from the whole spritesheet
  {      
        int x = frameCount%DIM * W;
        int y = frameCount/DIM%DIM * H;
        
        if (keyCode == UP ) 
        {   sprite = spritesheet.get(x, H*3, W, H);
            posY -= 3;
        } 
        else if (keyCode == DOWN ) 
        { 
            sprite = spritesheet.get(x, 0, W, H);
            posY += 3;
        }
        else if (keyCode == LEFT ) 
        {   sprite = spritesheet.get(x, H*1, W, H);
            posX -= 3; 
        }
        else if (keyCode == RIGHT ) 
        {  
            sprite = spritesheet.get(x, H*2, W, H);
            posX += 3; 
        }   
        if (posY < 0)
        {
          posY = 0;
          atBoundary = true;
        }
         else if (posY > height - H) 
         {
           posY = height - H;
           atBoundary = true; 
        }
        else if (posX < 0)
        {
          posX = 0;
          atBoundary = true;
        }
        else if (posX > width - W)
        { 
          posX = width - W;
          atBoundary = true; 
        }
        else {
          atBoundary = false;
        }
        
          
        
        println(posX," ", posY); //this is for debugging purpose, so that you can inspect the character's position
        
  }
    text("Alessio's Game", 250, 60);     
    image(sprite, posX, posY); //display the image     
    if (atBoundary)
    {
      text("Stop!!!", 10, 60);
    }
    else {
      text("This is the game world!!!", 50, 300);
    }
    
    
      
}
