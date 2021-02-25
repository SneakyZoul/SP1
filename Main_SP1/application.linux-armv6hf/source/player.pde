class Player 
{

  int x; 
  int y; 
  int coll = 3; 
  int health; 
  int score; 
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
  void increaseScore() {
    if (player.x == food.x && player.y == food.y) {
      score++;
    }
  }
}
