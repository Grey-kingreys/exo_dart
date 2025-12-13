abstract class Paiement {
  double montant;
  DateTime date;

  Paiement(this.montant) : date = DateTime.now();

  void effectuerPaiement();
  String genererRecu();
}

class PaiementCarte extends Paiement {
  String numeroCarte;
  String banque;

  PaiementCarte(double montant, this.numeroCarte, this.banque) : super(montant);

  @override
  void effectuerPaiement() {
    print('Paiement par carte de ${montant.toStringAsFixed(2)} € via $banque.');
  }

  @override
  String genererRecu() =>
      'Reçu carte - Montant: ${montant.toStringAsFixed(2)} €, Banque: $banque, Date: $date';
}

class PaiementMobile extends Paiement {
  String numeroTelephone;
  String operateur;

  PaiementMobile(double montant, this.numeroTelephone, this.operateur)
    : super(montant);

  @override
  void effectuerPaiement() {
    print(
      'Paiement mobile de ${montant.toStringAsFixed(2)} € via $operateur ($numeroTelephone).',
    );
  }

  @override
  String genererRecu() =>
      'Reçu mobile - Montant: ${montant.toStringAsFixed(2)} €, Opérateur: $operateur, Tel: $numeroTelephone, Date: $date';
}

class PaiementEspece extends Paiement {
  String pointCollecte;

  PaiementEspece(double montant, this.pointCollecte) : super(montant);

  @override
  void effectuerPaiement() {
    print(
      'Paiement en espèces de ${montant.toStringAsFixed(2)} € au point $pointCollecte.',
    );
  }

  @override
  String genererRecu() =>
      'Reçu espèces - Montant: ${montant.toStringAsFixed(2)} €, Point: $pointCollecte, Date: $date';
}

void main() {
  final paiements = <Paiement>[
    PaiementCarte(50.0, '1234-****-****-5678', 'BNP'),
    PaiementMobile(20.0, '+33600000000', 'Orange'),
    PaiementEspece(15.5, 'Boutique Paris'),
  ];

  for (final p in paiements) {
    p.effectuerPaiement();
    print(p.genererRecu());
  }
}
