abstract class Forme {
  double aire();
  double perimetre();
  String decrire();
}

class Cercle extends Forme {
  double rayon;

  Cercle(this.rayon);

  @override
  double aire() => 3.1415926535 * rayon * rayon;

  @override
  double perimetre() => 2 * 3.1415926535 * rayon;

  @override
  String decrire() => 'Cercle de rayon $rayon';
}

class Rectangle extends Forme {
  double longueur;
  double largeur;

  Rectangle(this.longueur, this.largeur);

  @override
  double aire() => longueur * largeur;

  @override
  double perimetre() => 2 * (longueur + largeur);

  @override
  String decrire() => 'Rectangle $longueur x $largeur';
}

class Triangle extends Forme {
  double base;
  double hauteur;
  double coteA;
  double coteB;
  double coteC;

  Triangle(this.base, this.hauteur, this.coteA, this.coteB, this.coteC);

  @override
  double aire() => (base * hauteur) / 2;

  @override
  double perimetre() => coteA + coteB + coteC;

  @override
  String decrire() => 'Triangle (base: $base, hauteur: $hauteur)';
}

void afficherFormes(List<Forme> formes) {
  for (final f in formes) {
    print(f.decrire());
    print('  Aire: ${f.aire()}');
    print('  Périmètre: ${f.perimetre()}');
  }
}

void main() {
  final formes = <Forme>[Cercle(5), Rectangle(4, 6), Triangle(3, 4, 3, 4, 5)];

  afficherFormes(formes);
}
