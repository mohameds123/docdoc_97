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
      create: (context) => RecommendationDocCubit()..getAllRecDoc(),
      child: Builder(
        builder: (context) {
          // ✅ context هنا شايف الـ BlocProvider

          return Scaffold(
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

                    onChanged: (value){
                      context.read<RecommendationDocCubit>().searchDoctors(value);
                    },


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
                    if (state is RecommendationDocLoadingState) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is RecommendationDocSuccessState) {
                      final list = state.doctors.data ?? [];

                      if (list.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text("No Doctors Found"),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: RecommendationDoc(
                              doctor: list[index],
                            ),
                          );
                        },
                      );
                    } else if (state is RecommendationDocErrorState) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(state.errorMessage),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}