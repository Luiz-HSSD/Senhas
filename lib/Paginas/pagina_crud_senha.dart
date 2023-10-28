import 'package:flutter/material.dart';
import 'package:senhas/Modelo/Pass.dart';

class PaginaCrudSenhas extends StatefulWidget {
  const PaginaCrudSenhas({super.key});

  @override
  State<PaginaCrudSenhas> createState() => _PaginaCrudSenhasState();
}

class _PaginaCrudSenhasState extends State<PaginaCrudSenhas> {
  Map<String, String> camposFormulario = {};
  GlobalKey<FormState> chaveFormulario = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdicionarSenha"),
      ),
      body: Form(
        key: chaveFormulario,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
              validator: (valorCampo) {
                var valor = valorCampo ?? "";
                if (valor.trim().isEmpty) {
                  return "Campo Nome não prenciodo!";
                }
                return null;
              },
              onSaved: (novoValor) =>
                  camposFormulario["nome"] = novoValor ?? "",
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Login",
              ),
              validator: (valorCampo) {
                var valor = valorCampo ?? "";
                if (valor.trim().isEmpty) {
                  return "Campo Login não prenciodo!";
                }
                return null;
              },
              onSaved: (novoValor) =>
                  camposFormulario["login"] = novoValor ?? "",
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
              validator: (valorCampo) {
                var valor = valorCampo ?? "";
                if (valor.trim().isEmpty) {
                  return "Campo Senha não prenciodo!";
                }
                return null;
              },
              onSaved: (novoValor) =>
                  camposFormulario["senha"] = novoValor ?? "",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      bool valido =
                          chaveFormulario.currentState?.validate() ?? false;
                      if (!valido) {
                        return;
                      }
                      chaveFormulario.currentState?.save();
                      var senhaGravar = Pass(
                        nome: camposFormulario["nome"]!,
                        login: camposFormulario["login"]!,
                        senha: camposFormulario["senha"]!,
                      );
                      List<Pass> lista = Pass.listarPass();
                      lista.add(senhaGravar);
                      Pass.gravaPass(lista
                          .map(
                            (e) => {
                              "nome": e.nome,
                              "login": e.login,
                              "senha": e.senha,
                            },
                          )
                          .toList());
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
