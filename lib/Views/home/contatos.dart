import 'package:flutter/material.dart';

const List<String> list = <String>['Contato 1', 'Contato 2', 'Contato 3', 'Contato 4'];

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20,10, 20),
                      child: Text('SELECIONE O CONTATO',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
                    ),
                  SizedBox(height: 20),
                  ContatosDropdown(),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Listar\ncontato',
                      textAlign: TextAlign.center,
                    ),),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Cadastrar\ncontato',
                      textAlign: TextAlign.center,
                      ),),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Alterar\ncontato',
                      textAlign: TextAlign.center,
                      ),),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Excluir\ncontato',
                      textAlign: TextAlign.center,
                      ),),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('DADOS DO CONTATO',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
              ],),
              Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text('Nome:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
                      SizedBox(height: 5),
                      Text('Email:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
                      SizedBox(height: 5),
                      Text('Local:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//DROPDOWN

class ContatosDropdown extends StatefulWidget {
  const ContatosDropdown({super.key});

  @override
  State<ContatosDropdown> createState() => _ContatosDropdownState();
}

class _ContatosDropdownState extends State<ContatosDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}