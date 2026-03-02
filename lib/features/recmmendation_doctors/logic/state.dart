
import '../data/doctor_model.dart';

class RecommendationDocStates {}

class RecommendationDocInitialState extends RecommendationDocStates{}

class RecommendationDocLoadingState extends RecommendationDocStates{}

class RecommendationDocSuccessState extends RecommendationDocStates{
  RecommendationDoctor doctors;
  RecommendationDocSuccessState ({
    required this.doctors,
});
}

class RecommendationDocErrorState extends RecommendationDocStates{
  String errorMessage;
  RecommendationDocErrorState({required this.errorMessage});
}