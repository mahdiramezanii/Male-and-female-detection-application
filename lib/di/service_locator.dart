import 'package:dio/dio.dart';
import 'package:face_regonation/data/data_source_remote/gender_verification_datasource.dart';
// import 'package:face_regonation/data/repository/gender_repository,.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: "https://softwareengineering.online/"),
    ),
  );

  //DataSource
  locator.registerFactory<IGenderVerificationDataSource>(
    () => GenderVerificationRemoteDataSource(),
  );

  //Repository
  // locator.registerFactory<IGenderVerificationRepository>(
  //   () {
  //     return GenderVerificationRemoteRepository();
  //   },
  // );
}
