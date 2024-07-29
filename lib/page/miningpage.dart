import 'package:flutter/material.dart';
// ignore: unused_import, unnecessary_import
import 'package:flutter/services.dart';
import '../state/states.dart';

// ignore: use_key_in_widget_constructors
class MiningPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MiningPageState createState() => _MiningPageState();
}

class _MiningPageState extends State<MiningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('Mining Page'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'w키 누적 횟수 : ${keyCountsSum['w']}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'a키 누적 횟수 : ${keyCountsSum['a']}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    's키 누적 횟수 : ${keyCountsSum['s']}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'd키 누적 횟수 : ${keyCountsSum['d']}',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
