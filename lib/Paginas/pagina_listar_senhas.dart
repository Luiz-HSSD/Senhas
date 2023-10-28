import 'package:flutter/material.dart';
import 'package:senhas/Componentes/item_senha.dart';
import 'package:senhas/Modelo/Pass.dart';
import 'package:senhas/utils/app_routes.dart';

class PaginaListarSenhas extends StatelessWidget {
  const PaginaListarSenhas({super.key});

  List<Pass> listarSenha() {
    return Pass.listarPass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de senhas'),
      ),
      body: ListView(
        children: listarSenha()
            .map(
              (e) => ItemSenha(e),
            )
            .toList(),
      ),
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
