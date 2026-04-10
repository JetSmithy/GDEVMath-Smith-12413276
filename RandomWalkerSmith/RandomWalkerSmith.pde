Walker w1;
Walker w2;

void setup()
{
  size(800, 600);
  background(255);

  w1 = new Walker();
  w2 = new Walker();
}



void draw()
{
  w1.step();
  w1.display();

  w2.stepBiased();
  w2.display();
}




class Walker
{
  int x;
  int y;

  Walker()
  {
    x = width/2;
    y = height/2;
  }



  void display()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);

    noStroke();
    fill(r, g, b, a);
    ellipse(x, y, 6, 6);
  }




  void step()
  {
    int choice = int(random(8));

    if (choice == 0) x++;
    else if (choice == 1) x--;
    else if (choice == 2) y++;
    else if (choice == 3) y--;
    else if (choice == 4) { x++; y++; }
    else if (choice == 5) { x--; y--; }
    else if (choice == 6) { x++; y--; }
    else if (choice == 7) { x--; y++; }
  }



  void stepBiased()
  {
    float r = random(1);

    if (r < 0.4) x++;
    else if (r < 0.6) x--;
    else if (r < 0.8) y++;
    else y--;
  }
  
  
}
