import 'package:dio/dio.dart';

abstract class HomeEvent{}


class FaceRecongnitionEvent extends HomeEvent {
  FormData formData;
  FaceRecongnitionEvent({
    required this.formData,
  });
}

class ReloadEvent extends HomeEvent{}