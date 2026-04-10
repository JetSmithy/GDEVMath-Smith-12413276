public class Walker
{
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float mass;
  public float scale;
  public color c;

  public Walker(float m)
  {
    mass = m;
    scale = mass * 15;
    c = color(random(255), random(255), random(255));
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass); // F = ma
    acceleration.add(f);
  }

  public void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void render()
  {
    fill(c);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if (position.x > Window.right || position.x < Window.left)
    {
      velocity.x *= -1;
    }

    if (position.y > Window.top || position.y < Window.bottom)
    {
      velocity.y *= -1;
    }
  }
}
