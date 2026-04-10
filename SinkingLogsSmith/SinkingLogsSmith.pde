Walker[] walkers;
Liquid liquid;

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  walkers = new Walker[10];

  for (int i = 0; i < walkers.length; i++)
  {
    float spacing = width / 10;
    float x = spacing * i + spacing / 2;
    walkers[i] = new Walker(x);
  }

  liquid = new Liquid(0, 200, width, 300);
}

void draw()
{
  background(255);

  liquid.display();

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(wind);

    PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
    walkers[i].applyForce(gravity);

    if (liquid.contains(walkers[i]))
    {
      walkers[i].applyForce(liquid.drag(walkers[i]));
    }

    walkers[i].update();
    walkers[i].display();
  }
}
