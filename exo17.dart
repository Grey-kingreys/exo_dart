class Etudiant {
  String nom;
  String matricule;
  List<double> notes;

  Etudiant({required this.nom, required this.matricule, List<double>? notes})
    : notes = notes ?? [];

  void ajouterNote(double note) {
    notes.add(note);
  }

  double calculerMoyenne() {
    if (notes.isEmpty) return 0;
    double somme = 0;
    for (final n in notes) {
      somme += n;
    }
    return somme / notes.length;
  }

  void afficherBulletin() {
    final moy = calculerMoyenne();
    print('Étudiant : $nom');
    print('Matricule : $matricule');
    print('Moyenne : ${moy.toStringAsFixed(2)}');
    print('---------------------------');
  }

  static Etudiant? meilleurEtudiant(List<Etudiant> liste) {
    if (liste.isEmpty) return null;
    Etudiant meilleur = liste.first;
    for (final e in liste.skip(1)) {
      if (e.calculerMoyenne() > meilleur.calculerMoyenne()) {
        meilleur = e;
      }
    }
    return meilleur;
  }
}

void main() {
  final e1 = Etudiant(nom: 'Alice', matricule: 'A001');
  final e2 = Etudiant(nom: 'Bob', matricule: 'B002');
  final e3 = Etudiant(nom: 'Charlie', matricule: 'C003');

  e1
    ..ajouterNote(12)
    ..ajouterNote(15)
    ..ajouterNote(14);
  e2
    ..ajouterNote(9)
    ..ajouterNote(10)
    ..ajouterNote(8);
  e3
    ..ajouterNote(16)
    ..ajouterNote(17)
    ..ajouterNote(18);

  final etudiants = [e1, e2, e3];

  for (final e in etudiants) {
    e.afficherBulletin();
  }

  final meilleur = Etudiant.meilleurEtudiant(etudiants);
  if (meilleur != null) {
    print(
      'Meilleur étudiant : ${meilleur.nom} avec moyenne ${meilleur.calculerMoyenne().toStringAsFixed(2)}',
    );
  }
}
