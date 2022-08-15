import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

// ignore: use_key_in_widget_constructors
class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Got no places yet, start adding some!'),
        ),
        // ignore: prefer_is_empty
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch!
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {
                    // Go to detail page
                  },
                ),
              ),
      ),
    );
  }
}
