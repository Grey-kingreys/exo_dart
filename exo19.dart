class Animal {
  String nom;
  int age;
  String espece;
  static int _compteur = 0;

  Animal({required this.nom, required this.age, required this.espece}) {
    _compteur++;
  }

  void crier() {
    print('$nom fait un bruit.');
  }

  static int nombreAnimauxCrees() => _compteur;
}

class Lion extends Animal {
  Lion({required String nom, required int age})
    : super(nom: nom, age: age, espece: 'Lion');

  @override
  void crier() {
    print('$nom (lion) : Rooaaar!');
  }
}

class Oiseau extends Animal {
  Oiseau({required String nom, required int age})
    : super(nom: nom, age: age, espece: 'Oiseau');

  @override
  void crier() {
    print('$nom (oiseau) : Cui-cui!');
  }
}

class Serpent extends Animal {
  Serpent({required String nom, required int age})
    : super(nom: nom, age: age, espece: 'Serpent');

  @override
  void crier() {
    print('$nom (serpent) : Ssssss!');
  }
}

void main() {
  final animaux = <Animal>[
    Lion(nom: 'Simba', age: 5),
    Oiseau(nom: 'Tweety', age: 2),
    Serpent(nom: 'Kaa', age: 7),
  ];

  for (final a in animaux) {
    a.crier();
  }

  print('Nombre total d\'animaux créés : ${Animal.nombreAnimauxCrees()}');
}
