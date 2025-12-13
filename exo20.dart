class Produit {
  int id;
  String nom;
  double prixUnitaire;

  Produit({required this.id, required this.nom, required this.prixUnitaire});
}

class Commande {
  int idCommande;
  List<Produit> produits;
  DateTime date;
  String statut;

  Commande({
    required this.idCommande,
    DateTime? date,
    List<Produit>? produits,
    this.statut = 'En cours',
  }) : date = date ?? DateTime.now(),
       produits = produits ?? [];

  Commande.enCours(this.idCommande)
    : produits = [],
      date = DateTime.now(),
      statut = 'En cours';

  void ajouterProduit(Produit p) {
    produits.add(p);
  }

  void supprimerProduit(int id) {
    produits.removeWhere((p) => p.id == id);
  }

  double calculerTotal() {
    double total = 0;
    for (final p in produits) {
      total += p.prixUnitaire;
    }
    return total;
  }

  void afficherDetails() {
    print('Commande #$idCommande - Statut: $statut');
    print('Date : $date');
    if (produits.isEmpty) {
      print('Aucun produit.');
    } else {
      for (final p in produits) {
        print('- ${p.nom} (${p.prixUnitaire.toStringAsFixed(2)} €)');
      }
      print('Total : ${calculerTotal().toStringAsFixed(2)} €');
    }
  }

  void valider() {
    statut = 'Livrée';
    final dateValidation = DateTime.now();
    print('Commande #$idCommande validée le $dateValidation');
  }
}

void main() {
  final p1 = Produit(id: 1, nom: 'Clavier', prixUnitaire: 30.0);
  final p2 = Produit(id: 2, nom: 'Souris', prixUnitaire: 20.0);
  final p3 = Produit(id: 3, nom: 'Écran', prixUnitaire: 150.0);

  final commande = Commande.enCours(1001);
  commande.ajouterProduit(p1);
  commande.ajouterProduit(p2);
  commande.ajouterProduit(p3);

  commande.afficherDetails();
  commande.valider();
}
