abstract class Employe {
  String nom;
  double salaireBase;
  static int _compteur = 0;

  Employe(this.nom, this.salaireBase) {
    _compteur++;
  }

  double calculerSalaire();

  static int nombreEmployes() => _compteur;
}

class EmployeHoraire extends Employe {
  double heuresTravail;
  double tauxHoraire;

  EmployeHoraire(String nom, this.heuresTravail, this.tauxHoraire)
    : super(nom, 0);

  @override
  double calculerSalaire() => heuresTravail * tauxHoraire;
}

class EmployeCommission extends Employe {
  double ventes;
  double tauxCommission;

  EmployeCommission(String nom, this.ventes, this.tauxCommission)
    : super(nom, 0);

  @override
  double calculerSalaire() => ventes * tauxCommission;
}

void afficherFicheSalaire(Employe e) {
  final salaire = e.calculerSalaire();
  print('Employé : ${e.nom} - Salaire : ${salaire.toStringAsFixed(2)}');
}

void main() {
  final e1 = EmployeHoraire('Alice', 160, 10);
  final e2 = EmployeCommission('Bob', 5000, 0.05);

  afficherFicheSalaire(e1);
  afficherFicheSalaire(e2);

  print('Nombre total d\'employés : ${Employe.nombreEmployes()}');
}
