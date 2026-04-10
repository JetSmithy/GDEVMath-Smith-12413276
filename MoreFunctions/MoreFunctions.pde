float radius = 100;
float amplitude = 50;
float frequency = 0.05;

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
}

void draw ()
{
  background(200);

  translate(width/2, height/2);

  strokeWeight(2);

  stroke(100);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);

  stroke(255, 0, 0);
  line(-300, 300, 300, -300);

  stroke(0, 255, 0);
  noFill();
  beginShape();
  for (float x = -300; x < 300; x++)
  {
    float y = 0.01 * x * x;
    vertex(x, -y);
  }
  endShape();

  stroke(0, 0, 255);
  noFill();
  beginShape();
  for (float x = -300; x < 300; x++)
  {
    float y = amplitude * sin(frequency * x);
    vertex(x, y);
  }
  endShape();

  stroke(255, 255, 0);
  noFill();
  ellipse(0, 0, radius*2, radius*2);
}
