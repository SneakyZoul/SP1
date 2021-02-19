class Food
{ 

  // data:
int x;
int y;
int coll = 2;  
Player player;
//- Player // en reference til player objektet, for at kunne måle afstand.





 Food(int x, int y, Player player)
{
  this.x = x; 
  this.y = y; 
  this.player = player;

}
void moveAwayFromPLayer(){ 
   

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

//Food (int x, int y) 
//- Constructor() // sætter x, y og player variablerne.
//- MoveAwayFromPlayer() // sætter ny x og y værdi. Der skal være 25% chance for at food bevæger sig i en tilfældig retning.
