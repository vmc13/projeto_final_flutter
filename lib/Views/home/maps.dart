import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Controllers/cadastro.dart';
import 'package:final_project/database/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  List<Marker> allMarkers = [];

  @override
  void initState() {
    _markers = <Marker>[];
    //Load the data soucre
    _dataSource = MapShapeSource.asset(
      'assets/world_map.json',
    );

    super.initState();
  }

  // Get the markers from database to a local collection
  Future<List<Marker>> getMarkers() async {
    var _dbRef = FirebaseFirestore.instance.collection('makers').doc();
    _markers.clear();

    await _dbRef.then(
      (dataSnapShot) async {
        // Access the markers from database
        Map<dynamic, dynamic> mapMarkers = dataSnapShot.value;

        // Get the markers in a local collection
        mapMarkers.forEach(
          (key, value) {
            Marker marker = Marker.fromJson(key, value);
            _markers.add(Marker(
                country: key,
                latitude: double.parse(marker.latitude.toString()),
                longitude: double.parse(marker.longitude.toString())));
          },
        );
      },
    );
    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          //Get the markers as collection and update the Maps
          child: FutureBuilder(
            future: getMarkers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SfMaps(
                  layers: <MapLayer>[
                    MapShapeLayer(
                      source: _dataSource,
                      initialMarkersCount: _markers.length,
                      markerBuilder: (BuildContext context, int index) {
                        return MapMarker(
                          latitude: _markers[index].latitude,
                          longitude: _markers[index].longitude,
                        );
                      },
                    ),
                  ],
                );
              }
              return Text('Loading');
            },
          ),
        ),
      ),
    );
  }
  
}

Future<List<Location>> getLocations() async {
  FirebaseFirestore.instance.collection('usuarios').snapshots().map((snapshot) => snapshot.docs.map((doc) => Usuario.fromJson(doc.data())).toList());
}

loadLocations() async {
    List<Location> locations = [];
    locations = await getLocations; //we store the response in a list
    for (int i = 0; i < locations.length; i++) {
      LatLng latlng = new LatLng(
          double.parse(locations[i].latitude), double.parse(locations[i].longitude));
      this.allMarkers.add(Marker(
            markerId: MarkerId(locations[i].id.toString()),
            position: latlng,
          ));
    }
    setState(() {});
  }