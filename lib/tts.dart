import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 330,
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 92, 93, 0.612),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120)
                      )
                    ),
                    ),
                    Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 85,
                          width: 107,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage("assets/image/halitra.png")),
                          ),
                        ),
                       
                        Text("H A L I T R A", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, letterSpacing: 5, fontWeight: FontWeight.w500, fontSize: 24 )) )
                      ],),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(14),
                       
                        width: 375,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                           color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        
                        child: Column(
                          
                          children: [
                          TextFormField(
                          minLines: 8,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          
                          decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          labelText: 'Enter text',
                          
                          ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.all(10),
                            child:Image.asset("assets/image/speaker.png", width: 40),
                          )
                          
                          ],
                        ),
                        
                      ),
                      
      
                    ]
                    
                )
                ]),
              ]
         ),
    )
        ))
    );

  }
}