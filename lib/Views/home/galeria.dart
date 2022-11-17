import 'package:flutter/material.dart';

class Galeria extends StatefulWidget {
  const Galeria({super.key});

  @override
  State<Galeria> createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Galeria da turma!'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: 170,
                child: Image.asset('images/if_logo.png'),
              ),
              Container(
                height: 170,
                child: Image.asset('images/if_logo.png'),
              ),
              Container(
                height: 170,
                child: Image.asset('images/if_logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}