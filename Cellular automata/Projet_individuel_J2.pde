import processing.sound.*;
// Pour produire du son
SinOsc osc;
Env env;
// Définition de la grille de cellules
int columns = 50;
int rows = 50;
int cellSize = 20;
int[][] grid; // Grille de la génération actuelle
int[][] nextGrid; // Grille de la prochaine génération

void setup() {
  size(500, 500);
  frameRate(1.3);
  
  grid = new int[columns][rows];
  nextGrid = new int[columns][rows];
  
  osc = new SinOsc(this);
  env = new Env(this);
  
  // Initialisation aléatoire des cellules
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = int(random(2));
    }
  }
}

void draw() {
  // Affichage de la génération actuelle
  // Définition des couleurs
  int sum = 0;
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 1) {
        if (countNeighbors(i, j) <= 1) {
        fill(142, 222, 234); // Bleu clair
        sum+= 1;
        }
        else if (countNeighbors(i, j) == 2) {
        fill(144, 238, 144); // Vert clair
        sum+= 1;
        }
        else if (countNeighbors(i, j) == 3) {
        fill(250, 211, 87); // Jaune
        sum+= 2;
        }
        else if (countNeighbors(i, j) == 4) {
        fill(255, 150, 0); // Orange
        sum+=2;
        }
        else {
        fill(234, 34, 34); // Rouge
        sum+=3;
        }
      }
      else {
        fill(240, 255, 255);
      }
      stroke(150);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }
  
  // On génère le son
  float freq = map(sum, 0, columns * rows, 200, 1000); // On convertit notre nombre de cellules (sum) en fréquences (entre 200HZ et 1000HZ)
  osc.freq(freq);
  env.play(osc, 0.4, 0.2, 0.05, 0.65); // Joue le son (montée progressive, descroissance faible -> harmonieux pour les transitions d'un son à l'autre)
  
  
  // Calcul de la prochaine génération
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      int neighbors = countNeighbors(i, j); // Nombre de voisins vivants
      // Règles d'évolution des cellules en fonction des 8 voisins les plus proches
      if (grid[i][j] == 1) {
        if (neighbors < 2) {
          nextGrid[i][j] = 0; // mort car trop peu de vosins
        }
        else if (neighbors >= 4){
          nextGrid[i][j] = 0; // mort car trop de voisins
        } else {
          nextGrid[i][j] = 1; // survie
        }
      }
      else {
        if (neighbors == 2) {
          nextGrid[i][j] = 1; // nait
        } else {
          nextGrid[i][j] = 0; // reste mort
        }
      }
    }
  }
  
  // Remplacer l'ancienne génération
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = nextGrid[i][j];
    }
  }
}

// Fonction pour compter les voisins vivants (formules : ChatGPT)
int countNeighbors(int x, int y) {
  int sum = 0;
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      
      /*(x-1, y-1)  (x, y-1)  (x+1, y-1)
        (x-1, y)    Nous(x, y)    (x+1, y)
        (x-1, y+1)  (x, y+1)  (x+1, y+1)*/
        
      int column = (x + i + columns) % columns;
      int row = (y + j + rows) % rows;
      sum += grid[column][row];
    }
  }
  sum -= grid[x][y]; // On ne compte pas la cellule elle-même
  return sum;
}
