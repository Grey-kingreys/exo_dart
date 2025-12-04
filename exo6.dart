import 'dart:io';

List<Map<String, String>> contacts = [];

void ajouterContact({
  required String nom,
  required String email,
  required String telephone,
}) {
  final existeDeja = contacts.any((contact) => contact['nom'] == nom);

  if (existeDeja) {
    print('Erreur : un contact avec le nom "$nom" existe déjà.');
    return;
  }

  contacts.add({'nom': nom, 'email': email, 'telephone': telephone});

  print('Contact "$nom" ajouté avec succès.');
}

void afficherContacts() {
  if (contacts.isEmpty) {
    print('Aucun contact dans la liste.');
    return;
  }

  print('--- Liste des contacts ---');
  for (final contact in contacts) {
    print('Nom      : ${contact['nom']}');
    print('Email    : ${contact['email']}');
    print('Téléphone: ${contact['telephone']}');
    print('--------------------------');
  }
}

void rechercherContact({required String nom}) {
  final contact = contacts.firstWhere((c) => c['nom'] == nom, orElse: () => {});

  if (contact.isEmpty) {
    print('Aucun contact trouvé pour le nom "$nom".');
    return;
  }

  print('Contact trouvé :');
  print('Nom      : ${contact['nom']}');
  print('Email    : ${contact['email']}');
  print('Téléphone: ${contact['telephone']}');
}

void supprimerContact({required String nom}) {
  final index = contacts.indexWhere((c) => c['nom'] == nom);

  if (index == -1) {
    print('Impossible de supprimer : aucun contact avec le nom "$nom".');
    return;
  }

  contacts.removeAt(index);
  print('Contact "$nom" supprimé avec succès.');
}

void main() {
  while (true) {
    print('');
    print('===== Gestionnaire de contacts =====');
    print('1. Ajouter un contact');
    print('2. Afficher tous les contacts');
    print('3. Rechercher un contact');
    print('4. Supprimer un contact');
    print('5. Quitter');
    stdout.write('Choix : ');

    final choix = stdin.readLineSync();
    print('');

    switch (choix) {
      case '1':
        stdout.write('Nom       : ');
        final nom = stdin.readLineSync() ?? '';

        stdout.write('Email     : ');
        final email = stdin.readLineSync() ?? '';

        stdout.write('Téléphone : ');
        final telephone = stdin.readLineSync() ?? '';

        ajouterContact(nom: nom, email: email, telephone: telephone);
        break;

      case '2':
        afficherContacts();
        break;

      case '3':
        stdout.write('Nom à rechercher : ');
        final nom = stdin.readLineSync() ?? '';
        rechercherContact(nom: nom);
        break;

      case '4':
        stdout.write('Nom à supprimer : ');
        final nom = stdin.readLineSync() ?? '';
        supprimerContact(nom: nom);
        break;

      case '5':
        print('Au revoir !');
        return;

      default:
        print('Choix invalide, veuillez réessayer.');
    }
  }
}
