import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senhas/Modelo/lista_senhas.dart';
import 'package:senhas/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListaSenhas(),
      child: MaterialApp(
        title: 'Gerenciador de senhas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppRoutes.rotas(),
      ),
    );
  }
}
