import "package:face_regonation/screan/home_screan.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class SplachScren extends StatefulWidget {

  
 

  @override
  State<SplachScren> createState() => _SplachScrenState();
}

class _SplachScrenState extends State<SplachScren> {

    @override
  void initState() {


    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext) {
        return HomeScrean();
      }));
    });

    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image(
            image: AssetImage("assets/images/splach.png"),
            width: 180,
          ),
          SizedBox(
            height: 20,
          ),
          SpinKitSquareCircle(
            color: Colors.blue,
            size: 70,
          ),
          Spacer(),
          Text(
            maxLines: 1,
            "تشخیص چهره",
            
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
