public class Walker
{
  float x, y;
  float t = 0;

  void render ()
  {
    float size = map(noise(t + 100), 0, 1, 5, 150);
    float r = map(noise(t + 200), 0, 1, 0, 255);
    float g = map(noise(t + 300), 0, 1, 0, 255);
    float b = map(noise(t + 400), 0, 1, 0, 255);

    fill(r, g, b, 80);

    circle(x, y, size);
  }

  void perlinWalk()
  {
    x = map(noise(t), 0, 1, -640, 640);
    y = map(noise(t + 50), 0, 1, -360, 360);

    t += 0.01f;
  }
}
