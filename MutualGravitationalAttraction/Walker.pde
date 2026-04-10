class Walker
{
  PVector pos;
  PVector vel;
  PVector acc;

  float mass;
  float size;
  color c;

  Walker()
  {
    mass = random(1, 5);
    size = mass * 15;
    c = color(random(255), random(255), random(255));

    pos = new PVector(random(-width/2, width/2),
                      random(-height/2, height/2));

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

  // ===== GRAVITATIONAL ATTRACTION =====
  PVector attract(Walker other)
  {
    PVector force = PVector.sub(pos, other.pos);
    float distance = force.mag();

    distance = constrain(distance, 5, 25);

    force.normalize();

    float strength = (mass * other.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }
}
