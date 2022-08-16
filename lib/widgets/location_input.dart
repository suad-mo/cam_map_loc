import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

// ignore: use_key_in_widget_constructors
class LocationInput extends StatefulWidget {
  //const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImage = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude!,
      longitude: locData.longitude!,
    );
    setState(() {
      _previewImageUrl = staticMapImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? const Text(
                  'Nio Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              // style:
              //     TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              // style:
              //     TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
