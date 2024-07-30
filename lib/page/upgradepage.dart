import 'package:flutter/material.dart';
// ignore: unused_import, unnecessary_import
import 'package:flutter/services.dart';
import '../state/states.dart';

// ignore: use_key_in_widget_constructors
class UpgradePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UpgradePageState createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Center(
          child: Text('Upgrade Page'),
        ),
      ),
    );
  }
}
