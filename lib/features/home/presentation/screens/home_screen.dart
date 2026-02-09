import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String userName;
   HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(userName)),
    );
  }
}
