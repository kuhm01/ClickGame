import 'package:flutter/material.dart';
// ignore: unused_import, unnecessary_import
import 'package:flutter/services.dart';
import '../state/states.dart';

// ignore: use_key_in_widget_constructors
class EnergyPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _EnergyPageState createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Center(
          child: Text('Energy Page'),
        ),
      ),
    );
  }
}
