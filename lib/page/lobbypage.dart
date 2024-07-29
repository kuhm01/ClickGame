import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import '../state/states.dart';

// ignore: use_key_in_widget_constructors
class LobbyPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  // 버튼입력을 처리하는 메서드
  void processInput(String key) {
    if (keyCounts[key] != null &&
        keyCounts[key]! < (resetCount + 1) * upgradeRateWASDclickableCount &&
        sumKeyCounts() < clickableCount) {
      setState(() {
        keyCounts[key] = keyCounts[key]! + 1;
      });
      // ignore: avoid_print
      print("$key : ${keyCounts[key]}");
    } else {
      setState(() {
        resetAble = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('경고'),
            content: Text('더 이상 ${key.toUpperCase()} 키를 누를 수 없습니다.'),
            actions: <Widget>[
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  // 환생 버튼을 눌렀을 때 동작하는 메서드
  void resetCounts() {
    if (resetAble) {
      setState(() {
        resetCount += 1;
        clickableCount += upgradeRateclickableCount;
        keyCounts.forEach((key, value) {
          keyCountsSum[key] = keyCountsSum[key]! + keyCounts[key]!;
        });
        keyCounts = {
          'w': 0,
          'a': 0,
          's': 0,
          'd': 0,
        };
        resetAble = false;
      });
      // ignore: avoid_print
      print("환생 : $resetCount");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('환생을 진행할 수 없습니다'),
            actions: <Widget>[
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      body: RawKeyboardListener(
        focusNode: FocusNode(), // 포커스 노드 설정
        // ignore: deprecated_member_use
        onKey: (RawKeyEvent event) {
          // ignore: deprecated_member_use
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press the keys or keyboard buttons to count:'),
              const SizedBox(height: 13),
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
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => processInput('w'),
                    child: const Text('w'),
                  ),
                  ElevatedButton(
                    onPressed: () => processInput('a'),
                    child: const Text('a'),
                  ),
                  ElevatedButton(
                    onPressed: () => processInput('s'),
                    child: const Text('s'),
                  ),
                  ElevatedButton(
                    onPressed: () => processInput('d'),
                    child: const Text('d'),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: keyCounts.entries.map((entry) {
                  return Text('<${entry.key} : ${entry.value}>');
                }).toList(),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetCounts,
                // ignore: prefer_const_constructors
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.power_settings_new),
                    SizedBox(width: 8),
                    Text('환생'),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '환생 횟수: $resetCount', // 환생 횟수 표시
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '최대 가능 원소 갯수: ${(resetCount + 1) * upgradeRateWASDclickableCount}', // 환생 횟수 표시
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '클릭 횟수: ${sumKeyCounts()} | 클릭 가능 횟수: $clickableCount',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
