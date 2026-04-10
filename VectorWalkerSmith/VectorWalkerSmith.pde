Walker walker;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, 1, 0);

  walker = new Walker();
}



//add speed to the current position
void draw()
{
  //Flush the screen with white background
  background(255);

walker.moveAndBounce();
walker.render();
}
  
