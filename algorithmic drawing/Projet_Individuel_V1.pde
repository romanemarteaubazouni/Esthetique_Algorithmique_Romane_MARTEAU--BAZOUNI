//définition de la grille de carrés
int rows = 8;
int columns = 8;

//informations contenues dans les cellules : taille du carré (repéré par sa ligne et sa colonne) et couleur (système rgb)
float[][] sizes;
color[][] colors; 

void setup() {
  size(800, 800);
  
  sizes = new float[columns][rows]; //on initialise les tableaux
  colors = new color[columns][rows];
  
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      sizes[i][j]=random(0.5, 0.9);
      colors[i][j]=color(random(255), random(255), random(255));
    //on a donc toutes les tailles et couleurs des carrés présents dans chaque cellule
    }
  }
}

void draw() {
  background(255); //ajouter ultérieurement : sinon, l'interactivité ne marchait pas et chaque nouveau carré se positionnait par dessus l'ancien
  
  float widthCell = width / float(columns); //chaque cellule blanche a la même taille : utilisation de width pour un code adaptable facilement
  float heightCell = height / float(rows);
  
//affichage des carrés de couleur présents dans les cellules
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      float widthSquare = widthCell * sizes[i][j];
      float heightSquare = heightCell * sizes[i][j];
      
      //centrage du carré dans la cellule
      float x = i * widthCell + (widthCell - widthSquare)/2;
      float y = j * heightCell + (heightCell - heightSquare)/2;
      
      stroke(colors[i][j]);
      fill(colors[i][j]);
      rect(x, y, widthSquare, heightSquare);
    }
  }
}

//interactivité : lorsqu'on clique, les couleurs changent ainsi que la taille des carrés
void mousePressed() {
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      sizes[i][j]=random(0.5, 0.9);
      colors[i][j]=color(random(255), random(255), random(255));
    }
  }
}

void keyPressed() {
  if (key == '+') {
    rows++;
    columns++;
  }
  else if (key == '-') {
    rows--;
    columns--;
  }
    // recréer les tableaux avec la nouvelle taille
    sizes = new float[columns][rows];
    colors = new color[columns][rows];

    // réinitialiser les valeurs
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        sizes[i][j] = random(0.5, 0.9);
        colors[i][j] = color(random(255), random(255), random(255));
      }
    }
}