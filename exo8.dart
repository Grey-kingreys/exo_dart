import 'dart:io';

void main() {
  // Liste d'entiers à analyser
  final List<int> nombres = [1, 5, 10, 20, 6];

  // Fonctions anonymes / fléchées pour les statistiques
  final Map<String, Function> stats = {
    'somme': (List<int> list) => list.fold<int>(0, (acc, n) => acc + n),
    'moyenne': (List<int> list) =>
        list.isEmpty ? 0 : list.fold<int>(0, (acc, n) => acc + n) / list.length,
    'maximum': (List<int> list) =>
        list.isEmpty ? null : list.reduce((a, b) => a > b ? a : b),
    'minimum': (List<int> list) =>
        list.isEmpty ? null : list.reduce((a, b) => a < b ? a : b),
  };

  // Appels dynamiques pour afficher le résumé complet
  final somme = stats['somme']!(nombres) as int;
  final moyenne = stats['moyenne']!(nombres) as double;
  final max = stats['maximum']!(nombres) as int?;
  final min = stats['minimum']!(nombres) as int?;

  print('Résumé des statistiques (liste: $nombres)');
  print('Somme   : $somme');
  print('Moyenne : $moyenne');
  print('Maximum : $max');
  print('Minimum : $min');

  // Bonus : interaction utilisateur pour choisir la fonction à exécuter
  print('\n=== Exécution dynamique par nom de clé ===');
  print('Clés disponibles : ${stats.keys.join(', ')}');
  stdout.write('Entrez le nom de la statistique à calculer : ');
  final choix = stdin.readLineSync();

  if (choix == null || choix.isEmpty) {
    print('Aucune clé saisie.');
    return;
  }

  final fonctionChoisie = stats[choix.toLowerCase()];

  if (fonctionChoisie == null) {
    print('Clé "$choix" inconnue.');
    return;
  }

  final resultat = fonctionChoisie(nombres);
  print('Résultat pour "$choix" : $resultat');
}
