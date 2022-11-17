import 'package:final_project/database/usuarios.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Controllers/cadastro.dart';

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Usuario>> (
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData){
            final usuarios = snapshot.data!;

            return ListView(
              children: usuarios.map(buildUsuario).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
    );
  }
}

Widget buildUsuario(Usuario usuario) => ListTile(
  leading: CircleAvatar(child: Image.asset('images/contact_profile.png')),
  title: Text((usuario.nome)),
  subtitle: Text(usuario.telefone),
  tileColor: Colors.green[100],
);

Stream<List<Usuario>> readUsers() => FirebaseFirestore.instance.collection('usuarios').snapshots().map((snapshot) => snapshot.docs.map((doc) => Usuario.fromJson(doc.data())).toList());