import 'package:dio/dio.dart';
import 'package:face_regonation/data/models/gender_model.dart';
import 'package:face_regonation/di/service_locator.dart';
import 'package:face_regonation/util/exeption.dart';

abstract class IGenderVerificationDataSource {
  Future<FaceRegonationModel> getFaceRegonationData(FormData formData);
}

class GenderVerificationRemoteDataSource extends IGenderVerificationDataSource {
  final Dio _dio = locator.get();
  @override
  Future<FaceRegonationModel> getFaceRegonationData(FormData formData) async {
    try {
      var response = await _dio.post("gender_verification/", data: formData);

      return FaceRegonationModel.FromJson(response.data);
    } on DioException catch (ex) {
      throw ApiException(message: ex.response!.data["message"]);
    } catch (ex) {
      throw ApiException(message: "خطایی رخ داده است");
    }
  }
}
