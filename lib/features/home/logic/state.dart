
import '../data/home_data_model.dart';

class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  List <Data> homeData ;

  HomeSuccessState ({required this.homeData});


}

class HomeErrorState extends HomeStates {
  String errorMessage ;

  HomeErrorState({required this.errorMessage});
}