import 'dart:io';

void main() {
    double usdToGnf =8700;
    double eurToGnf = 9200;


    print("Entrez votre somme d'argent : ");
    double? montant = double.parse(stdin.readLineSync()!);

    print("Entrez une devices de votre argent a echanger entre (USD, GNF, EUR) : ");
    String from = stdin.readLineSync()!.toUpperCase();

    print("Entrez une devices dans la laquelle vous voulez echanger votre argent entre (USD, GNF, EUR) : ");
    String to = stdin.readLineSync()!.toUpperCase();

    double resultat = 0;
    double taux = 0;

    if((from == "GNF" || from == "USD" || from == "EUR") && (to == "GNF" || to == "USD" || to == "EUR")){
        if(from == "USD" && to == "GNF") {
            taux = usdToGnf;
            resultat = montant * taux;
        } else if(from == "GNF" && to == "USD") {
            taux = usdToGnf;
            resultat = montant / taux;
        } else if(from == "EUR" && to == "GNF") {
            taux = eurToGnf;
            resultat = montant * taux;
        } else if(from == "GNF" && to == "EUR") {
            taux = eurToGnf;
            resultat = montant / taux;
        } else {
            print("Conversion non supportée");
            print(from);
            print(to);
            return; // On arrête l'exécution si la conversion n'est pas supportée
        }

        print("$montant $from = ${resultat.toStringAsFixed(2)} $to (taux: $taux)");
    }

}