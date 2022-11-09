import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _psController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  //final _firebaseAuth = FirebaseAuth.instance;

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
              height: 40,
            ),
            //botao para cadastrar usúario.
            ElevatedButton(
              onPressed: () {
                //cadastrar();
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
}