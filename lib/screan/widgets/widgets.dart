import 'package:face_regonation/util/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Result({required String result_image, required List faces}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 400,
        width: 380,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: CashNetworkImage(
                "https://softwareengineering.online${result_image}",
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: faces.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        width: 60,
                        child: CashNetworkImage(
                            "https://softwareengineering.online${faces[index]}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("assets/images/menu.png"),
            color: Colors.white,
          ),
          Text(
            "تشخیص چهره",
            style: TextStyle(
              color: Color.fromRGBO(
                183,
                0,
                165,
                1,
              ),
              fontSize: 30,
              fontFamily: "mh",
            ),
          ),
          Image(image: AssetImage("assets/images/bell.png"))
        ],
      ),
    );
  }