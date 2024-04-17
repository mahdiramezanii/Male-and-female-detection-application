import 'package:hive/hive.dart';
part 'gender_model.g.dart';

@HiveType(typeId: 0)
class FaceRegonationModel extends HiveObject {
  @HiveField(0)
  String result_image;
  @HiveField(1)
  List<dynamic> faces;

  FaceRegonationModel({
    required this.result_image,
    required this.faces,
  });

  factory FaceRegonationModel.FromJson(Map<String, dynamic> jsonObject) {
    return FaceRegonationModel(
      result_image: jsonObject["item"],
      faces: jsonObject["faces"],
    );
  }
}
