double puissance(double base, int exp) {
  double resultat = 1;
  for (int i = 0; i < exp; i++) {
    resultat *= base;
  }
  return resultat;
}
