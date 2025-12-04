import 'dart:io';

/// Calcule le montant des impôts pour un revenu donné.
/// [taux] est un paramètre optionnel (par défaut 15%) et [reduction]
/// indique si une réduction de 5% sur l'impôt doit être appliquée.
double calculerImpots(
  double revenu, {
  double taux = 15,
  bool reduction = false,
}) {
  // calcul de base
  double impot = revenu * taux / 100;

  // réduction de 5% sur le montant de l'impôt
  if (reduction) {
    impot = impot * 0.95;
  }

  return impot;
}

/// Affiche un reçu formaté avec date, revenu brut, montant d'impôts et revenu net.
/// [calculateur] est une fonction de stratégie permettant de tester différents
/// modes de calcul des impôts (bonus).
void afficherRecu({
  required double revenu,
  double taux = 15,
  bool reduction = false,
  double Function(double revenu, {double taux, bool reduction})? calculateur,
}) {
  // Utilise la fonction passée en paramètre si fournie, sinon la fonction par défaut
  final fonctionCalcul = calculateur ?? calculerImpots;

  final impot = fonctionCalcul(revenu, taux: taux, reduction: reduction);
  final net = revenu - impot;

  final maintenant = DateTime.now();
  final dateFormatee =
      '${maintenant.day.toString().padLeft(2, '0')}/${maintenant.month.toString().padLeft(2, '0')}/${maintenant.year} '
      '${maintenant.hour.toString().padLeft(2, '0')}:${maintenant.minute.toString().padLeft(2, '0')}';

  print('================= RECU D\'IMPOTS =================');
  print('Date       : $dateFormatee');
  print('Revenu brut: ${revenu.toStringAsFixed(2)}');
  print('Taux       : ${taux.toStringAsFixed(2)} %');
  print('Réduction  : ${reduction ? "OUI (5%)" : "NON"}');
  print('Montant impôt : ${impot.toStringAsFixed(2)}');
  print('Revenu net    : ${net.toStringAsFixed(2)}');
  print('=================================================');
}

void main() {
  print('=== Calculateur d\'impôts ===');

  stdout.write('Entrez votre revenu : ');
  final entreeRevenu = stdin.readLineSync();

  if (entreeRevenu == null || entreeRevenu.isEmpty) {
    print('Revenu invalide.');
    return;
  }

  final revenu = double.tryParse(entreeRevenu.replaceAll(',', '.'));
  if (revenu == null) {
    print('Revenu invalide (format numérique incorrect).');
    return;
  }

  stdout.write('Avez-vous droit à une réduction ? (o/n) : ');
  final entreeReduction = stdin.readLineSync();
  final reduction =
      entreeReduction != null && entreeReduction.toLowerCase().startsWith('o');

  // Ici on utilise la fonction de calcul par défaut (calculerImpots)
  afficherRecu(revenu: revenu, taux: 15, reduction: reduction);
}
