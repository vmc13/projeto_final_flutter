import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Galeria extends StatelessWidget {
  Galeria({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference = FirebaseFirestore.instance.collection('gallery');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: thisItem.containsKey('image') ? Image.network(
                          '${thisItem['image']}') : Container(),
                    ),
                    onTap: () {},
                  );
                });
          }

          //Show loader
          return Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){Navigator.pushNamed(context, '/library');},
        label: Text('Add img'),
        icon: Icon(Icons.camera),
      ),
    );
  }
}