class Food
{ 

  // data:
  int x;
  int y;
  int coll = 2;  
  Player player;
  int moveTimer;





  Food(int x, int y, Player player)
  {
    this.x = x; 
    this.y = y; 
    this.player = player;
    frameRate(15);
  }
  void moveAwayFromPLayer() { 



    int xDistance = Math.abs(player.x+x);
    int yDistance = Math.abs(player.y+y); 

    {
      // y akse 
      if (xDistance > yDistance)
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
        if (player.x < x)
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
