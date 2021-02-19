int size = 40; 
int [][] grid = new int[25][25];
int speed =0;  
Player player; 
Enemy enemy; 
Enemy enemy2;
Enemy enemy3;
Enemy enemy4;
Enemy enemy5;
Food food; 

void setup()
{
  size(1001, 1001);

  player = new Player(5, 6); 
  food = new Food(20, 20, player); 
  enemy = new Enemy(20, 10, player); 
  enemy2 = new Enemy(19, 9, player); 
  enemy3 = new Enemy(19, 9, player); 
  enemy4 = new Enemy(19, 9, player); 
  enemy5 = new Enemy(19, 9, player);
} 
void draw() 
{ 
  clearBord(); 
  theUnits(); 
  drawBorad();
  resolveCollisions();
  UI();
  println(player.score); 
  println(player.health);
  gameOver();
} 

//removing the player, and enemy so it dosn't
void clearBord() 
{ 
  for ( int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y< grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}
//the gameborad and the grid
void drawBorad() 
{ 
  for ( int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y< grid[0].length; y++)
    {
      fill(getColorFromType(grid[x][y])); 

      rect(x * size, y * size, size, size );
    }
  }
}

//numbers
void initRandomValues() 
{ 
  for ( int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y< grid[0].length; y++)
    {
      grid[x][y] = (int)random(0, 5);
    }
  }
}
//Damage, Score, Health
void resolveCollisions() {
  if (player.x == food.x && player.y == food.y) {
    player.increaseScore();
    food = new Food(int(random(0, 25)), int (random(0, 25)), player);
  } else {
  }
  if (player.x == enemy.x && player.y == enemy.y) {
    player.takenDamage();
  }
  if ( player.health <= 0) {
    gameOver();
  }
}



//the units 
void theUnits() 
{

  grid[player.x][player.y] = player.coll;
  grid[enemy.x][enemy.y] = enemy.coll;  

  enemy.MoveTowardsPlayer();  
  if (player.score >= 4) {
    grid[enemy2.x] [enemy2.y] = enemy2.coll;
    enemy2.MoveTowardsPlayer();
  }
  if (player.score >= 8) {
    grid[enemy3.x] [enemy3.y] = enemy3.coll;
    enemy3.MoveTowardsPlayer();
  }
  if (player.score >= 10) {
    grid[enemy4.x] [enemy4.y] = enemy4.coll;
    enemy4.MoveTowardsPlayer();
  }
  if (player.score >= 15) {
    grid[enemy5.x] [enemy5.y] = enemy5.coll;
    enemy5.MoveTowardsPlayer();
  }
  grid[food.x][food.y] = food.coll;
  food.moveAwayFromPLayer();
}

//color change

color getColorFromType(int coll)
{ 
  color c = color(255); 

  switch(coll)
  {
  case 0:
    c = color(127); 
    break; 
  case 1: 
    c = color(255, 0, 0);
    break; 
  case 2: 
    c = color(0, 255, 0); 
    break; 
  case 3: 
    c = color(0, 0, 255); 
    break; 
  case 4: 
    c = color(100, 50, 0);
  }
  return c;
}

//player kontroll. 
void keyPressed()
{  
  if (key == 'w' || key == 'A') 
  {
    if (player.y > 0)
    {
      player.y--;
    }
  }
  if (key == 's' || key == 'S') 
  {
    if ( player.y < 24)
    {
      player.y++;
    }
  }
  if (key == 'd' || key == 'D')
  {
    if (player.x < 24)
    {
      player.x++;
    }
  } 
  if (key == 'a' || key == 'A')
  {
    if ( player.x > 0)
    {
      player.x--;
    }
  }
}



//Dynamci HP Bar & Dynamic Scoreboard
void UI() {
  stroke(0);
  fill(150, 200);
  rect(20, 20, 110, 80); 

  textSize(20);
  fill(200, 250);
  text("HP", 32, 40);
  fill(0);
  text("HP", 30, 40);

  fill(200, 0, 0, 230);
  rect(25, 50, player.health, 40);
  if (player.health > 0) {
    rect(25, 50, player.health, 40);
  } else if ( player.health <= 0) { 
    player.health = 0;
  } 

  stroke(0); 
  fill(150, 200);
  rect(890, 20, 100, 50);
  textSize(20); 

  fill(200, 250); 
  text("SCORE", 893, 40);
  fill(0); 
  text("SCORE", 895, 40); 
  textSize(25);
  fill(200, 200, 0);
  text(player.score, 890, 65);
}

//Dynamic "GAME OVER"! & "YOU WIN!" 

void restart() {
  if (player.health <=0 && key == 'r') {
    setup();
  }
}


void gameOver() { 
  
  if (player.health <= 0) {
    textSize(100); 
    text( " GAMER OVER! ", 200, 200);
    noLoop();
  }
  if (player.score == 10) {
    textSize(100);
    text(" YOU WIN!", 200, 200);
    noLoop();
  }
}
