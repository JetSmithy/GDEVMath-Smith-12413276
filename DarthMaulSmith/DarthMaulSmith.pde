void setup ()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);


}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}



void draw()
 {
 background(130);

  strokeCap(ROUND);

  PVector mouse = mousePos();

  mouse.normalize().mult(500);

  println(mouse.mag());

  drawSaberSide(mouse, -1);
  drawSaberSide(mouse, 1);
}

void drawSaberSide(PVector dir, float side)
{
  PVector end = PVector.mult(dir, side);

  stroke(255, 0, 0);
  strokeWeight(20);
  line(0, 0, end.x, end.y);

  stroke(255);
  strokeWeight(8);
  line(0, 0, end.x, end.y);

  stroke(0);
  strokeWeight(12);
  line(0, 0, end.x * 0.2, end.y * 0.2);
}
