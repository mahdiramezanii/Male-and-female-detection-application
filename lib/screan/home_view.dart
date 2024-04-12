import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:image_picker/image_picker.dart";
import "dart:io";

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 30,
                backgroundColor: Colors.black,
                title: getHeader(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 50),
                            backgroundColor: Color.fromRGBO(183, 0, 165, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        onPressed: () async {
                          final XFile? pickedFile = await _picker.pickImage(
                              source: ImageSource.gallery);

                          setState(
                            () {
                              _image = pickedFile;
                              print(File(_image!.path));
                            },
                          );
                        },
                        child: Text(
                          "انتخاب عکس",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       height: 45,
                      //       width: 160,
                      //       decoration: BoxDecoration(
                      //         color: Color.fromRGBO(49, 49, 51, 1),
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           "Continue game",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w800,
                      //               fontSize: 16,
                      //               color: Color.fromRGBO(204, 204, 204, 1)),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Container(
                      //       height: 45,
                      //       width: 160,
                      //       decoration: BoxDecoration(
                      //           color: Color.fromRGBO(183, 0, 165, 1),
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Text(
                      //           "Start Game",
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w800),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 385,
                        height: 385,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 350,
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10000),
                                gradient: RadialGradient(
                                  colors: [
                                    Color.fromRGBO(183, 0, 165, 1),
                                    Color.fromRGBO(183, 0, 165, 0),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(183, 0, 165, 1)
                                        .withOpacity(0.5),

                                    blurRadius: 30,
                                    // Shadow position
                                  ),
                                ],
                              ),
                            ),
                            if (_image == null) ...{
                              Positioned(
                                right: 0,
                                child: Image(
                                  image: AssetImage("assets/images/2.png"),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Image(
                                  image: AssetImage("assets/images/1.png"),
                                ),
                              ),
                            },
                            if (_image != null) ...{
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.file(
                                File(_image!.path),
                              ),
                            )
                            }
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Row(
                    children: [
                      Text(
                        "Recently Users",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return getRowItem(index);
                }, childCount: 20),
              )
            ],
          )),
    );
  }

  Widget getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage("assets/images/menu.png"),
          color: Colors.white,
        ),
        Image(image: AssetImage("assets/images/GAME.png")),
        Image(image: AssetImage("assets/images/bell.png"))
      ],
    );
  }

  Widget getRowItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 75,
          width: 371,
          decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Color.fromRGBO(192, 208, 211, 0.23)
                  : Colors.black,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 53.9,
                width: 55.22,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/image2.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                width: 7,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mahdi Ramezani",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Image(image: AssetImage("assets/images/dot.png")),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "online",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Text(
                    "Level 150",
                    style: TextStyle(color: Colors.pink),
                  ),
                ],
              ),
              Spacer(),
              selectedIndex == index
                  ? Image(image: AssetImage("assets/images/plus.png"))
                  : Spacer(),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRecent extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        Text(
          "Recently Users",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
