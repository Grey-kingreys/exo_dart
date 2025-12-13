class Voiture {
  String marque;
  String modele;
  int annee;
  double kilometrage;
  bool enMarche;

  Voiture({
    required this.marque,
    required this.modele,
    required this.annee,
    required this.kilometrage,
    this.enMarche = false,
  });

  void demarrer() {
    enMarche = true;
    print('$marque $modele démarre.');
  }

  void arreter() {
    enMarche = false;
    print('$marque $modele s\'arrête.');
  }

  int age() {
    final now = DateTime.now().year;
    return now - annee;
  }

  void afficherInfos() {
    print('Voiture : $marque $modele');
    print('Année : $annee (âge: ${age()} ans)');
    print('Kilométrage : $kilometrage km');
    print('En marche : ${enMarche ? 'Oui' : 'Non'}');
    print('---------------------------');
  }
}

void main() {
  final v1 = Voiture(
    marque: 'Toyota',
    modele: 'Corolla',
    annee: 2018,
    kilometrage: 55000,
  );
  final v2 = Voiture(
    marque: 'Renault',
    modele: 'Clio',
    annee: 2012,
    kilometrage: 120000,
  );
  final v3 = Voiture(
    marque: 'Tesla',
    modele: 'Model 3',
    annee: 2021,
    kilometrage: 20000,
  );

  v1.demarrer();
  v2.arreter();

  v1.afficherInfos();
  v2.afficherInfos();
  v3.afficherInfos();
}
