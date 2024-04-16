import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:face_regonation/data/data_source_remote/gender_verification_datasource.dart';
import 'package:face_regonation/data/models/gender_model.dart';
import 'package:face_regonation/di/service_locator.dart';
import 'package:face_regonation/util/exeption.dart';

abstract class IGenderVerificationReposotory {
  Future<Either<String, FaceRegonationModel>> getFaceRegonationData(
      FormData formData);
}

class GenderVerificationRemoteRepository extends IGenderVerificationReposotory {
  final IGenderVerificationDataSource _getData = locator.get();
  @override
  Future<Either<String, FaceRegonationModel>> getFaceRegonationData(
      FormData formData) async {
    try {
      var response = await _getData.getFaceRegonationData(formData);

      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
