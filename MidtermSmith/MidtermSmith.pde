BlackHole bh;
Matter[] m;

int n = 120;
int timer = 0;

void setup()
{
  size(1080, 720);

  bh = new BlackHole();

  m = new Matter[n];
  for (int i = 0; i < n; i++)
  {
    m[i] = new Matter();
  }
}

void draw()
{
  background(0);

  bh.show();

  for (int i = 0; i < n; i++)
  {
    m[i].move(bh.pos);
    m[i].show();
  }

  timer++;

  if (timer > 600)
  {
    bh = new BlackHole();
    for (int i = 0; i < n; i++)
    {
      m[i] = new Matter();
    }
    timer = 0;
  }
}



class BlackHole
{
  PVector pos;

  BlackHole()
  {
    pos = new PVector(random(width), random(height));
  }

  void show()
  {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 50, 50);
  }
}




class Matter
{
  PVector pos;
  float s;
  color c;

  Matter()
  {
    pos = new PVector(
      randomGaussian()*100 + width/2,
      randomGaussian()*100 + height/2
    );

    s = random(3, 8);
    c = color(random(255), random(255), random(255));
  }

  void move(PVector target)
  {
    PVector d = PVector.sub(target, pos);
    d.normalize();
    pos.add(d);
  }



  void show()
  {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, s, s);
  }
}
