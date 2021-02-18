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
  }
  
  void MoveTowardsPlayer()
  { 
    int xDistance = Math.abs(player.x-x);
    int yDistance = Math.abs(player.y-y); 
    
    
     // random chance (~25% chance) for at enemy flytter sig i en tilfældig retning. 

   
    
    
 
    
    
    
    
    if (xDistance < yDistance) x++;
    else if(xDistance > yDistance) x--;


if(yDistance < xDistance) y++;
else if(yDistance > xDistance) y--;
    } 
//       {
//    // opdater y værdi at rykke et felt nærmere player; 
  }
