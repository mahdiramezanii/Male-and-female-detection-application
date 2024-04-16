import 'package:dartz/dartz.dart';
import 'package:face_regonation/bloc/home_event.dart';
import 'package:face_regonation/data/models/gender_model.dart';

abstract class HomeState {}

class initState extends HomeState {}

class LodingState extends HomeState {}

class Resultstate extends HomeState {
  Either<String, FaceRegonationModel> result;

  Resultstate({
    required this.result,
  });
}
