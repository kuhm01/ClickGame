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
      appBar: AppBar(
        title: const Text('업그레이드'),
        centerTitle: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('현재 키누적'),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'w키 누적 : ${keyCountsSum['w']}',
                textAlign: TextAlign.center,
              ),
              Text(
                'a키 누적 : ${keyCountsSum['a']}',
                textAlign: TextAlign.center,
              ),
              Text(
                's키 누적 : ${keyCountsSum['s']}',
                textAlign: TextAlign.center,
              ),
              Text(
                'd키 누적 : ${keyCountsSum['d']}',
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      )),
    );
  }
}
