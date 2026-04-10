class Walker
{
  PVector pos;
  PVector vel;
  PVector acc;

  float mass;
  float size;
  color c;

  Walker(float x)
  {
    mass = random(1, 5);
    size = mass * 15;
    c = color(random(255), random(255), random(255));

    pos = new PVector(x, -100);
    vel = new PVector();
    acc = new PVector();
  }

  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update()
  {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display()
  {
    fill(c);
    noStroke();
    circle(pos.x, pos.y, size);
  }
}
