import 'package:flutter/material.dart';
import 'package:senhas/Paginas/pagina_crud_senha.dart';
import 'package:senhas/Paginas/pagina_listar_senhas.dart';

class AppRoutes {
  static final String home = "/";
  static final String paginaCrudSenhas = "/crud-senhas";

  static Map<String, WidgetBuilder> rotas() {
    return {
      home: (context) => const PaginaListarSenhas(),
      paginaCrudSenhas: (context) => const PaginaCrudSenhas(),
    };
  }
}
