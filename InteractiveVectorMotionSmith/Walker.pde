public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;
  public Walker()
  {
    position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    scale = random(5, 20);
  }



  public void followMouse()
  {
    PVector mouse = new PVector(
      mouseX - Window.windowWidth,
      -(mouseY - Window.windowHeight)
    );



    PVector dir = PVector.sub(mouse, position);
    dir.normalize();
    dir.mult(0.2);

    acceleration = dir;
  }



  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
  }



  public void render ()
  {
    circle(position.x, position.y, scale);
  }



  public void checkEdges()
  {
    if (position.x > Window.right) position.x = Window.left;
    else if (position.x < Window.left) position.x = Window.right;

    if (position.y > Window.top) position.y = Window.bottom;
    else if (position.y < Window.bottom) position.y = Window.top;
  }
}
