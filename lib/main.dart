import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
// ignore: unused_import
import './state/states.dart';
import 'page/lobbypage.dart';
import 'page/miningpage.dart';
import 'page/upgradepage.dart';
import 'page/energypage.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Counter',
      debugShowCheckedModeBanner: false, // 중요: debugShowCheckedModeBanner 설정 추가
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Counter'),
        centerTitle: true, // 타이틀을 가운데 정렬
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          LobbyPage(),
          MiningPage(),
          EnergyPage(),
          UpgradePage()
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            child: Text('HOME'),
          ),
          Tab(
            child: Text('MINING'),
          ),
          Tab(
            child: Text('ENERGY'),
          ),
          Tab(
            child: Text('UPGRADE'),
          )
        ],
        controller: controller,
      ),
    );
  }
}
