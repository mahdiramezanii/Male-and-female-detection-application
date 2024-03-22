import 'package:face_regonation/screan/splach_screan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{


  @override 
  Widget build(BuildContext context){


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplachScren(),
    );
  }
}