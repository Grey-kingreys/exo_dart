import 'dart:io';

void main() {
  String password;

  bool hasDigit = false;
  bool hasUpper = false;
  bool hasSpecial = false;

  //Demander a l'utilisateur de saisir le mot de passe

  print("Entrez votre mot de passe : ");
  password = stdin.readLineSync()!;

  bool hasMinLength = password.length >= 8;


  //Boucle pour verifier si les caractere respecte les exigences
  
  for (int i = 0; i < password.length; i++) {
    String char = password[i];

    if (RegExp(r'[0-9]').hasMatch(char)) {
      hasDigit = true;
    }
    if (RegExp(r'[A-Z]').hasMatch(char)) {
      hasUpper = true;
    }
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(char)) {
      hasSpecial = true;
    }
  }

  // Calcul du score de sécurité sur 10
  int score = 0;
  if (hasMinLength) score += 3;
  if (hasDigit) score += 2;
  if (hasUpper) score += 2;
  if (hasSpecial) score += 3;

  // Détermination de la mention
  String mention;
  String color;

  if (score <= 3) {
    mention = "faible";
    color = "[ROUGE]";
  } else if (score <= 6) {
    mention = "moyen";
    color = "[ORANGE]";
  } else {
    mention = "fort";
    color = "[VERT]";
  }

  print("\n${color}Score de sécurité : $score/10");
  print("${color}Mention : $mention");

  print("\nDétails des critères :");
  print("• Longueur ≥ 8 caractères : ${hasMinLength ? '✓' : '✗'}");
  print("• Contient au moins un chiffre : ${hasDigit ? '✓' : '✗'}");
  print("• Contient au moins une majuscule : ${hasUpper ? '✓' : '✗'}");
  print("• Contient un caractère spécial : ${hasSpecial ? '✓' : '✗'}");
}
