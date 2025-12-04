List<Map<String, dynamic>> livres = [
  {
    'titre': 'Livre A',
    'auteur': 'Auteur 1',
    'disponible': true,
    'dateEmprunt': null,
  },
  {
    'titre': 'Livre B',
    'auteur': 'Auteur 2',
    'disponible': true,
    'dateEmprunt': null,
  },
  {
    'titre': 'Livre C',
    'auteur': 'Auteur 1',
    'disponible': false,
    'dateEmprunt': '2025-12-04',
  },
];

void emprunterLivre(String titre) {
  for (final livre in livres) {
    if (livre['titre'] == titre) {
      if (livre['disponible'] == true) {
        livre['disponible'] = false;
        livre['dateEmprunt'] = DateTime.now().toString();
        print('Livre "$titre" emprunté.');
      } else {
        print('Livre "$titre" déjà emprunté.');
      }
      return;
    }
  }
  print('Livre "$titre" introuvable.');
}

void retournerLivre(String titre) {
  for (final livre in livres) {
    if (livre['titre'] == titre) {
      livre['disponible'] = true;
      livre['dateEmprunt'] = DateTime.now().toString();
      print('Livre "$titre" retourné.');
      return;
    }
  }
  print('Livre "$titre" introuvable.');
}

void afficherLivresDisponibles() {
  print('Livres disponibles :');
  for (final livre in livres) {
    if (livre['disponible'] == true) {
      print('- ${livre['titre']} (${livre['auteur']})');
    }
  }
}

List<Map<String, dynamic>> chercherParAuteur(String auteur) {
  return livres.where((l) => l['auteur'] == auteur).toList();
}

void main() {
  afficherLivresDisponibles();
  print('');

  emprunterLivre('Livre A');
  emprunterLivre('Livre C');
  print('');

  afficherLivresDisponibles();
  print('');

  retournerLivre('Livre A');
  print('');

  final livresAuteur1 = chercherParAuteur('Auteur 1');
  print('Livres de Auteur 1 :');
  for (final l in livresAuteur1) {
    print('- ${l['titre']} (disponible: ${l['disponible']})');
  }
}
