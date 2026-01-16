// Photo
PImage img;

// Définition de la grille de cellules
int columns;
int rows;
int cellSize = 10; // Plus la taille des cellules est grande, plus l'effet mosaïque est grossier

int[][] grid; // Grille des états des cellules actuelles
int[][] gridNewGen; // Grille des états des cellules de la génération suivante
float[][] lum; // Stocke les luminosités des cellules
color[][] colors; // Stocke les couleurs de chaque cellule


// Pour le rendu visuel, ajout d'un paramètre de taille des ellipses
float size = 1.5;


void setup() {
  size(800, 800);
  pixelDensity(1);
  frameRate(5);
  
  // On récupère les pixels de l'image
  img = loadImage("3.JPG");
  img.resize(width, height);
  img.loadPixels();
  
  columns = width / cellSize;
  rows = height / cellSize;
  
  // Initialisation des tableaux
  grid = new int[columns][rows];
  gridNewGen = new int[columns][rows];
  lum = new float[columns][rows];
  colors = new color[columns][rows];
  
  // Initialisation des cellules
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      // On récupère les couleurs de chaque cellule
      color c = img.get(cellSize*i, cellSize*j); // Choix : chaque cellule a la couleur du pixel présent à son coin gauche
      colors[i][j] = c;
      lum[i][j] = 0; // Tableau vide à la première génération
      grid[i][j] = 0;
    }
  }
  
  // Comme pour GameOfLife, on place quelques cellules de départ
  for (int i = 0; i < 10; i++) {
    grid[int(random(columns))][int(random(rows))] = 1;
  }
}




void draw() {
  background(255);
  
  // Jeu de règles
  for (int i = 1; i < columns - 1; i++) { // Bornes pour éviter les problèmes de bords
    for (int j = 1; j < rows - 1; j++) {
      
      if (grid[i][j] == 0) {
        // Compter les voisines allumées
        int voisines = grid[i-1][j] + grid[i+1][j] + grid[i][j-1] + grid[i][j+1];
        
        // Si une voisine est allumée, on s'allume
        if (voisines > 0) {
          gridNewGen[i][j] = 1;
        }
      }
      else {
        gridNewGen[i][j] = 1; // Reste allumé
      }
    }
  }

  // Affichage de la mosaïque
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      
      grid[i][j] = gridNewGen[i][j];

      if (grid[i][j] == 1) {
      // On augmente la luminosité jusqu'à 255 (opacité totale)
          if (lum[i][j] < 255) {
            lum[i][j] += 10;
            if (lum[i][j] > 255) {
              lum[i][j] = 255;
            }
          }
          
       pushMatrix();
       translate(i * cellSize, j * cellSize);
        
       // Orientation du trait selon la couleur
       float angle = map(brightness(colors[i][j]), 0, 255, 0, PI);
       rotate(angle);
        
       stroke(colors[i][j], lum[i][j]);
       float s = abs(size);
       strokeWeight(2 * s);          // Épaisseur réglable avec tes touches + / -
       
       // On trace une ligne qui dépasse un peu de la cellule pour créer du liant
       float lineLenght = cellSize * s * 1.5; // Formule ChatGPT
       line(-lineLenght/2, 0, lineLenght/2, 0);
       popMatrix();
      }
    }
  }
}




// L'utilisateur peut accélérer le processus en ajoutant des cellules
void mousePressed() { 
  int x = mouseX / cellSize;
  int y = mouseY / cellSize;
  // Vérifie que le clic est bien dans la grille
  grid[x][y] = 1;
  gridNewGen[x][y] = 1;
}

// L'utilisateur peut changer la taille des ellipses
void keyPressed() {
  if (key == '+') {
    size += 0.2;
  }
  else if (key == '-') {
    size -= 0.2;
  }
}
