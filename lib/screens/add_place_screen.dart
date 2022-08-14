import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

// ignore: use_key_in_widget_constructors
class AddPlacesScreen extends StatefulWidget {
  //const AddPlacesScreen({Key? key}) : super(key: key);
  static const routeName = '/add-place';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();

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
                    const ImageInput()
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            label: const Text('Add Place'),
            icon: const Icon(Icons.add),
            onPressed: () {},
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
