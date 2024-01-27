import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speaksphere/bottomNavBar/bottomNavBar.dart';
import 'package:speaksphere/constants/colors.dart';

class StreakScreen extends StatelessWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/components/semi_curve_gray.svg'),
                      const Text(
                        '2',
                        style: TextStyle(
                            fontSize: 128,
                            color: secondaryColor,
                            fontWeight: FontWeight.w500,
                            height: 0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'days streak! ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 0),
                      ),
                      SvgPicture.asset(
                        'assets/components/fire.svg',
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Container(
                    width: 350,
                    height: 150,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, right: 16.0, bottom: 24.0, left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Mon',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                      'assets/components/semi_curve.svg')
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Tue',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                      'assets/components/semi_curve.svg')
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Wed',
                                    style: TextStyle(
                                      color: inactiveTabColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                    'assets/components/semi_curve.svg',
                                    color: inactiveTabColor,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Thu',
                                    style: TextStyle(
                                      color: inactiveTabColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                    'assets/components/semi_curve.svg',
                                    color: inactiveTabColor,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Fri',
                                    style: TextStyle(
                                      color: inactiveTabColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                    'assets/components/semi_curve.svg',
                                    color: inactiveTabColor,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Sat',
                                    style: TextStyle(
                                      color: inactiveTabColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SvgPicture.asset(
                                    'assets/components/semi_curve.svg',
                                    color: inactiveTabColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "You’re on a roll, great job! Practice each day to keep\nup with your streak and earn XP points.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // const Expanded(
              //   child: SizedBox(),
              // ),
              Column(
                children: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(350, 56)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 0),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: RichText(
                        // key: _textKey,
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Share',
                        style: GoogleFonts.josefinSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () =>
                        //       Navigator.of(context).push(PageRouteBuilder(
                        //         pageBuilder:
                        //             (context, animation, secondaryAnimation) =>
                        //                 const BottomNavBar(),
                        //       )

                        //       )
                      ),
                    ])),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
