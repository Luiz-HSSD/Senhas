import 'package:flutter/material.dart';
import 'package:senhas/Componentes/formulario_gerar_senha.dart';
import 'package:senhas/Modelo/Pass.dart';

class PaginaCrudSenhas extends StatefulWidget {
  const PaginaCrudSenhas({super.key});

  @override
  State<PaginaCrudSenhas> createState() => _PaginaCrudSenhasState();
}

class _PaginaCrudSenhasState extends State<PaginaCrudSenhas> {
  TextEditingController senha = TextEditingController();
  Map<String, String> camposFormulario = {};
  bool _isObscure = true;
  GlobalKey<FormState> chaveFormulario = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Senha"),
      ),
      body: Form(
        key: chaveFormulario,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: senha,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
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
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return FormularioGerarSenha(senha);
                        },
                      );
                    },
                    child: const Text("Gerar Senha"),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      child: const Text("Salvar"),
                      onPressed: () async {
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
                        List<Pass> lista = await Pass.listarPass();
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
      ),
    );
  }
}
