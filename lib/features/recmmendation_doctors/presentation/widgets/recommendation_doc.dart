
import 'package:docdocapp97/features/recmmendation_doctors/data/doctor_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors_manager.dart';

class RecommendationDoc extends StatelessWidget {
  Data doctor;


   RecommendationDoc({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 126,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            // Doctor Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                doctor.photo!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/home_doctor.png', width: 110, height: 110),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                  doctor.name!,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(

                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.TextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${doctor.specialization!.name!} | ${doctor.gender!}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromRGBO(117, 117, 117, 1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 8),
                      Text(
                        '4.8 (4,279 reviews)', // Replace with actual rating if available
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(117, 117, 117, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
