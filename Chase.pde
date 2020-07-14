void environment(int co)
{
  fill(co);
  noStroke();
  rect(300,262,200,15);
  rect(300,323,200,15);
  
  
  rect(150,105,100,15);
  rect(150,105,15,100);
  
  rect(550,105,100,15);
  rect(635,105,15,100);
  
  rect(150,495,100,15);
  rect(150,510,15,-100);
  
  rect(550,495,100,15);
  rect(635,510,15,-100);
  
  
  rect(390,125,20,85);
  rect(390,475,20,-85);
  
  rect(220,160,20,100);
  rect(560,160,20,100);
  
  
  rect(220,455,20,-110);
  rect(560,455,20,-110);
  
  //outer lateral walls
  rect(85,45,15,510);
  rect(700,45,15,510);
  //outer horizontal walls
  rect(85,45,630,15);
  rect(85,555,630,15);
  
}
 
Boolean collision(float cx, float cy, float radius, float rx, float ry, float rw, float rh)
{
  float clx;
  float cly;
  
  //for x cordiante for closest point on the box
  if(cx < rx)
  clx = rx;
  else if(cx > rx + rw)
  clx = rx + rw;
  else
  clx = cx;
  
  //for y cordinate for the closest point on the box
  if(cy < ry)
  cly = ry;
  else if(cy > ry + rh)
  cly = ry + rh;
  else
  cly = cy;
  
  float d = dist(cx,cy,clx,cly);
  
  if(d <= radius)
  return true;
  else
  return false;
  
}
 
int col;

class Movement
{
  float x;
  float y;
  float hor;
  float ver;  
  
  void onKeyPressed(char aKey){
    if(keyPressed)
    {
      if(aKey == 'w')
        ver = -2.1;
      if(aKey == 's')
        ver = 2.1;
      if(aKey == 'a')
        hor = -2.1;
      if(aKey == 'd')
        hor = 2.1;      
    }
  }
  
  
  void onKeyReleased(char aKey){

      if(aKey == 'w' && ver < 0)
        ver = 0;
      if(aKey == 's' && ver > 0)
        ver = 0;
      if(aKey == 'a' && hor < 0)
        hor = 0;
      if(aKey == 'd' && hor > 0)
        hor = 0;
  }
}

class Player extends Movement
{
  Player(){
    x = 400;
    y = 300;
    hor = 0;
    ver = 0;
  }
  
  Player(int ax, int ay){
    x = ax;
    y = ay;
    hor = 0;
    ver = 0;

  }
  
  void Draw(){
    clear();
    col = 255;
    background(col);
    environment(120);
    fill(66, 117, 237);
    circle(x,y,32);
  }
  
  void Update(){
    
    //collision for each wall
    Boolean XboxOne = collision(x+hor,y,16,300,262,200,15);
    Boolean YboxOne = collision(x,y+ver,16,300,262,200,15);
    
    Boolean XboxTwo = collision(x+hor,y,16,300,323,200,15);
    Boolean YboxTwo = collision(x,y+ver,16,300,323,200,15);
    
    Boolean XboxThree = collision(x+hor,y,16,150,105,100,15);
    Boolean YboxThree = collision(x,y+ver,16,150,105,100,15);
    
    Boolean XboxFour = collision(x+hor,y,16,150,105,15,100);
    Boolean YboxFour = collision(x,y+ver,16,150,105,15,100);
    
    Boolean XboxFive = collision(x+hor,y,16,550,105,100,15);
    Boolean YboxFive = collision(x,y+ver,16,550,105,100,15);
    
    Boolean XboxSix = collision(x+hor,y,16,635,105,15,100);
    Boolean YboxSix = collision(x,y+ver,16,635,105,15,100);
    
    Boolean XboxSeven = collision(x+hor,y,16,150,495,100,15);
    Boolean YboxSeven = collision(x,y+ver,16,150,495,100,15);
    
    Boolean XboxEight = collision(x+hor,y,16,150,410,15,100);
    Boolean YboxEight = collision(x,y+ver,16,150,410,15,100);
    
    Boolean XboxNine = collision(x+hor,y,16,550,495,100,15);
    Boolean YboxNine = collision(x,y+ver,16,550,495,100,15);
    
    Boolean XboxTen = collision(x+hor,y,16,635,410,15,100);
    Boolean YboxTen = collision(x,y+ver,16,635,410,15,100);
    
    Boolean Xbox11 = collision(x+hor,y,16,390,125,20,85);
    Boolean Ybox11 = collision(x,y+ver,16,390,125,20,85);
    
    Boolean Xbox12 = collision(x+hor,y,16,390,390,20,85);
    Boolean Ybox12 = collision(x,y+ver,16,390,390,20,85);
   
    Boolean Xbox13 = collision(x+hor,y,16,220,160,20,100);
    Boolean Ybox13 = collision(x,y+ver,16,220,160,20,100);
    
    Boolean Xbox14 = collision(x+hor,y,16,560,160,20,100);
    Boolean Ybox14 = collision(x,y+ver,16,560,160,20,100);
    
    Boolean Xbox15 = collision(x+hor,y,16,220,345,20,110);
    Boolean Ybox15 = collision(x,y+ver,16,220,345,20,110);
    
    Boolean Xbox16 = collision(x+hor,y,16,560,345,20,110);
    Boolean Ybox16 = collision(x,y+ver,16,560,345,20,110);
    
    
    //final condition if collision is occouring or not
    Boolean XenvironmentCollision = !XboxOne && !XboxTwo && !XboxThree && !XboxFour && !XboxFive && !XboxSix && !XboxSeven && !XboxEight && !XboxNine && !XboxTen && !Xbox11 && !Xbox12 && !Xbox13 && !Xbox14 && !Xbox15 && !Xbox16;
    Boolean YenvironmentCollision = !YboxOne && !YboxTwo && !YboxThree && !YboxFour && !YboxFive && !YboxSix && !YboxSeven && !YboxEight && !YboxNine && !YboxTen && !Ybox11 && !Ybox12 && !Ybox13 && !Ybox14 && !Ybox15 && !Ybox16;
    
    if(XenvironmentCollision)
    {     
      if(x - 16 + hor > 100 && x + 16 + hor < 700)
      x += hor;
    }
    
    if(YenvironmentCollision)
    {
      if(y - 16 + ver > 60 && y + ver + 16 < 555)
      y += ver;
    }
  }
  
}

Player p = new Player(650,300);






void setup(){
  size(800,600);
  background(255);
  frameRate(60);
}

void draw(){
 
  p.Draw();
  p.Update();  
}

void keyTyped(){
  
  p.onKeyPressed(key);
}

void keyReleased(){
  
  p.onKeyReleased(key);
}
