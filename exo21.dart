class Vehicule {
  String marque;
  String modele;
  double vitesse;

  Vehicule({required this.marque, required this.modele, this.vitesse = 0});

  void afficherInfos() {
    print('Véhicule $marque $modele - Vitesse: $vitesse km/h');
  }

  void demarrer() {
    print('Le véhicule $marque $modele démarre.');
  }
}

class Voiture extends Vehicule {
  int nombrePortes;

  Voiture({
    required String marque,
    required String modele,
    this.nombrePortes = 4,
    double vitesse = 0,
  }) : super(marque: marque, modele: modele, vitesse: vitesse);

  @override
  void afficherInfos() {
    print(
      'Voiture $marque $modele - $nombrePortes portes - Vitesse: $vitesse km/h',
    );
  }

  @override
  void demarrer() {
    print('La voiture $marque $modele démarre en douceur.');
  }
}

class Moto extends Vehicule {
  String typeGuidon;

  Moto({
    required String marque,
    required String modele,
    required this.typeGuidon,
    double vitesse = 0,
  }) : super(marque: marque, modele: modele, vitesse: vitesse);

  @override
  void afficherInfos() {
    print(
      'Moto $marque $modele - Guidon: $typeGuidon - Vitesse: $vitesse km/h',
    );
  }

  @override
  void demarrer() {
    print('La moto $marque $modele démarre avec un vrombissement.');
  }
}

void testerVehicules(List<Vehicule> liste) {
  for (final v in liste) {
    v.afficherInfos();
    v.demarrer();
  }
}

void main() {
  final v1 = Voiture(
    marque: 'Peugeot',
    modele: '208',
    nombrePortes: 5,
    vitesse: 90,
  );
  final v2 = Moto(
    marque: 'Yamaha',
    modele: 'MT-07',
    typeGuidon: 'Sport',
    vitesse: 110,
  );

  testerVehicules([v1, v2]);
}
