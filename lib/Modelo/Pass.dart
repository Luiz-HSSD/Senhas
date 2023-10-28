import 'dart:convert';

import 'token.dart';

class Pass {
  final String nome;
  final String login;
  final String senha;

  const Pass({
    required this.nome,
    required this.login,
    required this.senha,
  });

  static List<Pass> listarPass() {
    List<Pass> lista = [];
    var tk = Token();
    lista = tk.readToken();
    return lista;
  }

  static void gravaPass(List<Map<String, String>> lista) {
    String listaString = jsonEncode(lista);
    var tk = Token();
    tk.writeToken(listaString);
  }
}
