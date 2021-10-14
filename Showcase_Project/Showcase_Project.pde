Obstacle one; // declare object

float xPos; // x-position of the ball
float yPos; // y-position of the ball
float vx; // velocity
float vy; // velocity
float radius; // size of the ball
boolean inPlayMode; // if in play

void setup()
{
  size(500, 400);

  one = new Obstacle(); 
  radius = 15;

  background(255);
  textSize(64);

  xPos = width - radius;
  yPos = height - radius;

  inPlayMode = false;
}

void mousePressed()
{
  if (inPlayMode)
  {//do nothing
  } 
  else
  {
    vx = (mouseX - xPos) / 50;
    vy = (mouseY - yPos) / 50;
    inPlayMode = true;
  }
}

void draw()
{
  background(255);
  one.draw(); // call class

  if (inPlayMode) {

    moveBall();
    drawBall();

    bounceOffWalls();
    one.collisions(); //call class
  } else
  {
    drawBall();
    drawAimingLine();
  }
}

void drawAimingLine()
{
  stroke(0);
  line(xPos, yPos, mouseX, mouseY);
}

void drawBall() {
  noStroke();
  fill(0, 0, 255);
  circle(xPos, yPos, 2 * radius);
}

void moveBall() {
  xPos = xPos + vx;
  yPos = yPos + vy;
}

void bounceOffWalls()
{
  if (xPos - radius < 0 || xPos + radius > width)
  {
    vx = -vx;
    vx ++;
  }

  if (yPos - radius < 0 || yPos + radius > height)
  {
    vy = -vy;
    vy ++;
  }
}
