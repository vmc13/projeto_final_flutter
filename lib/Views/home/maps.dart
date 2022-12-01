import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _center = CameraPosition(
    target: LatLng(-5.088981127065633, -42.81137583742514),
    zoom: 14.4746,
  );

    //GOING TO IFPI
  static final CameraPosition _ifpi = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-5.088981127065633, -42.81137583742514),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);


  _localizacaoAtual() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('Localização' + position.toString());
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_carregarMarcadores();
    // _localizacaoAtual();
    _determinePosition();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
          centerTitle: true,
          backgroundColor: Colors.green[150],
        ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        },
        initialCameraPosition: _ifpi,
      ),
    );
  }

   Future<void> _goToIfpi() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_ifpi));
  }
}

