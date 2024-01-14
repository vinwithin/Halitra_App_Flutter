import 'package:flutter/material.dart';
//import 'package:halitra/main.dart';
void main() {
  runApp(Tts());
}

class Tts extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "HALITRA",
      home: TtsPage(),
    );
  }
}

class TtsPage extends StatefulWidget{
  @override
  _ttsPageState createState() => _ttsPageState();
}
class _ttsPageState extends State<TtsPage>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: SingleChildScrollView(

        )),
      ),
    );
  }
}