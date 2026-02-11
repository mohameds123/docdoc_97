import 'package:docdocapp97/features/home/logic/cubit.dart';
import 'package:docdocapp97/features/home/logic/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/txt_style.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if(state is HomeLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is HomeSuccessState){
          return SizedBox(
            height: 86,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.homeData.length,
              itemBuilder: (context, index) {
                return Column(
                  spacing: 6,
                  children: [
                    Image.asset("assets/logo/general_icon.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(state.homeData[index].name!, style: TxtStyle.size12Weight400BMoreBlack),
                    ),
                  ],
                );
              },
            ),
          );
        }else if (state is HomeErrorState) {
          return Center(child: Text(state.errorMessage,style: TxtStyle.size12Weight400Primary,));
        } return SizedBox();
      },
    );
  }
}
