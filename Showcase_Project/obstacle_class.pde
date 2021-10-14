class Obstacle {
  float pegRadius; // size of obstacle
  float peg1X, peg1Y; // position of 1st obstacle
  float peg2X, peg2Y; // position of 2nd obstacle
  float peg3X, peg3Y; // position of 3rd obstacle

  Obstacle() {
    pegRadius = 10;

    peg1X = 250;
    peg1Y = 200;

    peg2X = 70;
    peg2Y = height - 24;

    peg3X = width - 24;
    peg3Y = 70;
  }

  void draw() {
    fill(22, 245, 213);
    stroke(0);
    circle(250, 200, 2 * pegRadius);
    circle(70, height-24, 2 * pegRadius);
    circle(width - 24, 70, 2 * pegRadius);
  }

  void collisions() {
    checkForPegCollision(peg1X, peg1Y);
    checkForPegCollision(peg2X, peg2Y);
    checkForPegCollision(peg3X, peg3Y);
  }
  
  void checkForPegCollision(float x, float y) {
    if (dist(xPos, yPos, x, y) < radius + pegRadius)
    {
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      text("GAME OVER!", width/2, height/2);
      frameRate(0);
    }
  }
}
{}
