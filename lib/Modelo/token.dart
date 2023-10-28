import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:senhas/Modelo/Pass.dart';

class Token {
  static const String _keytoken = 'God@mazingGrac3';
  static final String _caminho =
      '${Directory.current.absolute.path}\\token.txt';
  String writeToken(String lista) {
    final jwt = JWT(
      {
        'Lista': lista,
      },
      issuer: 'https://luiz-dev,com.br',
    );

    var token = jwt.sign(SecretKey(_keytoken));
    var arquivo = File(_caminho);
    arquivo.writeAsStringSync(token);

    print('Signed token: $token\n');
    return token;
  }

  List<Pass> readToken() {
    if (!File(_caminho).existsSync()) {
      writeToken("[]");
    }
    var arquivo = File(_caminho);
    String token = arquivo.readAsStringSync();
    var jwt = JWT.decode(token);
    var lt = jsonDecode(jwt.payload['Lista']);
    var resp = (lt as List<dynamic>)
        .map(
          (e) => Pass(
            nome: e["nome"]!,
            login: e["login"]!,
            senha: e["senha"]!,
          ),
        )
        .toList();
    return resp;
  }
}
