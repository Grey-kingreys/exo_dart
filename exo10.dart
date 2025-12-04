import 'dart:io';

import 'carre.dart';
import 'racine.dart';
import 'puissance.dart';
import 'moyenne.dart';

void main() {
  while (true) {
    print('');
    print('=== Calculateur scientifique ===');
    print('1. Carré d\'un nombre');
    print('2. Racine carrée d\'un nombre');
    print('3. Puissance (base^exp)');
    print('4. Moyenne d\'une liste de nombres');
    print('5. Quitter');
    stdout.write('Votre choix : ');

    final choix = stdin.readLineSync();
    print('');

    switch (choix) {
      case '1':
        stdout.write('Entrez un nombre : ');
        final entree = stdin.readLineSync();
        final x = double.tryParse((entree ?? '').replaceAll(',', '.'));
        if (x == null) {
          print('Valeur invalide.');
          break;
        }
        final resultat = carre(x);
        print('Carré de $x = $resultat');
        break;

      case '2':
        stdout.write('Entrez un nombre (>= 0) : ');
        final entree = stdin.readLineSync();
        final x = double.tryParse((entree ?? '').replaceAll(',', '.'));
        if (x == null) {
          print('Valeur invalide.');
          break;
        }
        try {
          final resultat = racine(x);
          print('Racine carrée de $x = $resultat');
        } catch (e) {
          print('Erreur : $e');
        }
        break;

      case '3':
        stdout.write('Base : ');
        final entreeBase = stdin.readLineSync();
        final base = double.tryParse((entreeBase ?? '').replaceAll(',', '.'));
        if (base == null) {
          print('Base invalide.');
          break;
        }
        stdout.write('Exposant (entier >= 0) : ');
        final entreeExp = stdin.readLineSync();
        final exp = int.tryParse((entreeExp ?? '').trim());
        if (exp == null || exp < 0) {
          print('Exposant invalide.');
          break;
        }
        final resultat = puissance(base, exp);
        print('$base ^ $exp = $resultat');
        break;

      case '4':
        stdout.write('Entrez des nombres séparés par des espaces : ');
        final ligne = stdin.readLineSync();
        if (ligne == null || ligne.trim().isEmpty) {
          print('Aucune valeur saisie.');
          break;
        }
        try {
          final valeurs = ligne
              .split(RegExp(r'\s+'))
              .map((s) => double.parse(s.replaceAll(',', '.')))
              .toList();
          final moy = moyenne(valeurs);
          print('Valeurs : $valeurs');
          print('Moyenne = $moy');
        } catch (e) {
          print('Erreur lors de la lecture des valeurs : $e');
        }
        break;

      case '5':
        print('Au revoir !');
        return;

      default:
        print('Choix invalide, veuillez réessayer.');
    }
  }
}
