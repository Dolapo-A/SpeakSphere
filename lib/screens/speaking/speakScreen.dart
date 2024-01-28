import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speaksphere/constants/colors.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({super.key});

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleAnimation() {
    if (_isPlaying) {
      _controller.reset();
    } else {
      _controller.repeat(reverse: true);
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 44.0, right: 16, bottom: 0, left: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    minHeight: 6,
                    value: 2 / 6,
                    color: secondaryColor,
                    // valueColor: ,
                    backgroundColor:
                        progressBarBackgroundColor, // Customize the background color as needed
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Speak this sentence',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SvgPicture.asset('assets/components/volume.svg'),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Bonjour, Buchi, enchante',
              style: TextStyle(
                color: Color(0xFF616161),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: GestureDetector(
                          onTap: () {},
                          child:
                              SvgPicture.asset('assets/components/mic.svg')))),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brilliant!',
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Meaning:',
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Hello, Buchi, nice to meet you.',
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondaryColor),
                    minimumSize: const MaterialStatePropertyAll(Size(350, 56)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                  ),
                  onPressed: _toggleAnimation,
                  child: _isPlaying
                      ? const Text(
                          'Stop',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0),
                        )
                      : const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
