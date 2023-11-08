import 'package:flutter/material.dart';
import 'package:senhas/Componentes/item_senha.dart';
import 'package:senhas/Modelo/Pass.dart';
import 'package:senhas/utils/app_routes.dart';

class PaginaListarSenhas extends StatelessWidget {
  const PaginaListarSenhas({super.key});

  Future<List<Pass>> listarSenha() async {
    return await Pass.listarPass();
  }

  @override
  Widget build(BuildContext context) {
    var senhas = FutureBuilder(
      builder: (BuildContext ctx, AsyncSnapshot<List<Pass>> snapshot) {
        return ListView(
          children: snapshot.data != null
              ? snapshot.data!
                  .map(
                    (e) => ItemSenha(e),
                  )
                  .toList()
              : [
                  const Text("vazio"),
                ],
        );
      },
      future: listarSenha(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de senhas'),
      ),
      body: senhas,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.paginaCrudSenhas);
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
