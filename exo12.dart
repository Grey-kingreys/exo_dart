Map<String, List<double>> registres = {};

void ajouterNote(String nom, double note) {
  registres.putIfAbsent(nom, () => []);
  registres[nom]!.add(note);
}

double moyenneEtudiant(String nom) {
  final notes = registres[nom];
  if (notes == null || notes.isEmpty) {
    throw ArgumentError('Aucune note pour l\'étudiant $nom');
  }
  double somme = 0;
  for (final n in notes) {
    somme += n;
  }
  return somme / notes.length;
}

Map<String, double> calculerMoyennes() {
  final Map<String, double> moyennes = {};
  registres.forEach((nom, notes) {
    if (notes.isNotEmpty) {
      double somme = 0;
      for (final n in notes) {
        somme += n;
      }
      moyennes[nom] = somme / notes.length;
    }
  });
  return moyennes;
}

void main() {
  ajouterNote('Alice', 12);
  ajouterNote('Alice', 15);
  ajouterNote('Bob', 8);
  ajouterNote('Bob', 10);
  ajouterNote('Charlie', 17);

  final moyennes = calculerMoyennes();

  if (moyennes.isEmpty) {
    print('Aucun étudiant.');
    return;
  }

  final entreesTriees = moyennes.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  print('Moyennes des étudiants (ordre décroissant) :');
  for (final e in entreesTriees) {
    print('${e.key} : ${e.value.toStringAsFixed(2)}');
  }

  final meilleur = entreesTriees.first;
  final pire = entreesTriees.last;

  print('');
  print(
    'Meilleur élève : ${meilleur.key} (${meilleur.value.toStringAsFixed(2)})',
  );
  print('Moins bon élève : ${pire.key} (${pire.value.toStringAsFixed(2)})');

  // Bonus : ajout automatique d\'un étudiant "anonyme" si un nom n\'existe pas
  const nomInconnu = 'X';
  if (!registres.containsKey(nomInconnu)) {
    registres['anonyme'] = [10, 11, 12];
    print('');
    print('Étudiant "anonyme" ajouté automatiquement.');
  }
}
