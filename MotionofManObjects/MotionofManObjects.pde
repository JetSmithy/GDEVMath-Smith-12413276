Walker[] walkers;

PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  walkers = new Walker[10];

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i + 1); // mass 1–10
  }
}

void draw()
{
  background(50);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);

    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
