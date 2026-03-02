import 'package:dio/dio.dart';
import 'package:docdocapp97/core/const/api_const.dart';
import 'package:docdocapp97/core/helper/cach_helper.dart';
import 'package:docdocapp97/features/recmmendation_doctors/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/doctor_model.dart';


class RecommendationDocCubit extends Cubit <RecommendationDocStates>{

  RecommendationDocCubit () : super(RecommendationDocInitialState());


  Dio dio = Dio();

  Future getAllRecDoc () async {
    emit(RecommendationDocLoadingState());

    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(APIConst.getRecommendationDoc,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if(response.statusCode == 200){
        final allDocs = RecommendationDoctor.fromJson(response.data);
        emit(RecommendationDocSuccessState(doctors: allDocs));
      }

    }catch (e){
      emit(RecommendationDocErrorState(errorMessage: e.toString()));
    }
  }
}