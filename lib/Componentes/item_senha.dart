import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senhas/Modelo/Pass.dart';
import 'package:senhas/utils/app_routes.dart';

class ItemSenha extends StatelessWidget {
  final Pass senha;
  const ItemSenha(this.senha, {super.key});

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
      subtitle: SizedBox(
        width: 300,
        child: Row(
          children: [
            Text("Login: ${senha.login}"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: senha.login));
              },
              icon: const Icon(Icons.arrow_upward),
            ),
          ],
        ),
      ),
      trailing: SizedBox(
        width: 175,
        child: Row(
          children: [
            const Text("Senha: ***"),
            IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: senha.senha));
              },
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_upward),
            ),
          ],
        ),
      ),
    );
  }
}
