import 'package:final_project/Views/home/galeria.dart';
import 'package:flutter/material.dart';

import '../Controllers/cadastro.dart';
import 'home.dart';
import '../Controllers/login.dart';
import 'home/contatos.dart';
import 'home/extras.dart';
import 'home/maps.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.green[50],
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 0
        )
      ),
      debugShowCheckedModeBanner: false,
      title: "Final Project",
      routes: {
        '/':(context) => Login(),
        '/cadastro':(context) => Cadastro(),
        '/home':(context) => Home(),

        '/contatos':(context) => Contatos(),
        '/maps':(context) => Maps(),
        '/galeria':(context) => Galeria(),
        '/extras':(context) => Extras(),
      },
    );
  }
}

class Mapas {
}