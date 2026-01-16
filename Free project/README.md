# Free project

Pour tester le code, installer Processing et exécuter les fichiers .pde.

## Idée de projet

Etant très sensible à la photographie et le dessin/peinture, j'ai voulu améner ceci dans ce workshop. L'idée à laquelle j'ai presque immédiatement pensée est la suite : un algorithme qui, à partir d'une photo donnée par l'utilisateur, génère un dessin numérique, plus ou moins abstrait (point encore flou du projet).

La technique est ce qui me bloque souvent en code. La réalisation de ce projet est flou. Utiliser des automates cellulaires avec règles selon les couleurs de pixels ? Utiliser la méthode des "agent-based drawing" ?

Ayant travaillé assez longuement sur les automates cellulaires lors du jour 2, j'ai décidé de partir sur ça : une photo est transformé en peinture assez abstraite numérique, presque mosaïque. Cela me permet de lier plusieurs passions et de les numériser.

## Conception du code

Utilisation d'automates à états multiples (!= binaire) pour avoir un minimum de couleurs représentées sur le canva.

On allume 10 ou 20 cellules au hasard sur l'écran.
À chaque tour, les cellules allumées activent leurs voisines directes.
Toutes les cellules actives ajustent leur teinte pour ressembler à la photo, mais avec un décalage (le côté "grossier") car les couleurs sont des moyenes des pixels de la photo.

## Crédits
### IA :
Gemini a été utilisé pour ce code. *Rien n'a été généré par IA*. Cependant, j'ai utilisé de l'IA pour :
- optimiser le code ;

- l'idée d'utilisation de la classe Cellule. Le code initial était plus long et sans classe. Les couleurs étaient stockées dans une grille à part.

### Inspirations :
- Mosaïques ;

- Sensibilité aux arts plastiques et visuels ;

### Camarades :
- 