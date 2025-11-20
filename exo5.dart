// Constantes pour l'analyse
const List<String> MOTS_INTERDITS = ['erreur', 'interdit', 'confidentiel'];
const bool SENS_MODE_STRICT = true;

void main() {
  print("═" * 60);
  print("        ANALYSEUR DE TEXTE SIMPLIFIÉ");
  print("═" * 60);
  print("");

  // Texte à analyser
  String texte = """
  Ce document contient des informations importantes sur le projet.
  Nous devons faire attention aux erreurs potentielles.
  Les données confidentielles doivent être protégées.
  Ce rapport est finalisé et prêt pour la présentation.
  """;

  print("📄 TEXTE À ANALYSER :");
  print("─" * 40);
  print(texte.trim());
  print("");
  print("═" * 60);

  // Analyse du texte
  print("🔍 ANALYSE EN COURS...");
  print("");

  // Comptage des caractères (en excluant les espaces)
  int nbCaracteres =
      texte.replaceAll(' ', '').length - texte.split('\n').length + 1;

  // Comptage des mots
  List<String> mots = texte
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .split(RegExp(r'\s+'));
  mots.removeWhere((mot) => mot.isEmpty);
  int nbMots = mots.length;

  // Comptage des phrases (détectées par les points)
  List<String> phrases = texte.split(RegExp(r'[.!?]+'));
  phrases.removeWhere((phrase) => phrase.trim().isEmpty);
  int nbPhrases = phrases.length;

  // Détection des mots interdits
  List<String> motsInterditsTrouves = [];
  String texteMinuscule = texte.toLowerCase();

  for (String motInterdit in MOTS_INTERDITS) {
    if (texteMinuscule.contains(motInterdit)) {
      motsInterditsTrouves.add(motInterdit);
    }
  }

  // Mode strict : vérification avant de continuer
  if (SENS_MODE_STRICT && motsInterditsTrouves.isNotEmpty) {
    print("🚫 MODE STRICT ACTIVÉ !");
    print("⚠️  ERREUR : Mots interdits détectés !");
    print("📋 Mots problématiques : ${motsInterditsTrouves.join(', ')}");
    print("");
    print("❌ EXÉCUTION BLOQUÉE - Veuillez corriger le texte");
    print("═" * 60);
    return; // Arrêt du programme
  }

  // Affichage du rapport d'analyse
  print("📊 RAPPORT D'ANALYSE :");
  print("─" * 35);
  print("• Nombre de caractères : $nbCaracteres");
  print("• Nombre de mots : $nbMots");
  print("• Nombre de phrases : $nbPhrases");
  print("");

  // Analyse des mots interdits
  if (motsInterditsTrouves.isEmpty) {
    print("✅ Aucun mot interdit détecté");
    print("🎉 Le texte est conforme aux règles");
  } else {
    print("⚠️  Mots interdits détectés : ${motsInterditsTrouves.length}");
    for (String mot in motsInterditsTrouves) {
      print("   • $mot");
    }
  }

  print("");

  // Statistiques supplémentaires
  print("📈 STATISTIQUES DÉTAILLÉES :");
  print("─" * 40);

  // Longueur moyenne des mots
  double longueurMoyenneMots = nbMots > 0
      ? mots.fold(0, (sum, mot) => sum + mot.length) / nbMots
      : 0;
  print(
    "• Longueur moyenne des mots : ${longueurMoyenneMots.toStringAsFixed(1)} caractères",
  );

  // Longueur moyenne des phrases
  double longueurMoyennePhrases = nbPhrases > 0
      ? phrases.fold(0, (sum, phrase) => sum + phrase.trim().length) / nbPhrases
      : 0;
  print(
    "• Longueur moyenne des phrases : ${longueurMoyennePhrases.toStringAsFixed(1)} caractères",
  );

  // Densité de mots interdits
  double densiteMotsInterdits = nbMots > 0
      ? (motsInterditsTrouves.length / nbMots) * 100
      : 0;
  print(
    "• Densité de mots interdits : ${densiteMotsInterdits.toStringAsFixed(1)}%",
  );

  print("");

  // Analyse de qualité
  print("🎯 ANALYSE DE QUALITÉ :");
  print("─" * 35);

  // Évaluation de la complexité
  String complexite = "";
  if (nbMots < 20) {
    complexite = "Simple";
  } else if (nbMots < 50) {
    complexite = "Modérée";
  } else {
    complexite = "Complexe";
  }
  print("• Complexité du texte : $complexite");

  // Évaluation de la sécurité
  String securite = "";
  String couleurSecurite = "";

  if (motsInterditsTrouves.isEmpty) {
    securite = "Sûre";
    couleurSecurite = "[VERT]";
  } else if (motsInterditsTrouves.length <= 1) {
    securite = "Risquée";
    couleurSecurite = "[ORANGE]";
  } else {
    securite = "Dangereuse";
    couleurSecurite = "[ROUGE]";
  }
  print("• Niveau de sécurité : ${couleurSecurite}$securite");

  // Recommandations
  print("");
  print("💡 RECOMMANDATIONS :");
  print("─" * 30);

  if (motsInterditsTrouves.isNotEmpty) {
    print("• Supprimer ou remplacer les mots interdits");
  }
  if (nbMots > 100) {
    print("• Considérer diviser le texte en sections");
  }
  if (longueurMoyenneMots > 8) {
    print("• Simplifier le vocabulaire pour meilleure lisibilité");
  }
  if (nbPhrases < 3) {
    print("• Ajouter plus de phrases pour clarifier le contenu");
  }

  print("");
  print("═" * 60);
  print("        FIN DE L'ANALYSE");
  print("═" * 60);
}

// Fonction bonus pour analyser un texte personnalisé
void analyserTextePersonnalise(String texte, bool modeStrict) {
  print("\n🔍 ANALYSE PERSONNALISÉE :");
  print("─" * 40);

  // Réutiliser la même logique d'analyse
  List<String> mots = texte
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .split(RegExp(r'\s+'));
  mots.removeWhere((mot) => mot.isEmpty);

  List<String> motsInterditsTrouves = [];
  String texteMinuscule = texte.toLowerCase();

  for (String motInterdit in MOTS_INTERDITS) {
    if (texteMinuscule.contains(motInterdit)) {
      motsInterditsTrouves.add(motInterdit);
    }
  }

  if (modeStrict && motsInterditsTrouves.isNotEmpty) {
    print("🚫 Mode strict : Analyse bloquée");
    return;
  }

  print("• Mots analysés : ${mots.length}");
  print("• Mots interdits : ${motsInterditsTrouves.length}");
  print(
    "• Statut : ${motsInterditsTrouves.isEmpty ? '✅ Valide' : '⚠️ À corriger'}",
  );
}

// Fonction pour nettoyer un texte (supprimer les mots interdits)
String nettoyerTexte(String texte) {
  String texteNettoye = texte;

  for (String motInterdit in MOTS_INTERDITS) {
    texteNettoye = texteNettoye.replaceAll(
      RegExp(motInterdit, caseSensitive: false),
      '[SUPPRIMÉ]',
    );
  }

  return texteNettoye;
}
