import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import './map_screen.dart';

// ignore: use_key_in_widget_constructors
class PlaceDetailScreen extends StatelessWidget {
  // const PlaceDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(children: <Widget>[
        // ignore: sized_box_for_whitespace
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            selectedPlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          selectedPlace.location.address!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    initialLocation: selectedPlace.location,
                    isSelecting: false,
                  ),
                ),
              );
            },
            // style: TextButton.styleFrom(
            //   textStyle: TextStyle(color: Theme.of(context).primaryColor),
            // ),
            child: const Text('View on Map')),
      ]),
    );
  }
}
