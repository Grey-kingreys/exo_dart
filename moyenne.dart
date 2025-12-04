double moyenne(List<double> valeurs) {
  if (valeurs.isEmpty) {
    throw ArgumentError('La liste de valeurs est vide.');
  }
  double somme = 0;
  for (final v in valeurs) {
    somme += v;
  }
  return somme / valeurs.length;
}
