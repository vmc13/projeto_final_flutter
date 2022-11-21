// Class that parses the data from database.
class Marker {
  String country;
  late double latitude;
  late double longitude;

  Marker(
      {required this.country, required this.latitude, required this.longitude});

  Marker.fromJson(this.country, Map data) {
    latitude = data['latitude'];
    longitude = data['longitude'];
  }
}