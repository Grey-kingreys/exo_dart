class CompteBancaire {
  String _numero;
  String _proprietaire;
  double _solde;

  CompteBancaire(this._numero, this._proprietaire, this._solde);

  String get numero => _numero;

  String get proprietaire => _proprietaire;
  set proprietaire(String value) => _proprietaire = value;

  double get solde => _solde;
  set solde(double value) => _solde = value;

  void deposer(double montant) {
    if (montant <= 0) return;
    _solde += montant;
    print('Dépôt de $montant sur le compte $_numero. Nouveau solde: $_solde');
  }

  void retirer(double montant) {
    if (montant <= 0) return;
    if (montant > _solde) {
      print('Fonds insuffisants sur le compte $_numero.');
      return;
    }
    _solde -= montant;
    print('Retrait de $montant sur le compte $_numero. Nouveau solde: $_solde');
  }

  void afficherSolde() {
    print('Compte $_numero - Propriétaire: $_proprietaire - Solde: $_solde');
  }

  void virement(CompteBancaire vers, double montant) {
    if (montant <= 0) return;
    if (montant > _solde) {
      print('Virement impossible, solde insuffisant sur $_numero.');
      return;
    }
    _solde -= montant;
    vers._solde += montant;
    print('Virement de $montant de $_numero vers ${vers._numero}.');
  }
}

class CompteEpargne extends CompteBancaire {
  double tauxInteret; // ex: 0.02 pour 2%

  CompteEpargne(
    String numero,
    String proprietaire,
    double solde,
    this.tauxInteret,
  ) : super(numero, proprietaire, solde);

  void appliquerInteret() {
    final interet = solde * tauxInteret;
    solde += interet;
    print('Intérêt de $interet appliqué sur le compte épargne $numero.');
  }
}

class CompteCourant extends CompteBancaire {
  double decouvertAutorise;

  CompteCourant(
    String numero,
    String proprietaire,
    double solde,
    this.decouvertAutorise,
  ) : super(numero, proprietaire, solde);

  @override
  void retirer(double montant) {
    if (montant <= 0) return;
    if (solde - montant < -decouvertAutorise) {
      print('Découvert autorisé dépassé pour le compte $numero.');
      return;
    }
    solde -= montant;
    print(
      'Retrait de $montant sur le compte courant $numero. Nouveau solde: $solde',
    );
  }
}

void main() {
  final epargne = CompteEpargne('E001', 'Alice', 1000, 0.03);
  final courant = CompteCourant('C001', 'Bob', 500, 200);

  epargne.deposer(200);
  epargne.appliquerInteret();
  epargne.afficherSolde();

  courant.retirer(600);
  courant.afficherSolde();

  epargne.virement(courant, 300);
  epargne.afficherSolde();
  courant.afficherSolde();
}
