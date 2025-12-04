List<Map<String, dynamic>> fusionnerListes(
  List<Map<String, dynamic>> l1,
  List<Map<String, dynamic>> l2,
) {
  final Map<dynamic, Map<String, dynamic>> parId = {};

  for (final e in [...l1, ...l2]) {
    parId[e['id']] = e;
  }

  final resultat = parId.values.toList();
  resultat.sort(
    (a, b) => (b['salaire'] as double).compareTo(a['salaire'] as double),
  );
  return resultat;
}

double calculerSalaireMoyen(List<Map<String, dynamic>> employes) {
  if (employes.isEmpty) return 0;
  double somme = 0;
  for (final e in employes) {
    somme += e['salaire'] as double;
  }
  return somme / employes.length;
}

List<Map<String, dynamic>> filtrerAuDessusMoyenne(
  List<Map<String, dynamic>> employes,
  double moyenne,
) {
  return employes.where((e) => (e['salaire'] as double) > moyenne).toList();
}

void main() {
  final liste1 = [
    {'id': 1, 'nom': 'Alice', 'salaire': 3000.0},
    {'id': 2, 'nom': 'Bob', 'salaire': 2500.0},
  ];

  final liste2 = [
    {'id': 2, 'nom': 'Bob', 'salaire': 2600.0},
    {'id': 3, 'nom': 'Charlie', 'salaire': 4000.0},
  ];

  final fusion = fusionnerListes(liste1, liste2);
  print('Liste fusionnée et triée :');
  for (final e in fusion) {
    print('id: ${e['id']}, nom: ${e['nom']}, salaire: ${e['salaire']}');
  }

  final moyenneSalaire = calculerSalaireMoyen(fusion);
  print('Salaire moyen : ${moyenneSalaire.toStringAsFixed(2)}');

  final filtres = filtrerAuDessusMoyenne(fusion, moyenneSalaire);
  print('Employés au-dessus de la moyenne :');
  for (final e in filtres) {
    print('id: ${e['id']}, nom: ${e['nom']}, salaire: ${e['salaire']}');
  }
}
