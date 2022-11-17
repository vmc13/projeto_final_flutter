import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Controllers/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Views/home.dart';
import '../database/usuarios.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  // CONTROLLERS
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _psController = TextEditingController();
  final _phoneController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  // CONEXÕES COM O FIREBASE
  final _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // MÉTODO PARA SALVAR DADOS
  Future<void> _saveNome(String valor) async {

   await _firestore.collection('nomes').add({
      'valor': valor,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('images/if_logo.png'),
              ),
              SizedBox(
              height: 40,
            ),
            //classe para incluir o email
            TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('Nome'),
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.account_box_outlined))),
            SizedBox(
              height: 10,),
            TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('E-mail'),
                    hintText: 'Digite seu e-mail',
                    prefixIcon: Icon(Icons.email))),
              SizedBox(
              height: 10,),
            TextFormField(
                controller: _psController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('Senha'), 
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(Icons.key_off))),
              SizedBox(
              height: 10,),
            TextFormField(
                controller: _latitudeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('Latitude'),
                    hintText: 'Digite sua latitude',
                    prefixIcon: Icon(Icons.location_pin))),
              SizedBox(
              height: 10,),
            TextFormField(
                controller: _longitudeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('Longitude'),
                    hintText: 'Digite sua longitude',
                    prefixIcon: Icon(Icons.location_pin))),
              SizedBox(
              height: 10,),
            TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                    label: Text('Telefone'),
                    hintText: 'Digite seu telefone',
                    prefixIcon: Icon(Icons.phone))),
            SizedBox(
              height: 40,
            ),
            //botao para cadastrar usúario.
            ElevatedButton(
              onPressed: () {
                cadastrar();
                final name = _nomeController.text;

                createUser(name: name);
              },
              child: Text('CADASTRAR'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(150, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



Future createUser({required String name}) async {
  // Reference to document
  final docUser = FirebaseFirestore.instance.collection('usuarios').doc();

  final user = Usuario (
    id: docUser.id,
    nome: name,
    email: _emailController.text,
    latitude: _latitudeController.text,
    longitude: _longitudeController.text,
    telefone: _phoneController.text
  );
  final json = user.toJson();
  // Create document and write data to firebase
  await docUser.set(json);
}


 cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _psController.text);
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mas forte'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('este e-mail ja foi cadastrado, tente outro e-mail'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}