//your variable declarations here
SpaceShip bob;
Star [] star;
ArrayList <Bullet> bL;
ArrayList <Asteroid> asteroid;
public void setup() 
{
  background(0);
  size(600,600);
  bob = new SpaceShip();
  bL = new ArrayList <Bullet>();
  star = new Star[120];
  for(int i = 0; i < star.length; i++)
  {
    star[i] = new Star();
  }
  asteroid = new ArrayList <Asteroid>();
  for(int i = 0; i < 15; i++)
  {
    asteroid.add(new Asteroid());
  }
  //your code here
}
public void draw() 
{
  background(0);
  for(int i = 0; i < star.length; i++)
  {
    star[i].show();
  }
  for(int i = 0; i < bL.size(); i++)
  {
    bL.get(i).show();
    bL.get(i).move();
  }
  for(int i = 0; i < asteroid.size(); i++)
  { 
    asteroid.get(i).show();
    asteroid.get(i).move();
   if(dist(bob.getX(), bob.getY(), asteroid.get(i).getX(), asteroid.get(i).getY())<20)
     {
      asteroid.remove(i);
     }
 }
  for(int j = 0; j < asteroid.size(); j++) 
  {
    for(int k = 0; k < bL.size(); k++)
    {
      if(dist(bL.get(k).getX(), bL.get(k).getY(), asteroid.get(j).getX(), asteroid.get(j).getY())<20)
      {
        asteroid.remove(j);
        bL.remove(k);
        break;
      }
    }
  }
  for( int j = 0; j < bL.size(); j++) 
  {
    bL.get(j).show();
    bL.get(j).move();
    if(bL.get(j).getX() > width || bL.get(j).getX() < 0 || bL.get(j).getY() > height || bL.get(j).getY() < 0)
    {
      bL.remove(j);
    }
  }

  bob.show();
  bob.move();
  //your code here
}

public void keyPressed()
{
  if(key == 'a'){bob.rotate(-9);}
  if(key == 'd'){bob.rotate(9);}
  if(key == 'w'){bob.accelerate(0.69);}
  if(key == 's'){bob.accelerate(-0.69);}
  if(key == 'h')
  {
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)(Math.random()*360));
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
    bob.accelerate(0);
  }
if(key == 'j')
{
  bL.add(new Bullet(bob));
}


}
class Star
{
  private int starX, starY, starColor;
  public Star()
  {
    starX = (int)(Math.random()*600);
    starY = (int)(Math.random()*700)-100;
    starColor = color(255);
    
  }
    
  public void show()
  {
    noStroke();
    fill(starColor);
    ellipse(starX,starY,3,3);
  }

}

class Asteroid extends Floater
{
  private int astSpeed;
  public Asteroid()
  {
    corners =6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(200,100,100);
    astSpeed = (int)(Math.random()*6)-3;
    myCenterX = (int)(Math.random()*600);
    myCenterY = (int)(Math.random()*601);
    if((int)(Math.random()*2) == 0)
    {
    myDirectionX = (int)(Math.random()*2)+1;
    }
    else 
    {
      myDirectionX = -1 * (int)(Math.random()*2)-1;
    }
    if((int)(Math.random()*2) == 0)
    {
      myDirectionY = (int)(Math.random()*2)+1;
    }
    else 
    {
      myDirectionY = -1 * (int)(Math.random()*2)-1;
    }
    myPointDirection = 0;

  }
 
  public void move()
 {
   rotate(astSpeed);
   super.move();
 }
   public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
}


class Bullet extends Floater
{
  public Bullet(SpaceShip theShip)
 {
  myCenterX = theShip.getX();
  myCenterY = theShip.getY();
  myPointDirection = theShip.getPointDirection();
  double dRadians = myPointDirection*(Math.PI/180);
  myDirectionX = 5*Math.cos(dRadians) + theShip.getDirectionX();
  myDirectionY = 5*Math.sin(dRadians) + theShip.getDirectionY();
  myColor = color(220,0,30);
 }

  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse((int)myCenterX, (int)myCenterY, 5,5);
  }


  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
}


class SpaceShip extends Floater  
{   

public SpaceShip()
{
corners = 3;
xCorners = new int[corners];
yCorners = new int[corners];
xCorners[0] = -8;
yCorners[0] = -8;
xCorners[1] = 16;
yCorners[1] = 0;
xCorners[2] = -8;
yCorners[2] = 8;
myColor = color(120,210,150);
myCenterX = 300;
myCenterY = 300;
myDirectionX = 0;
myDirectionY = 0;
myPointDirection = 0;

}



  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
    //your code here
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
