import 'package:face_regonation/data/models/gender_model.dart';
import 'package:face_regonation/di/service_locator.dart';
import 'package:face_regonation/screan/splach_screan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  
  await initLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(FaceRegonationModelAdapter());
  await Hive.openBox<FaceRegonationModel>("face");
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScren(),
    );
  }
}
