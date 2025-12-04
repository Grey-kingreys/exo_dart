import 'dart:math';

double racine(double x) {
  if (x < 0) {
    throw ArgumentError(
      'La racine carrée d\'un nombre négatif est indéfinie (x = $x).',
    );
  }
  return sqrt(x);
}
