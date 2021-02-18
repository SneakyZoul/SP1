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
  
}
  
}
//Food (int x, int y) 
//- Constructor() // sætter x, y og player variablerne.
//- MoveAwayFromPlayer() // sætter ny x og y værdi. Der skal være 25% chance for at food bevæger sig i en tilfældig retning.
