import 'package:face_regonation/screan/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScrean extends StatefulWidget {
  DetailScrean({super.key,required this.faces, required this.result_image,});

  String result_image;
  List faces;

  @override
  State<DetailScrean> createState() => _DetailScreanState();
}

class _DetailScreanState extends State<DetailScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              getHeader(),
              SizedBox(height: 40,),
              Result(result_image: widget.result_image, faces: widget.faces)
            ],
          ),
        ));
  }

 
}
