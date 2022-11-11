
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-5.088981127065633, -42.81137583742514);

  Set<Marker> _marcadores = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};

    Marker marcadoIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088981127065633, -42.81137583742514),
      infoWindow: InfoWindow(title: 'IFPI'),
    );
    Marker marcadoIfpiSul = Marker(
      markerId: MarkerId('IFPI_SUL'),
      position: LatLng(-5.1022787040728135, -42.813025869811),
      infoWindow: InfoWindow(title: 'IFPI-SUL'),
    );

    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadoIfpiSul);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarMarcadores();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.green[150],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
          markers: _marcadores,
        ),
    );
  }
}