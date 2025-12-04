List<Map<String, dynamic>> stock = [];

void ajouterProduit({
  required int id,
  required String nom,
  required double prix,
  required int quantite,
  required String categorie,
}) {
  final existe = stock.any((p) => p['id'] == id);
  if (existe) {
    print('Un produit avec l\'id $id existe déjà.');
    return;
  }
  stock.add({
    'id': id,
    'nom': nom,
    'prix': prix,
    'quantite': quantite,
    'categorie': categorie,
  });
}

void supprimerProduitParId(int id) {
  stock.removeWhere((p) => p['id'] == id);
}

void mettreAJourQuantite({required int id, required int nouvelleQuantite}) {
  for (final produit in stock) {
    if (produit['id'] == id) {
      produit['quantite'] = nouvelleQuantite;
      return;
    }
  }
  print('Aucun produit trouvé avec l\'id $id.');
}

void afficherProduitsParCategorie(String categorie) {
  final filtres = stock.where((p) => p['categorie'] == categorie);
  for (final p in filtres) {
    print(
      'id: ${p['id']} | nom: ${p['nom']} | prix: ${p['prix']} | quantite: ${p['quantite']} | categorie: ${p['categorie']}',
    );
  }
}

void afficherTableauStock() {
  print('ID  | Nom           | Prix    | Qté | Catégorie');
  print('----+---------------+---------+-----+-----------');
  for (final p in stock) {
    final id = p['id'].toString().padRight(3);
    final nom = (p['nom'] as String).padRight(13);
    final prix = (p['prix'] as double).toStringAsFixed(2).padLeft(7);
    final qte = p['quantite'].toString().padLeft(3);
    final cat = (p['categorie'] as String).padRight(9);
    print('$id | $nom | $prix | $qte | $cat');
  }
}

double calculerValeurTotaleStock() {
  double total = 0;
  for (final p in stock) {
    total += (p['prix'] as double) * (p['quantite'] as int);
  }
  return total;
}

void main() {
  ajouterProduit(
    id: 1,
    nom: 'Stylo',
    prix: 1.5,
    quantite: 100,
    categorie: 'Bureau',
  );
  ajouterProduit(
    id: 2,
    nom: 'Cahier',
    prix: 3.0,
    quantite: 50,
    categorie: 'Bureau',
  );
  ajouterProduit(
    id: 3,
    nom: 'Clé USB',
    prix: 15.0,
    quantite: 20,
    categorie: 'Informatique',
  );

  mettreAJourQuantite(id: 2, nouvelleQuantite: 80);
  supprimerProduitParId(3);

  afficherTableauStock();
  print('');
  print('Produits de catégorie Bureau :');
  afficherProduitsParCategorie('Bureau');

  final valeurTotale = calculerValeurTotaleStock();
  print('');
  print('Valeur totale du stock : ${valeurTotale.toStringAsFixed(2)}');
}
