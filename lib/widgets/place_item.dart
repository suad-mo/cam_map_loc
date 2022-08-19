import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import '../models/place.dart';
import '../screens/place_detail_screen.dart';

class PlaceItem extends StatelessWidget {
  final Place place;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  PlaceItem(this.place);

  //void _confirmDismiss() {}
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(place.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are You Sure?'),
            content: const Text('Do you remove the item?'),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('No'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<GreatPlaces>(context, listen: false).deletePlace(place.id);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(place.image),
        ),
        title: Text(place.title),
        subtitle: place.location.address == null
            ? const Text('Null')
            : Text(place.location.address!),
        // Text('Subtitle'),
        onTap: () {
          Navigator.of(context).pushNamed(
            PlaceDetailScreen.routeName,
            arguments: place.id,
          );
        },
      ),
    );
  }
}
