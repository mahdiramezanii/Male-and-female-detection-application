import "package:dio/dio.dart";
import "package:face_regonation/bloc/home_bloc.dart";
import "package:face_regonation/bloc/home_event.dart";
import "package:face_regonation/bloc/home_state.dart";
import "package:face_regonation/data/data_source_remote/gender_verification_datasource.dart";
import "package:face_regonation/data/models/gender_model.dart";
import "package:face_regonation/data/repository/gender_verification_repository.dart";
import "package:face_regonation/di/service_locator.dart";
import "package:face_regonation/screan/detail_screan.dart";
import "package:face_regonation/screan/widgets/widgets.dart";
import "package:face_regonation/util/network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:image_picker/image_picker.dart";
import "dart:io";

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();
  double with_animited_select = 170.0;
  double hight_animited_select = 60;
  double with_animited = 0;
  double hight_animited = 0;
  XFile? _image;
  var box = Hive.box<FaceRegonationModel>("face");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) {
          return HomeBloc();
        },
        child: getbody(),
      ),
    );
  }

  Widget getbody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return NestedScrollView(
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 5),
                            width: with_animited_select,
                            height: hight_animited_select,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 50),
                                  backgroundColor:
                                      Color.fromRGBO(183, 0, 165, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () async {
                                final XFile? pickedFile = await _picker
                                    .pickImage(source: ImageSource.gallery);

                                setState(
                                  () {
                                    with_animited_select = 0;
                                    hight_animited_select = 0;
                                    with_animited = 250;
                                    hight_animited = 60;
                                    _image = pickedFile;
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(ReloadEvent());
                                  },
                                );
                              },
                              child: Text(
                                "انتخاب عکس",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SB",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 5),
                            width: with_animited,
                            height: hight_animited,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 50),
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                var file = (_image!.path);

                                FormData formData = FormData.fromMap(
                                  {
                                    "image": await MultipartFile.fromFile(
                                      file,
                                      filename: _image!.name,
                                    ),
                                  },
                                );

                                BlocProvider.of<HomeBloc>(context).add(
                                  FaceRecongnitionEvent(formData: formData),
                                );

                                setState(
                                  () {
                                    with_animited_select = 250;
                                    hight_animited_select = 60;
                                    with_animited = 0;
                                    hight_animited = 0;
                                  },
                                );
                              },
                              child: Text(
                                "تشخیص جنسیت",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "SB"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      if (state is initState || state is LodingState) ...{
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
                                  width: double.infinity - 50,
                                  height: 500,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.file(
                                        File(_image!.path),
                                      ),
                                    ),
                                  ),
                                )
                              },
                              if (state is LodingState) ...{
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              }
                            ],
                          ),
                        ),
                      },
                      if (state is Resultstate) ...{
                        Result(
                            result_image: box.values.last.result_image,
                            faces: box.values.last.faces)
                      },
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
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تاریخچه",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "mh",
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, value, child) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: getRowItem(
                            box.values.length != 0
                                ? box.values.length - index - 1
                                : 0,
                            box.values.toList(),
                          ),
                        );
                      },
                      childCount: box.values.length,
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget getRowItem(int index, List<FaceRegonationModel> face_list) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        FaceRegonationModel test = face_list[index];

        test.delete();
      },
      child: Padding(
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
                    ? Color.fromRGBO(239, 239, 239, 0.2)
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: CashNetworkImage(
                        "https://softwareengineering.online${face_list[index].result_image}",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "فاطمه تجویدی",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, fontFamily: "SM"),
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage("assets/images/dot.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Face",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      "Number:${index + 1}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 236, 218, 236),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                selectedIndex == index
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScrean(
                                  result_image: face_list[index].result_image,
                                  faces: face_list[index].faces,
                                );
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.open_in_full_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                      )
                    : Spacer(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
