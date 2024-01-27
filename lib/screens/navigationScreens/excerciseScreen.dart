import 'package:flutter/material.dart';
import 'package:speaksphere/screens/comingSoon/comingSoonScreen.dart';
import 'package:speaksphere/constants/colors.dart';

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
            backgroundColor: backgroundColor,

      body: Padding(
        padding: EdgeInsets.only(top: 32, right: 8, bottom: 0, left: 8),
        child: ComingSoonScreen(),
      ),
    );
  }
}
