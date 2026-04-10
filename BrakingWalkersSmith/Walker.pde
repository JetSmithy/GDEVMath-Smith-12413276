public class Walker
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float mass;
  float scale;
  color c;

  int index;

  Walker(float m, int i)
  {
    mass = m;
    index = i;

    scale = mass * 15;
    c = color(random(255), random(255), random(255));

    // start left side
    position = new PVector(-600, getYPosition());
  }

  float getYPosition()
  {
    float n = 8;
    return 2 * (Window.windowHeight / n) * (index - (n / 2));
  }

  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void applyFriction()
  {
    float mu = 0.01;

    if (position.x > 0)
      mu = 0.4;

    PVector friction = velocity.copy();
    friction.normalize();
    friction.mult(-1);

    friction.mult(mu);

    applyForce(friction);
  }

  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void render()
  {
    fill(c);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
