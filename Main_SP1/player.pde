class Player 
{

  int x; 
  int y; 
  int coll = 3; 
  int health; 
  
  Player(int x, int y) 
  { 
    this.x = x;
    this.y = y; 
    health = 100; 
  }
  
  void takenDamage() 
  { 
    health--; 
  } 
}