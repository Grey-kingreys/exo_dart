import 'dart:async';

Future<void> telechargerFichier(String nom, int secondes) async {
  print('Téléchargement de $nom...');

  // Bonus : barre de progression simulée
  for (int i = 1; i <= secondes; i++) {
    await Future.delayed(const Duration(seconds: 1));
    final pourcentage = ((i / secondes) * 100).round();
    print('[$nom] ### $pourcentage% ###');
  }

  print('$nom téléchargé avec succès.');
}

Future<void> main() async {
  print('Démarrage des téléchargements...');

  final futures = <Future<void>>[
    telechargerFichier('fichier1.pdf', 3),
    telechargerFichier('video.mp4', 5),
    telechargerFichier('image.png', 4),
  ];

  await Future.wait(futures);

  print('Tous les téléchargements sont terminés.');
}
