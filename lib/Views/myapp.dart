import 'package:flutter/material.dart';

import 'cadastro.dart';
import 'home.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
        '/home':(context) => Home()
      },
    );
  }
}