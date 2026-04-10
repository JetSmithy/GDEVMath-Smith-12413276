Walker[] walkers;

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  walkers = new Walker[100];

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

/*Vector Motion 101
1. Add Velocity
2. Draw the object at position
*/

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].followMouse();
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
