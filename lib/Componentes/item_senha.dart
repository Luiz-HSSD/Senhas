import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senhas/Modelo/Pass.dart';
import 'package:senhas/utils/app_routes.dart';

class ItemSenha extends StatelessWidget {
  final Pass senha;
  const ItemSenha(this.senha, {super.key});
  final double tamanhoIcone = 24;
  final EdgeInsets paddingIcone = const EdgeInsets.all(5.0);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.paginaCrudSenhas,
            arguments: senha,
          );
        },
        child: const Stack(
          children: [
            CircleAvatar(),
            Positioned(
                left: 10,
                top: 7,
                child: Icon(
                  Icons.edit,
                  color: Colors.white60,
                ))
          ],
        ),
      ),
      title: Text(senha.nome),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Login: ${senha.login}"),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: senha.login));
            },
            icon: Icon(
              Icons.copy,
              size: tamanhoIcone,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Senha: ***"),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: senha.senha));
            },
            icon: Icon(Icons.copy, size: tamanhoIcone),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_upward, size: tamanhoIcone),
          ),
        ],
      ),
    );
  }
}
