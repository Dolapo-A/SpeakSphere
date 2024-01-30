// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speaksphere/bottomNavBar/bottomNavBar.dart';
import 'package:speaksphere/constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class ContainerModel {
  final String category;
  bool isSelected;

  ContainerModel({required this.category, this.isSelected = false});
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  List<String> categories = [
    'Studies',
    'Reading',
    'Technologies',
    'Travel',
    'Psychology',
    'Gaming',
    'TV/Movies',
    'Sports',
    'Languages',
    'Fashion',
    'Fitness',
    'Pets',
    'Foods',
    'Climate Changes',
    'Self-care',
    'Work life',
    'Culture',
    'Design',
    'Sociology',
    'Music',
    'Outdoor',
    'Networking',
    'Romance',
    'Shopping',
    'Sight-seeing'
  ];
  List<List<ContainerModel>> rows = [];
  int selectedCount = 0;

  @override
  void initState() {
    super.initState();
    generateRows();
  }

  void generateRows() {
    rows.clear();
    final random = Random();
    final numberOfRows = [4, 3, 4, 4, 4, 4, 2];

    for (var count in numberOfRows) {
      final row = List.generate(count, (index) {
        return ContainerModel(
            category: categories.removeAt(random.nextInt(categories.length)));
      });
      rows.add(row);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 44.0, right: 8, bottom: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                  size: 15,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(
                        begin: 0,
                        end: selectedCount.toDouble(),
                      ),
                      builder: (context, animatedValue, child) {
                        return LinearProgressIndicator(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          minHeight: 6,
                          value: animatedValue / 6,
                          color: secondaryColor,
                          // valueColor: ,
                          backgroundColor:
                              progressBarBackgroundColor, // Customize the background color as needed
                        );
                      }),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '$selectedCount/6',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'What interests you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Select all that applies',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF908A89)),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: rows.length,
                  itemBuilder: (context, rowIndex) {
                    return Row(
                      children:
                          List.generate(rows[rowIndex].length, (colIndex) {
                        final containerModels = rows[rowIndex][colIndex];
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (containerModels.isSelected) {
                                  // Deselect the container
                                  containerModels.isSelected = false;
                                  selectedCount--;
                                } else if (selectedCount < 6) {
                                  // Select the container if count is less than 6
                                  containerModels.isSelected = true;
                                  selectedCount++;
                                }
                              });
                            },
                            child: containerModels.isSelected
                                ? Container(
                                    margin: const EdgeInsets.all(4.0),
                                    padding: const EdgeInsets.only(
                                        top: 4, right: 8, bottom: 4, left: 8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              101, 12, 1, 0.7),
                                          width: 0,
                                        ),
                                        color: const Color(0xFFC67C72)),
                                    child: Center(
                                      child: Text(
                                        containerModels.category,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(4.0),
                                    child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        strokeWidth: 0,
                                        radius: const Radius.circular(30),
                                        padding: const EdgeInsets.only(
                                            top: 4,
                                            right: 8,
                                            bottom: 4,
                                            left: 8),
                                        color: const Color.fromRGBO(
                                            101, 12, 1, 0.5),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              containerModels.category,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        )),
                                  ));
                      }),
                    );
                  }),
            ),
            Center(
              child: Column(
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
                      onPressed: () {},
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
                          text: 'Skip for now',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: secondaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                    .pushReplacement(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const BottomNavBar(),
                                ))),
                    ])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
