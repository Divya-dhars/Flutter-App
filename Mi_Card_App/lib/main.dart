import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 157, 77, 149),
            body: SafeArea(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[
                  CircleAvatar(
                    radius:50,
                    backgroundImage:AssetImage('assets/imgme.jpg'),
                  ),
                  Text(
                    'Divya',
                    style:TextStyle(
                      fontFamily:'Pacifico',
                      fontSize:40,
                      color:Colors.white,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  Text(
                    'FLUTTER DEVELOPER',
                    style:TextStyle(
                      fontFamily:'Source Sans Pro',
                      color:Colors.teal.shade100,
                      fontSize:20,
                      letterSpacing:2.5,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:20,
                    width:150,
                    child:Divider(
                      color:Colors.teal.shade100,
                    ),
                  ),
                  Card(
                    margin:EdgeInsets.symmetric(vertical:10,horizontal:25),
                    child:ListTile(
                      leading:Icon(Icons.phone,color:Colors.teal),
                      title:Text(
                        '9342573263',
                        style:TextStyle(
                          color:Colors.teal.shade900,
                          fontFamily:'Souce Sans Pro',
                          fontSize:20,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:EdgeInsets.symmetric(vertical:10,horizontal:25),
                    child:ListTile(
                      leading:Icon(Icons.email,color:Colors.teal),
                      title:Text(
                        'dravi7350@gamil.com',
                        style:TextStyle(
                          color:Colors.teal.shade900,
                          fontFamily:'Souce Sans Pro',
                          fontSize:20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              )));   
  }
}
