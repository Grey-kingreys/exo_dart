import 'dart:io';

void main() {
  // Initialisation du tableau de nombres
  List<int> nombres = [15, 8, 23, -5, 42, 0, 17, -12, 31, 7];

  // Variables pour les statistiques
  int nombreElements = nombres.length;
  int somme = 0;
  int minimum;
  int maximum;
  bool contientNegatifs = false;

  // Calcul de la somme, recherche du min/max et détection des négatifs
  if (nombreElements > 0) {
    minimum = nombres[0];
    maximum = nombres[0];

    for (int i = 0; i < nombreElements; i++) {
      somme += nombres[i];

      // Recherche du minimum
      if (nombres[i] < minimum) {
        minimum = nombres[i];
      }

      // Recherche du maximum
      if (nombres[i] > maximum) {
        maximum = nombres[i];
      }

      // Détection des nombres négatifs
      if (nombres[i] < 0) {
        contientNegatifs = true;
      }
    }
  } else {
    minimum = 0;
    maximum = 0;
  }

  // Calcul de la moyenne
  double moyenne = nombreElements > 0 ? somme / nombreElements : 0;

  // Affichage du rapport formaté
  print("═" * 50);
  print("      RAPPORT DE STATISTIQUES");
  print("═" * 50);
  print("");
  print("📊 Analyse du tableau : $nombres");
  print("");
  print("─" * 30);
  print("RÉSULTATS PRINCIPAUX :");
  print("─" * 30);
  print("• Nombre d'éléments : $nombreElements");
  print("• Somme totale : $somme");
  print("• Moyenne : ${moyenne.toStringAsFixed(2)}");
  print("• Minimum : $minimum");
  print("• Maximum : $maximum");
  print("");

  // Message d'alerte pour les nombres négatifs
  if (contientNegatifs) {
    print("⚠️  ALERTE : Le tableau contient des nombres négatifs !");
    print("   Veuillez vérifier les données.");
  } else {
    print("✅ Tous les nombres sont positifs ou nuls.");
  }

  print("");
  print("═" * 50);

  // Bonus : Affichage des statistiques supplémentaires
  print("");
  print("📈 STATISTIQUES SUPPLÉMENTAIRES :");
  print("─" * 35);

  // Calcul de l'étendue
  int etendue = maximum - minimum;
  print("• Étendue (max - min) : $etendue");

  // Comptage des nombres positifs, négatifs et nuls
  int positifs = 0;
  int negatifs = 0;
  int nuls = 0;

  for (int nombre in nombres) {
    if (nombre > 0) {
      positifs++;
    } else if (nombre < 0) {
      negatifs++;
    } else {
      nuls++;
    }
  }

  print("• Nombres positifs : $positifs");
  print("• Nombres négatifs : $negatifs");
  print("• Nombres nuls : $nuls");

  // Vérification si le tableau est équilibré (plus de positifs que de négatifs)
  if (positifs > negatifs) {
    print("✨ Le tableau est équilibré (plus de positifs)");
  } else if (negatifs > positifs) {
    print("⚖️  Le tableau est déséquilibré (plus de négatifs)");
  } else {
    print("⚖️  Le tableau est parfaitement équilibré");
  }

  print("");
  print("═" * 50);
  print("      FIN DU RAPPORT");
  print("═" * 50);
}
