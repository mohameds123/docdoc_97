import 'package:dio/dio.dart';
import 'package:docdocapp97/core/const/api_const.dart';
import 'package:docdocapp97/core/helper/cach_helper.dart';
import 'package:docdocapp97/features/home/data/home_data_model.dart';
import 'package:docdocapp97/features/home/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  Dio dio = Dio();

  Future getHomeData() async {
    emit(HomeLoadingState());

    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(
        APIConst.home,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        final data = HomeDataModel.fromJson(response.data);
        emit(HomeSuccessState(homeData: data.data!));
      }
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }
}
