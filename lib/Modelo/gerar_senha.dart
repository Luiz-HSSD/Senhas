import 'dart:math';

class gerarSenha {
  static String gerarsenha(
    int numCaracteres,
    bool maiusculo,
    bool minusculo,
    bool numero,
    bool caractereEspecial,
  ) {
    int count = 0;
    String senha = "";
    String caixaBaixa = "abcdefghijklmnopqrstuvwxyz";
    String caixaAlta = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String especial = "#@";
    if (!maiusculo && !minusculo && !numero && !caractereEspecial) {
      return "";
    }
    do {
      var num = Random.secure().nextInt(5);
      if (num == 1 && minusculo) {
        senha += caixaBaixa[Random.secure().nextInt(26)];
        count++;
      }
      if (num == 2 && maiusculo) {
        senha += caixaAlta[Random.secure().nextInt(26)];
        count++;
      }
      if (num == 3 && numero) {
        senha += Random.secure().nextInt(10).toString();
        count++;
      }
      if (num == 4 && caractereEspecial) {
        senha += especial[Random.secure().nextInt(2)];
        ;
        count++;
      }
    } while (count < numCaracteres);
    return senha;
  }
}
