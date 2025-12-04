Set<String> utilisateursActifs = {};
Set<String> utilisateursUniquesJour = {};

void connecterUtilisateur(String id) {
  utilisateursActifs.add(id);
  utilisateursUniquesJour.add(id);
}

void deconnecterUtilisateur(String id) {
  utilisateursActifs.remove(id);
}

void afficherNombreActifs() {
  print('Utilisateurs actifs : ${utilisateursActifs.length}');
}

Set<String> nouveauxUtilisateurs(Set<String> jour1, Set<String> jour2) {
  final res = <String>{};
  for (final id in jour2) {
    if (!jour1.contains(id)) {
      res.add(id);
    }
  }
  return res;
}

void main() {
  connecterUtilisateur('user1');
  connecterUtilisateur('user2');
  connecterUtilisateur('user3');
  afficherNombreActifs();

  deconnecterUtilisateur('user2');
  afficherNombreActifs();

  connecterUtilisateur('user4');
  afficherNombreActifs();

  print('');
  print(
    'Total d\'utilisateurs uniques du jour : ${utilisateursUniquesJour.length}',
  );

  final jour1 = {'user1', 'user2', 'user3'};
  final jour2 = {'user2', 'user3', 'user4', 'user5'};
  final nouveaux = nouveauxUtilisateurs(jour1, jour2);
  print('Nouveaux utilisateurs du second jour : $nouveaux');
}
