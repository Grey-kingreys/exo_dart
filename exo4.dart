import 'dart:math';

// Constante pour définir la longueur du code
const int CODE_LENGTH = 6;

void main() {
  print("═" * 50);
  print("    GÉNÉRATEUR DE CODE ALÉATOIRE SÉCURISÉ");
  print("═" * 50);
  print("");

  // Génération du code initial
  String code = genererCode();

  // Affichage du code généré
  print("🔐 Code généré : $code");
  print("📏 Longueur : ${code.length} caractères");

  // Vérification si le code commence par une lettre ou un chiffre
  String premierCaractere = code[0];
  if (RegExp(r'[A-Z]').hasMatch(premierCaractere)) {
    print("🔤 Le code commence par une lettre MAJUSCULE : $premierCaractere");
  } else if (RegExp(r'[a-z]').hasMatch(premierCaractere)) {
    print("🔤 Le code commence par une lettre minuscule : $premierCaractere");
  } else if (RegExp(r'[0-9]').hasMatch(premierCaractere)) {
    print("🔢 Le code commence par un chiffre : $premierCaractere");
  }

  print("");
  print("─" * 40);
  print("CARACTÉRISTIQUES DU CODE :");
  print("─" * 40);

  // Analyse des caractéristiques du code
  int nbMajuscules = 0;
  int nbMinuscules = 0;
  int nbChiffres = 0;

  for (int i = 0; i < code.length; i++) {
    String caractere = code[i];
    if (RegExp(r'[A-Z]').hasMatch(caractere)) {
      nbMajuscules++;
    } else if (RegExp(r'[a-z]').hasMatch(caractere)) {
      nbMinuscules++;
    } else if (RegExp(r'[0-9]').hasMatch(caractere)) {
      nbChiffres++;
    }
  }

  print("• Lettres majuscules : $nbMajuscules");
  print("• Lettres minuscules : $nbMinuscules");
  print("• Chiffres : $nbChiffres");

  // Vérification de la diversité
  if (nbMajuscules > 0 && nbMinuscules > 0 && nbChiffres > 0) {
    print("✅ Code diversifié (contient tous les types)");
  } else {
    print("⚠️  Code peu diversifié");
  }

  print("");
  print("═" * 50);

  // Menu interactif pour régénérer des codes
  print("");
  print("🎮 MENU INTERACTIF");
  print("─" * 25);
  print("1. Générer un nouveau code");
  print("2. Générer 5 codes différents");
  print("3. Quitter");
  print("");

  // Simulation de choix utilisateur (automatisé pour démonstration)
  print("🔄 Génération automatique de 5 codes pour démonstration :");
  print("");

  for (int i = 1; i <= 5; i++) {
    String nouveauCode = genererCode();
    print("Code $i : $nouveauCode");

    // Analyse rapide du type de premier caractère
    String premier = nouveauCode[0];
    String type = "";
    if (RegExp(r'[A-Z]').hasMatch(premier)) {
      type = "(Majuscule)";
    } else if (RegExp(r'[a-z]').hasMatch(premier)) {
      type = "(Minuscule)";
    } else {
      type = "(Chiffre)";
    }
    print("         $type");
    print("");
  }

  print("═" * 50);
  print("    FIN DU PROGRAMME");
  print("═" * 50);
}

// Fonction pour générer un code aléatoire sécurisé
String genererCode() {
  final Random random = Random();
  const String caracteres =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  String code = '';

  for (int i = 0; i < CODE_LENGTH; i++) {
    int index = random.nextInt(caracteres.length);
    code += caracteres[index];
  }

  return code;
}

// Bonus : Fonction pour générer un code avec des critères spécifiques
String genererCodeSecurise() {
  final Random random = Random();
  const String majuscules = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String minuscules = 'abcdefghijklmnopqrstuvwxyz';
  const String chiffres = '0123456789';

  String code = '';

  for (int i = 0; i < CODE_LENGTH; i++) {
    int typeCaractere = random.nextInt(
      3,
    ); // 0: majuscule, 1: minuscule, 2: chiffre

    switch (typeCaractere) {
      case 0:
        code += majuscules[random.nextInt(majuscules.length)];
        break;
      case 1:
        code += minuscules[random.nextInt(minuscules.length)];
        break;
      case 2:
        code += chiffres[random.nextInt(chiffres.length)];
        break;
    }
  }

  return code;
}

// Bonus : Fonction pour vérifier la force d'un code
void verifierForceCode(String code) {
  int score = 0;

  // Longueur
  if (code.length >= 6) score += 2;
  if (code.length >= 8) score += 1;

  // Diversité des caractères
  bool aMajuscules = RegExp(r'[A-Z]').hasMatch(code);
  bool aMinuscules = RegExp(r'[a-z]').hasMatch(code);
  bool aChiffres = RegExp(r'[0-9]').hasMatch(code);

  if (aMajuscules) score += 2;
  if (aMinuscules) score += 2;
  if (aChiffres) score += 2;

  // Évaluation
  String force = "";
  String couleur = "";

  if (score <= 4) {
    force = "Faible";
    couleur = "[ROUGE]";
  } else if (score <= 7) {
    force = "Moyenne";
    couleur = "[ORANGE]";
  } else {
    force = "Forte";
    couleur = "[VERT]";
  }

  print("${couleur}Force du code : $force ($score/9)");
}
