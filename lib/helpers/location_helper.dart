import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart' as conf;

// ignore: constant_identifier_names
const GOOGLE_API_KEY = conf.apiGoogleKey;

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY'; //&signature=YOUR_SIGNATURE';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    // final url ='https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {
        'latlng': '$lat,$lng',
        'key': GOOGLE_API_KEY,
      },
    );
    final response = await http.get(url);
    //print(response.body.toString());
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
