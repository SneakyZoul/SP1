import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main_SP1 extends PApplet {

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

public void setup()
{
  

  player = new Player(5, 6); 
  food = new Food(20, 20, player); 
  enemy = new Enemy(20, 10, player); 
  enemy2 = new Enemy(19, 9, player); 
  enemy3 = new Enemy(19, 9, player); 
  enemy4 = new Enemy(19, 9, player); 
  enemy5 = new Enemy(19, 9, player);
} 
public void draw() 
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
public void clearBord() 
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
public void drawBorad() 
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
public void initRandomValues() 
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
public void resolveCollisions() {
  if (player.x == food.x && player.y == food.y) {
    player.increaseScore();
    food = new Food(PApplet.parseInt(random(0, 25)), PApplet.parseInt (random(0, 25)), player);
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
public void theUnits() 
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

public int getColorFromType(int coll)
{ 
  int c = color(255); 

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
public void keyPressed()
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
public void UI() {
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

public void restart() {
  if (player.health <=0 && key == 'r') {
    setup();
  }
}


public void gameOver() { 

  if (player.health <= 0) {
    textSize(100); 
    text( " GAMER OVER! ", 200, 200);
    noLoop();
  }
  if (player.score == 25) {
    textSize(100);
    text(" YOU WIN!", 200, 200);
    noLoop();
  }
}
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

  public void MoveTowardsPlayer()
  {
    int h = (int)random(100);
    if (h < 50)
    {

      int i = (int)random(3); 
      if (Math.random() < 0.25f)
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
  public void moveAwayFromPLayer() { 



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

  public void takenDamage() 
  { 
    health--;
  } 
  public void increaseScore() {
    if (player.x == food.x && player.y == food.y) {
      score++;
    }
  }
}
  public void settings() {  size(1001, 1001); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Main_SP1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
