class Enemy 
{ 
  int x; 
  int y; 
  int coll = 1; 
  Player player; 


  Enemy (int x, int y, Player player) 
  {
    this.x = x;
    this.y = y; 
    this.player = player;
    frameRate(15);
  }

  void MoveTowardsPlayer()
  {
    int h = (int)random(100);
    if (h < 50)
    {

      int i = (int)random(3); 
      if (Math.random() < 0.25)
      {
        if (i==0)
        {
          if (enemy.x >0)
          {
            x--;
          }
        }
        if ( i==1)
        {
          if (enemy.y >0)
          {
            y--;
          }
        }
        if (i ==2)
        {
          if (enemy.x < 24)
          {
            x++;
          }
        }
        if (i ==3)
        {
          if ( enemy.y < 24)
          {
            y++;
          }
        }
      }
    }


    int xDistance = Math.abs(player.x-x);
    int yDistance = Math.abs(player.y-y); 


    if ( h > 50)
    {
      // y akse 
      if (xDistance < yDistance)
      {
        if (player.y > y)
        {
          if (y < 24 ) 
          {
            y++;
          }
        } else
        {
          if ( y > 0)
          {
            y--;
          }
        }
      } else { 
        if (player.x > x)
        {
          if (x < 24)
          {
            x++;
          }
        } else {
          if (x > 0)
          {
            x--;
          }
        }
      }
    }
  }
}
