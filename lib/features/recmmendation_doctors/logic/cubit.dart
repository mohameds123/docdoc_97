import 'dart:async';
import 'package:dio/dio.dart';
import 'package:docdocapp97/core/const/api_const.dart';
import 'package:docdocapp97/core/helper/cach_helper.dart';
import 'package:docdocapp97/features/recmmendation_doctors/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/doctor_model.dart';

class RecommendationDocCubit extends Cubit<RecommendationDocStates> {
  RecommendationDocCubit() : super(RecommendationDocInitialState());

  Dio dio = Dio();

  RecommendationDoctor? _allDoctorsModel;
  Timer? _debounce;

  Future getAllRecDoc() async {
    emit(RecommendationDocLoadingState());
    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(
        APIConst.getRecommendationDoc,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        final model = RecommendationDoctor.fromJson(response.data);
        _allDoctorsModel = model;
        emit(RecommendationDocSuccessState(doctors: model));
      }
    } catch (e) {
      emit(RecommendationDocErrorState(errorMessage: e.toString()));
    }
  }

  void searchDoctors(String name) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 250), () async {
      if (name.trim().isEmpty) {
        if (_allDoctorsModel != null) {
          emit(RecommendationDocSuccessState(doctors: _allDoctorsModel!));
        } else {
          await getAllRecDoc();
        }
        return;
      }

      await _searchFromApi(name.trim());
    });
  }

  Future<void> _searchFromApi(String name) async {
    emit(RecommendationDocLoadingState());
    try {
      final token = CacheHelper.getToken();

      final response = await dio.get(
        APIConst.doctorSearch,
        queryParameters: {"name": name},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        final model = RecommendationDoctor.fromJson(response.data);
        emit(RecommendationDocSuccessState(doctors: model));
      }
    } catch (e) {
      emit(RecommendationDocErrorState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}