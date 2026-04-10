void setup()
{
  size(800, 600);
  background(255);
  noStroke();
}

void draw()
{
  float meanX = width / 2;
  float stdX = 100;

  float x = randomGaussian() * stdX + meanX;
  float y = random(height);

  float sizeMean = 10;
  float sizeStd = 5;
  float s = abs(randomGaussian() * sizeStd + sizeMean);

  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  fill(r, g, b, a);
  ellipse(x, y, s, s);
}
