import 'package:flutter/material.dart';
//import 'package:halitra/main.dart';
void main() {
  runApp(Sign());
}

class Sign extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "HALITRA",
      home: SignPage(),
    );
  }
}

class SignPage extends StatefulWidget{
  @override
  _SignPageState createState() => _SignPageState();
}
class _SignPageState extends State<SignPage>{
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