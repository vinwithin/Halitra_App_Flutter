import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:halitra/model.dart';
//import 'package:halitra/model.dart';
import 'package:http/http.dart' as http;





 
void main() {
  runApp( Home());
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "HALITRA",
      home: HomePage(),
    );
  }
  
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  var news = [];
  var x = 0;
  // var loading = false;
  Future<List?> fetchData() async {
    final response = await http.get(Uri.parse("https://backend-etfbbmn23a-as.a.run.app/top-headlines-health-news"));
    if (response.statusCode == 200) {
      final data = (jsonDecode(response.body))["articles"];
      for(Map i in data){
        news.add(i);
      } 
      //print(data);
      return data ;
    }
    else{
      return null;
    }
    //  (data as List)
    }
  
 
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      
      home:Scaffold(      
        resizeToAvoidBottomInset: true,

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
                        height: 266,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10),
                              child:   Text("Fitur", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24)), textAlign: TextAlign.left,),
                            ),
                          
                            SizedBox(height: 5,),
                            Column(
                              children: [
                                Container(
                                  height: 71,
                                  width: 222,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(154, 208, 194, 100),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.back_hand_outlined, size: 30,),
                                      Text("Sign Translator", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 17)))
                              
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Container(
                                   height: 71,
                                  width: 222,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(154, 208, 194, 100),
                                     borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.voice_chat, size: 30),
                                      Text("Text to Speech", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 17)),)
                                    ],
                                  ),
                                )
                              ],
                            )          
                        ],),
                        
                      )
                    ],)
                ],
                  ),
                 SizedBox(height: 10,),
                 Padding(padding:  EdgeInsets.all(40), 
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("News", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24)),),
                  ),
                  SizedBox(height: 15,),
                  FutureBuilder<List?>(future: fetchData(),  builder: (context, snapshot) {
                    
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }if(snapshot.hasData){
                      return Container(
                        
                        child: Column(
                          children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                               borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                              ]
                            
                            ),
                            child: Column(
                              children: [
                                 Text(snapshot.data![0]["title"], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13))),
                                 
                              ],
                            ),
                               
                            
                            
                          ),
                          SizedBox(height: 10,),
                          Container(
                             height: 100,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                               borderRadius: BorderRadius.circular(15), 
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                            ),
                              ]
                            ),
                            child: Text(snapshot.data![1]["title"], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13))),
                          ),
                          SizedBox(height: 10,),
                          Container(
                             height: 100,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                               borderRadius: BorderRadius.circular(15), 
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                            ),
                              ]
                            ),
                            child: Text(snapshot.data![2]["title"], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13))),
                          ),
                          SizedBox(height: 10,),
                          Container(
                             height: 100,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white, 
                               borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                            ),
                              ]
                            ),
                            child: Text(snapshot.data![3]["title"], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13))),
                          ),
                          SizedBox(height: 10,),
                          
                          Container(
                              
                               height: 100,
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white, 
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                              ),
                                ]
                              ),
                              
                                child: Text(snapshot.data![4]["title"], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13)))
                                ),
                            
                           
                          ],
                        ),
                          
                        
                        
                      );
                      
                      
            
                     
                    }else{
                      return Text("Gagal mengambil data");
                    }
                    
                  })
                  ],
                 ),
                 
                 )
              
                ],
                ),
          ),
          
              ),
        )
        );
        
  }
}


