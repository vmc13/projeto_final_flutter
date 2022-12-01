import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Extras extends StatefulWidget {
  const Extras({super.key});

  @override
  State<Extras> createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {

final Uri _url = Uri.parse('https://selecao.ifpi.edu.br/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inscreva-se no vestibular!'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                'Vestibular IFPI 2023!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[700]
                ),
                ),
              SizedBox(height: 10),
              SizedBox(
                height: 400,
                child: Image.asset('images/vestibular.png'),
              ),
              Text(
                'Faça sua inscrição no Vestibular do IFPI. São 2.265 vagas em 58 cursos superiores de 17 campi. As inscrições devem ser feitas até 12 de dezembro.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
                  minimumSize: MaterialStateProperty.all(Size(500, 60)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                    )),
                ),
                onPressed: () => _launchUrl(),
                child: Text('🚨 Inscreva-se aqui! 🚨'))
            ],
          ),
        ),
      )
    );
  }

  Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

}
