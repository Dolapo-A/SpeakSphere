import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speaksphere/constants/colors.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset('assets/components/coding_bro.svg'),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Coming Soon',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: secondaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/components/thunderbolt.svg'),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'We’ll be up soon, keep an eye on us.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: inactiveTabColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
