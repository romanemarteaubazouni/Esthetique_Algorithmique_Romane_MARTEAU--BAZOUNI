# Free project

Pour tester le code, installer Processing et exécuter les fichiers .pde.

Les photos utilisables sur ce projet sont disponibles dans le dossier "data", à placer au même emplacement que les fichiers.pde.
Pour visualiser vos propres photos, il faut pour l'instant changer la ligne de code n°25 à la main.

## Idée du projet
Étant très sensible à la photographie ainsi qu’au dessin et à la peinture, j’ai voulu amener ces passions dans ce workshop. L’idée m’est venue presque immédiatement : créer un algorithme qui, à partir d’une photo, génère une sorte de dessin numérique, plus ou moins abstrait (un aspect du projet qui reste encore ouvert).

Je souhaitais fusionner deux projets que j’ai appréciés cette semaine :
- le rendu du jour 1 avec les carrés de couleur,
- et le rendu du jour 2 sur les automates cellulaires.

Étant donné le temps passé sur les automates cellulaires, j’ai décidé de m’appuyer sur ce principe : transformer une photographie en une peinture numérique abstraite, presque sous forme de mosaïque. Cela me permettait de réunir plusieurs passions pour les traduire numériquement.

### Principe :
On allume 10 cellules au hasard sur l’écran.
À chaque nouvelle génération, les cellules actives activent leurs voisines directes.
Toutes les cellules actives ajustent leur teinte et leur luminosité pour se rapprocher de la photo d’origine.
Un jeu sur la luminosité crée un effet d’apparition progressive.

### Version 1 (image quelconque : ici une fleur):
![alt text](./Screenshots/V1_Result.png)

Une fois l’aspect technique stabilisé, j’ai cherché un rendu qui me touchait davantage.

J’ai testé plusieurs formes (triangles, ellipses…). Les ellipses m’ont particulièrement parlé visuellement, j’ai donc orienté le rendu dans cette direction.

J’ai ensuite voulu varier la taille des ellipses. J’ai arbitrairement décidé que les couleurs claires produiraient de grandes ellipses, et les couleurs foncées de petites. Cela fonctionnait sur l’image de fleurs, mais pas forcément sur d’autres.

![alt text](./Screenshots/V2_Ellipses_fixes.png)

Pour rendre le tout plus interactif, j’ai ajouté une commande :
- en appuyant sur +, les ellipses claires deviennent grandes ;
- en appuyant sur -, ce sont les ellipses sombres qui grossissent.
Ce paramètre permet de créer différentes textures et de produire des images qui s’éloignent un peu de la photo d’origine.

![alt text](./Screenshots/V2_Ellipses_grossies.png)

Enfin, j'ai cherché à avoir un rendu plus proche de la peinture car j'y suis personnellement plus sensible. J'ai cherché à remplacer les ellipses par des lignes pour avoir cet aspect "coups de pinceau".

![alt text](./Screenshots/V3_Effet_peinture.png)

Pistes d'amélioration
Avec plus de temps, j’aimerais beaucoup explorer la bibliothèque ControlP5, que je n’ai pas réussi à appréhender aujourd’hui.
Elle me permettrait d’ajouter de vrais boutons ou même une barre de recherche, afin de naviguer beaucoup plus facilement entre différentes images et donner une dimension plus professionnelle et ergonomique à l’interface.

## Crédits
### IA :
Gemini a été utilisé pour ce code. *Rien n'a été généré par IA*. Cependant, j'ai utilisé de l'IA pour :
- optimiser le code ;

- gérer la taille variable des ellipses et des lignes ;

### Inspirations :
- Mosaïques ;

- Sensibilité personnelle aux arts plastiques et visuels ;