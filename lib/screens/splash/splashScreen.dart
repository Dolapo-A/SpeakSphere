// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speaksphere/constants/colors.dart';
import 'package:speaksphere/screens/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const OnboardingScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: const OnboardingScreen(),
      );
    },
  );
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _opacityAnimation3;

  @override
  void initState() {
     Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(_createRoute());
    });
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _opacityAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.25)));
    _opacityAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.5)));
    _opacityAnimation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1)));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              black,
              Color(0xfff9F4F4F).withOpacity(0.85),
            ]),
        image: const DecorationImage(
            image: AssetImage("assets/Vector.png"),
            fit: BoxFit.fitWidth,
            opacity: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
            child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: FadeTransition(
                    opacity: _opacityAnimation2,
                    child: Image.asset('assets/spiral.png'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: FadeTransition(
                        opacity: _opacityAnimation2,
                        child: Image.asset('assets/semi_curve.png'))),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _opacityAnimation1,
                      child: Row(
                        children: [
                          Stack(children: [
                            Text(
                              'Speak',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = roseOrange.withOpacity(1),
                              ),
                            ),
                            const Text(
                              'Speak',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: white,
                              ),
                            ),
                          ]),
                          Stack(children: [
                            Text(
                              'Sphere',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = roseOrange.withOpacity(1),
                              ),
                            ),
                            Text(
                              'Sphere',
                              style: TextStyle(
                                fontSize: 40,
                                color: roseOrange.withOpacity(1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    FadeTransition(
                      opacity: _opacityAnimation3,
                      child: Stack(children: [
                        Text(
                          '...speak the world',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = const Color(0xFFF650C01),
                          ),
                        ),
                        const Text(
                          '...speak the world',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: white,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 0,
            ),
            Stack(
              children: <Widget>[
                FadeTransition(
                    opacity: _opacityAnimation1,
                    child: Image.asset('assets/splash_01_figures.png')),
                Positioned(
                    top: 190,
                    left: 150,
                    child: FadeTransition(
                        opacity: _opacityAnimation2,
                        child: Image.asset('assets/sound_01.png'))),
                Positioned(
                    top: 185,
                    left: 145,
                    child: FadeTransition(
                        opacity: _opacityAnimation3,
                        child: Image.asset('assets/sound_02.png'))),
                Positioned(
                    top: 80,
                    right: 20,
                    child: FadeTransition(
                        opacity: _opacityAnimation3,
                        child: Image.asset('assets/think_01.png'))),
                Positioned(
                    top: 65,
                    right: 10,
                    child: FadeTransition(
                        opacity: _opacityAnimation2,
                        child: Image.asset('assets/think_02.png'))),
              ],
            )
          ],
        )),
      ),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
