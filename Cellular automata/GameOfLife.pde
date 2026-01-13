// Définition de la grille de cellules
int columns = 50;
int rows = 50;
int cellSize = 15;
int[][] grid; // Grille de la génération actuelle
int[][] nextGrid; // Grille de la prochaine génération

void setup() {
  size(500, 500);
  frameRate(10);
  
  grid = new int[columns][rows];
  nextGrid = new int[columns][rows];
  
  // Initialisation aléatoire des cellules
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = int(random(2));
    }
  }
}

void draw() {
  background(255);
  // Affichage de la génération actuelle
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 1) {
        fill(0);
      } else {
        fill(255);
      }
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }

  // Calcul de la prochaine génération
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      int neighbors = countNeighbors(i, j); // Nombre de voisins vivants
      
      // Règles d'évolution des cellules en fonction des 8 voisins les plus proches
      if (grid[i][j] == 1) {
        if (neighbors < 2 || neighbors > 3) {
          nextGrid[i][j] = 0; // mort
        } else {
          nextGrid[i][j] = 1; // survie
        }
      } else {
        if (neighbors == 3) {
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
