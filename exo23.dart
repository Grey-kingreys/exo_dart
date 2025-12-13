abstract class Personne {
  String nom;
  String prenom;
  int age;

  Personne(this.nom, this.prenom, this.age);

  void afficherInfos();
}

class Etudiant extends Personne {
  String matricule;
  double moyenne;

  Etudiant(String nom, String prenom, int age, this.matricule, this.moyenne)
    : super(nom, prenom, age);

  @override
  void afficherInfos() {
    print(
      'Étudiant : $prenom $nom, $age ans, matricule: $matricule, moyenne: $moyenne',
    );
  }

  bool estReussi() => moyenne >= 10;
}

class Professeur extends Personne {
  String matiere;
  double salaire;

  Professeur(String nom, String prenom, int age, this.matiere, this.salaire)
    : super(nom, prenom, age);

  @override
  void afficherInfos() {
    print(
      'Professeur : $prenom $nom, $age ans, matière: $matiere, salaire: $salaire',
    );
  }
}

void main() {
  final personnes = <Personne>[
    Etudiant('Dupont', 'Alice', 20, 'E001', 12.5),
    Etudiant('Martin', 'Bob', 19, 'E002', 9.5),
    Professeur('Durand', 'Claire', 45, 'Maths', 2500),
  ];

  for (final p in personnes) {
    p.afficherInfos();
    if (p is Etudiant) {
      print('  Réussi : ${p.estReussi() ? 'Oui' : 'Non'}');
    }
  }
}
