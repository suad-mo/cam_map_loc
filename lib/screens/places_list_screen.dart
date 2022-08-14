import 'package:flutter/material.dart';

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
            onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
