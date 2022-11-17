
import 'package:final_project/Controllers/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //BOTTOMNAVIGATIONBAR
    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Equipe',
      style: optionStyle,
    ),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //FIREBASE
  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';

  @override
  void initState() {
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[100],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nome),
              accountEmail: Text(email),
            ),
            ListTile(
              dense: true,
              title: Text('Sair'),
              trailing: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              
              SizedBox(
                height: 150,
                child: Image.asset('images/if_logo.png'),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/contatos'),
                      child: Column(
                        children: [
                          Text('Contatos'),
                          SizedBox(height: 10),
                          Icon(Icons.person)
                        ],
                      )),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/maps'),
                      child: Column(
                        children: [
                          Text('Mapas'),
                          SizedBox(height: 10),
                          Icon(Icons.map_outlined)
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/galeria'),
                      child: Column(
                        children: [
                          Text('Galeria'),
                          SizedBox(height: 10),
                          Icon(Icons.photo_library_outlined)
                        ],
                      )),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/extras'),
                      child: Column(
                        children: [
                          Text('Extras'),
                          SizedBox(height: 10),
                          Icon(Icons.link)
                        ],
                      )),
                ],
              ),
            ],
            
          ),
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[300],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Equipe',
            ),
          ],
          selectedItemColor: Colors.green[50],
          currentIndex: _selectedIndex,
      ),
    );
  }

  getUser() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null){
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }
}