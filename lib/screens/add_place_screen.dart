import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/great_places.dart';

// ignore: use_key_in_widget_constructors
class AddPlacesScreen extends StatefulWidget {
  //const AddPlacesScreen({Key? key}) : super(key: key);
  static const routeName = '/add-place';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    //setState(() {}); Nema potrebe za ovim da ne rendamo cijeli widget
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    const SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            label: const Text('Add Place'),
            icon: const Icon(Icons.add),
            onPressed: _savePlace,
            style: ElevatedButton.styleFrom(
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              primary: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.symmetric(vertical: 0),
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(0)),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
