

import 'package:docdocapp97/features/home/logic/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';
import '../widgets/doc_specialization_widget.dart';
import '../widgets/doctor_recommendation.dart';
import '../widgets/nearby_widget.dart';
class HomeScreen extends StatelessWidget {
  String userName;
  HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => HomeCubit()..getHomeData(),
  child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenHeight * 0.03, vertical: screenHeight * 0.05),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi , $userName!", style: TxtStyle.size18Weight700Black),
                          Text("How are you today?", style: TxtStyle.size11Weight400BlackGrey)
                        ]
                    ),
                    CircleAvatar(
                      radius: screenHeight * 0.032,
                      backgroundColor: ColorsManager.overWhite,
                      child: Icon(Icons.notifications_outlined, color: ColorsManager.black,size: screenHeight * 0.033,),
                    ),
                  ]
              ),

              NearbyWidget(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Doctor Speciality", style: TxtStyle.size18Weight600Black),
                    Text("See All", style: TxtStyle.size12Weight400Primary),
                  ]
              ),
              SizedBox(height: screenHeight * 0.02,),
              DoctorSpeciality(),
              SizedBox(height: screenHeight * 0.02,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommendation Doctor", style: TxtStyle.size18Weight600Black),
                    Text("See All", style: TxtStyle.size12Weight400Primary),
                  ]
              ),
              SizedBox(height: screenHeight * 0.02,),
              RecommendationDoctor(),
            ]
        ),
      ),
    ),
);
  }
}
