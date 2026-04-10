Walker[] walkers;

PVector accelerationForce = new PVector(0.2, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initWalkers();
}

void draw()
{
  background(60);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(accelerationForce);
    walkers[i].applyFriction();
    walkers[i].update();
    walkers[i].render();
  }
}

void mousePressed()
{
  initWalkers();
}

void initWalkers()
{
  walkers = new Walker[8];

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i + 1, i);
  }
}
