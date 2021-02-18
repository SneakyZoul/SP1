int size = 40; 
int [][] grid = new int[25][25];

Player player; 
Enemy enemy; 

void setup()
{
  size(1001, 1001);

  player = new Player(5,6); 
  enemy = new Enemy(20, 10, player); 
  
  //grid[5][7] = 3;
} 
void draw() 
{ 
  clearBord(); 
  player(); 
  drawBorad();
  //enemy(); 
  
} 


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


//void initRandomValues() 
//{ 
//  for ( int x = 0; x < grid.length; x++)
//  {
//    for (int y = 0; y< grid[0].length; y++)
//    {
//grid[x][y] = (int)random(0,5);
//    }
//  }
//}



//the player
  void player() {
    grid[player.x][player.y] = player.coll;
    player.takenDamage(); 
     grid[enemy.x][enemy.y] = enemy.coll; 
    enemy.MoveTowardsPlayer();
   
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
    c = color(255,0,0);
      break; 
   case 2: 
   c = color(0,255,0); 
       break; 
   case 3: 
   c = color(0,0,255); 
       break; 
   case 4: 
   c = color(100,50,0); 
  }
  return c;
}

//player kontroll. 
void keyPressed()
{  
    if (key == 'w') 
    {
      player.y--;
    }
    if (key == 's') 
    {
    player.y++; 
    }
    if (key == 'd')
    {
      player.x++;
    } 
    if (key == 'a')
    {
      player.x--; 
    } 
} 
