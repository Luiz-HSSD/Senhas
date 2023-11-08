import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:path_provider/path_provider.dart';
import 'package:senhas/Modelo/Pass.dart';

class Token {
  static const String _keytoken = 'God@mazingGrac3';
  static final String _caminho = '${Platform.pathSeparator}token.txt';
  Future<String> writeToken(String lista) async {
    final jwt = JWT(
      {
        'Lista': lista,
      },
      issuer: 'https://luiz-dev,com.br',
    );

    var token = jwt.sign(SecretKey(_keytoken));
    var caminho = (await getApplicationDocumentsDirectory()).absolute.path;
    var arquivo = File(caminho + _caminho);
    arquivo.writeAsStringSync(token);

    print('Signed token: $token\n');
    return token;
  }

  Future<List<Pass>> readToken() async {
    var caminho = (await getApplicationDocumentsDirectory()).absolute.path;
    if (!File(caminho + _caminho).existsSync()) {
      await writeToken("[]");
    }
    var arquivo = File(caminho + _caminho);
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
