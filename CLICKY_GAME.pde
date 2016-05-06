int xPos;                      
int speed=1;                   
int xDir=1;                   
int score=0;                   
int lives=5;                   
boolean lost=false;            

void setup()                   
{
  size (400,400);
  smooth();
  xPos=width/2;               
  fill(#000EFF);             
  textSize(13);               
}

void draw()                                      
{
  background (60);                               
  ellipse(xPos, height/2,40,40);  

  xPos=xPos+(speed*xDir);                         
  if (xPos > width-20 || xPos<20)                
  {
    xDir=-xDir;                                  
  }
  fill(0,100,255);
  text("Score = "+score,10,10);                 
  text("Lives = "+lives,width-80,10);           
  if (lives<=0)                                  
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    
    lost=true;
    textSize(13);
  }
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      
  {
    score=score+speed;                           
    speed=speed+1;                              
  }
  else                                         
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                               
  }
  if (lost==true)                                
  {
    speed=1;                                     
    lives=5;
    score=0;
    
    xPos=width/2;
    xDir=1;
    
    lost=false;
    loop();                                     
  }
}