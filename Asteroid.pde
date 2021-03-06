class Asteroid extends GameObject
{
  int s;        //determines the look of the asteroid
  float theta2; //rotates the asteoids without effecting there path
  int dir;      //sets direction of rotation

  Asteroid()
  {
    this(random(0, width), random(0, height), 3);
  } 

  Asteroid(float posx, float posy, int _level)
  {
    pos = new PVector(posx, posy);
    theta = random(0, TWO_PI);
    level = _level;
    speed = random(2, 7); 
    s = (int) random(-1,4);


    if (level == 3)    //sets size of the asteroid
    {
      w = 60;
      h = 60;
    } else if (level == 2)
    {
      w = 30;
      h = 30;
    } else
    {
      w = 20;
      h = 20;
    }

    dir = (int) random(-2, 2); //calcualtes if the asteroid will rotate clockwise or anti clockwise
    if (dir == 0)
    {
      dir = 1;
    }
  }

  void update() //changes the position of the asteroid
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    PVector velocity = PVector.mult(forward, speed);
    pos.add(velocity);
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta2);
    theta2 = theta2 + random(0.005, 0.01) * dir;  //calculates the rotation of the asteroid

    stroke(255);
    float halfWidth = w / 2;
    float halfHeight = h / 2;    

    noFill();

    if (s==0)      //draws the selected asteroid
    {
      line(-halfWidth, 0, -halfWidth + 5, halfHeight/2);
      line(-halfWidth + 5, halfHeight/2, -halfWidth/2, halfHeight/4 * 3);
      line(-halfWidth/2, halfHeight/4 * 3, 0, halfHeight);
      line(0, halfHeight, halfWidth/4, halfHeight/2);
      line(halfWidth/4, halfHeight/2, halfWidth, 0);
      line(halfWidth, 0, halfWidth/4, - halfHeight /2);
      line(halfWidth/4, - halfHeight /2, 0, - halfHeight);
      line(0, - halfHeight, -halfWidth / 2, -halfHeight);
      line(-halfWidth / 2, -halfHeight, -halfWidth, -halfHeight/2);
      line(-halfWidth, -halfHeight/2, -halfWidth, 0);
    } else if (s==1)
    {
      //ellipse(0, 0, w, h);
      line(-halfWidth, 0, -halfWidth, w/5);
      line(-halfWidth, w/5, -w/6, halfHeight);
      line(-w/6, halfHeight, w/6, w/4);
      line(w/6, w/4, w/4, halfHeight);
      line(w/4, halfHeight, halfWidth, h/5);
      line(halfWidth, h/5, w/3, 0);
      line(w/3, 0, halfWidth, -h/5);
      line(halfWidth, -h/5, w/4, -halfHeight);
      line(w/4, -halfHeight, 0, -h/3);
      line(0, -h/3, -w/4, -halfHeight);
      line(-w/4, -halfHeight, -halfWidth, 0);
    } else if (s==2)
    {
      //ellipse(0,0,w,h);
      line(-halfWidth, 0, -halfWidth, h/8);
      line(-halfWidth, h/8, -w/6, halfHeight);
      line(-w/6, halfHeight, w/4, halfHeight);
      line(w/4, halfHeight, halfWidth, h/6);
      line(halfWidth, h/6, halfWidth, 0);
      line(halfWidth, 0, w/4, - h/3);
      line(w/4, - h/3, w/5, -h/6);
      line(w/5, -h/6, w/9, -h/3); 
      line(w/9, - h/3, - w/10, -h/4);
      line(- w/10, -h/4, 0, -h/8);
      line(0, -h/8, - halfWidth, 0);
    } else if (s==3)
    {
      line(-halfWidth, 0, -halfWidth/4 * 3, halfHeight/4);
      line(-halfWidth/4 * 3, halfHeight/4, -halfWidth/3, halfHeight/2);
      line(-halfWidth/3, halfHeight/2, -halfWidth/2, halfHeight/3 * 4);
      line(-halfWidth/2, halfHeight/3 * 4, 0, halfHeight);
      line(0, halfHeight, halfWidth/2, halfHeight);
      line(halfWidth/2, halfHeight, halfWidth/3 * 2 -5, halfHeight/2);
      line(halfWidth/3 * 2 - 5, halfHeight/2, halfWidth, 0);
      line(halfWidth, 0, halfWidth/4 * 3, - halfHeight/4);
      line(halfWidth/4 * 3, - halfHeight/4, halfWidth/2, -halfHeight/2);
      line(halfWidth/2, -halfHeight/2, halfWidth/4, -halfHeight/4 * 3);
      line(halfWidth/4, -halfHeight/4 * 3, 0, -halfHeight);
      line(0, -halfHeight, -halfWidth/8, -halfHeight/2);
      line(-halfWidth/8, -halfHeight/2, -halfWidth, 0);
    }
    popMatrix();

    if (pos.x > width)      //keeps the asteroid on the screen
    {
      pos.x = 0;
    } else if (pos.x < 0)
    {
      pos.x = width;
    }
    if (pos.y > height)
    {
      pos.y = 0;
    } else if ( pos.y < 0)
    {
      pos.y = height;
    }
  }
}

