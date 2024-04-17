import 'package:face_regonation/bloc/home_event.dart';
import 'package:face_regonation/bloc/home_state.dart';
import 'package:face_regonation/data/models/gender_model.dart';
import 'package:face_regonation/data/repository/gender_verification_repository.dart';
import 'package:face_regonation/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IGenderVerificationReposotory _repostory = locator.get();
  var box = Hive.box<FaceRegonationModel>("face");

  HomeBloc() : super(initState()) {
    on<FaceRecongnitionEvent>((event, emit) async {
      emit(LodingState());
      var response = await _repostory.getFaceRegonationData(event.formData);
      response.fold((l) {
        print(l);
      }, (r) {
        box.add(r);
      });

      emit(Resultstate(result: response));
    });

    on<ReloadEvent>((event, emit){
      emit(initState());
    });
  }
}
