import 'package:face_regonation/util/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScrean extends StatefulWidget {
  DetailScrean({
    super.key,
    required this.faces,
    required this.result_image,
  });

  String result_image;
  List faces;

  @override
  State<DetailScrean> createState() => _DetailScreanState();
}

class _DetailScreanState extends State<DetailScrean> {
  int selected_image=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              getHeader(),
              Spacer(),
              Result(
                result_image: widget.result_image,
                faces: widget.faces,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ));
  }

  Widget Result({required String result_image, required List faces}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 670,
        width: 380,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 360,
              width: 370,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CashNetworkImage(
                    "https://softwareengineering.online${result_image}",
                  ),
                ),
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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selected_image=index;
                          });
                        },
                        child: Container(
                          width: 60,
                          child: CashNetworkImage(
                              "https://softwareengineering.online${faces[index]}"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 5)),
              child: ClipRRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CashNetworkImage(
                      "https://softwareengineering.online${faces[selected_image]}"),
                ),
              ),
            )
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
}
