import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Authentication/Authenticator.dart';
import 'Navigator.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  _AppState createState() => _AppState();
}

class _AppState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/bienvenido.jpg'),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                      child: Image.asset('assets/images/logoGoogle.png'),
                      onPressed: () async {
                        User? user = await Authenticator.iniciarSesion(
                          context: context);
                        print(user?.displayName);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Nav()),
                        );
                      }),
                  FloatingActionButton(
                      child: Image.asset('assets/images/logoFacebook.png'),
                      onPressed: (){

                      }),
                  FloatingActionButton(
                      child: Image.asset('assets/images/Twitter_logo.png'),
                      onPressed: (){

                      })
                ],
              ),
            ),

          ],
        ),
      ),


    );
  }






}


