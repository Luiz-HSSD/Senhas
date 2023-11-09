import 'package:flutter/material.dart';
import 'package:senhas/Componentes/checkbox_form_field.dart';
import 'package:senhas/Modelo/gerar_senha.dart';

class FormularioGerarSenha extends StatefulWidget {
  final TextEditingController senha;
  const FormularioGerarSenha(this.senha, {super.key});

  @override
  State<FormularioGerarSenha> createState() => _FormularioGerarSenhaState();
}

class _FormularioGerarSenhaState extends State<FormularioGerarSenha> {
  Map<String, Object> camposFormularioGerarsenha = {};
  GlobalKey<FormState> chaveFormularioGerarsenha = GlobalKey<FormState>();
  void _gerarSenha(BuildContext context) {
    chaveFormularioGerarsenha.currentState!.save();
    var senhagerada = gerarSenha.gerarsenha(
      camposFormularioGerarsenha["caracteres"] as int,
      camposFormularioGerarsenha["maiusculo"] as bool,
      camposFormularioGerarsenha["minusculo"] as bool,
      camposFormularioGerarsenha["numero"] as bool,
      camposFormularioGerarsenha["caracteresEspecias"] as bool,
    );
    widget.senha.text = senhagerada;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 450,
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: chaveFormularioGerarsenha,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Quantidade de caracteres",
                ),
                onSaved: (newValue) =>
                    camposFormularioGerarsenha["caracteres"] =
                        int.parse(newValue!),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
              ),
              CheckboxFormField(
                title: const Text("Maiúsculo"),
                onSaved: (newValue) =>
                    camposFormularioGerarsenha["maiusculo"] = newValue!,
              ),
              CheckboxFormField(
                title: const Text("Minúsculo"),
                onSaved: (newValue) =>
                    camposFormularioGerarsenha["minusculo"] = newValue!,
              ),
              CheckboxFormField(
                title: const Text("Número"),
                onSaved: (newValue) =>
                    camposFormularioGerarsenha["numero"] = newValue!,
              ),
              CheckboxFormField(
                title: const Text("Caracteres Especias"),
                onSaved: (newValue) =>
                    camposFormularioGerarsenha["caracteresEspecias"] =
                        newValue!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      child: const Text(
                        "Sair",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      child: const Text("Gerar Senha"),
                      onPressed: () => _gerarSenha(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
