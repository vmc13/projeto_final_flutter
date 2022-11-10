
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cadastro.dart';
import '../Views/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user==null) {
        print('Você não tem um usuário logado!');
      } else {
        print('Você tem um usuário logado!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Project'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
      //        Text('Final Project',
      //        style: TextStyle(
      //          color: Colors.green,
      //          fontSize: 35,
      //         fontWeight: FontWeight.w600
      //        ),),
              Container(
                height: 170,
                child: Image.asset('images/if_logo.png'),
              ),
              SizedBox(
                height: 55,
              ),
              TextField(
                controller: _emailController,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    prefixIcon: Icon(Icons.person_rounded),
                    hintText: "Digite E-mail")
                    ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: _showPassword == false ? true : false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Digite Senha',
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                      child: Icon( _showPassword == false ? Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
              ),
            ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              ElevatedButton(
                child: Text('Entrar'),
                onPressed: () {    
                  login();         
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(130, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
              ElevatedButton(
                child: Text('Criar conta'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cadastro())
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(130, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
            ],
          ),]
        ),
      )
    ),
  );}

  login() async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text);
        if(userCredential != null){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
              ) 
            );
        }
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Usuário não encontrado"),
          backgroundColor: Colors.redAccent,
        ),);
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sua senha incorreta"),
          backgroundColor: Colors.redAccent,
        ),
        );
      }
    }
  }
}