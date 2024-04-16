import 'package:face_regonation/bloc/home_event.dart';
import 'package:face_regonation/bloc/home_state.dart';
import 'package:face_regonation/data/repository/gender_verification_repository.dart';
import 'package:face_regonation/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IGenderVerificationReposotory _repostory = locator.get();

  HomeBloc() : super(initState()) {
    on<FaceRecongnitionEvent>((event, emit) async {
      emit(LodingState());
      var response = await _repostory.getFaceRegonationData(event.formData);
      print(response);
      emit(Resultstate(result: response));
    });
  }
}
