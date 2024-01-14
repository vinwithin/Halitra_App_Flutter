import 'package:flutter/material.dart';
import 'package:halitra/home.dart';
import 'package:halitra/sign.dart';
import 'package:halitra/tts.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Tts(),
    Sign()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HALITRA",

      routes: {
        '/home': (context) => Home(),
        '/sign': (context) => Sign(),
        '/tts': (context) => Tts(),
      },
      home: Scaffold(
        
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: 'Sign Translator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.voice_chat),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
