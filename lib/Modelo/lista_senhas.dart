import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pass.dart';
import 'token.dart';

class ListaSenhas with ChangeNotifier {
  Future<List<Pass>> listarPass() async {
    List<Pass> lista = [];
    var tk = Token();
    lista = await tk.readToken();
    return lista;
  }

  void gravaPass(List<Map<String, String>> lista) {
    String listaString = jsonEncode(lista);
    var tk = Token();
    tk.writeToken(listaString);
    notifyListeners();
  }
}
