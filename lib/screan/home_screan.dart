import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

class HomeScrean extends StatefulWidget {
  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final XFile? pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);

                  setState(
                    () {
                      setState(
                        () {
                          _image = pickedFile;
                          print(File(_image!.path));
                        },
                      );
                    },
                  );
                },
                child: Text(
                  "انتخاب عکس",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20)),
              child: _image == null
                  ? Center(child: const Text('عکسی انتخاب نشده است.'))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.file(
                          File(_image!.path),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
