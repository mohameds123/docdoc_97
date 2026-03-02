import 'package:docdocapp97/features/recmmendation_doctors/logic/cubit.dart';
import 'package:docdocapp97/features/recmmendation_doctors/logic/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors_manager.dart';
import '../widgets/recommendation_doc.dart';

class RecDocScreen extends StatelessWidget {
  const RecDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      RecommendationDocCubit()
        ..getAllRecDoc(),
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 40),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorsManager.borderColor),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9.0),
                      child: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                  ),
                  const Text(
                    "Recommendation Doctor",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorsManager.borderColor),
                    ),
                    child: const Center(
                      child: Icon(Icons.menu, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: ColorsManager.fillColor2,
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Doctor List
            BlocBuilder<RecommendationDocCubit, RecommendationDocStates>(

              builder: (context, state) {
                if(state is RecommendationDocLoadingState){
                  return CircularProgressIndicator();
                }else if (state is RecommendationDocSuccessState){
                  return SizedBox(
                    height: 680,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.doctors.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: RecommendationDoc(doctor: state.doctors.data![index],),
                        );
                      },
                    ),
                  );
                }else if (state is RecommendationDocErrorState){
                  return Center(child: Text(state.errorMessage),);
                } return SizedBox();

              },
            ),
          ],
        ),
      ),
    );
  }
}
