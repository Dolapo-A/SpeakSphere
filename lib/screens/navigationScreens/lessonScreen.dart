import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speaksphere/screens/comingSoon/comingSoonScreen.dart';
import 'package:speaksphere/constants/colors.dart';
import 'package:speaksphere/screens/navigationScreens/homeScreen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: lessonScreens.length, vsync: this);

  final List<Widget> lessonScreens = [
    const AudioLesson(),
    const ComingSoonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Center(child: StatusBar()),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, bottom: 0, right: 24),
        child: Column(
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350, maxHeight: 40),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                        color: const Color.fromRGBO(144, 138, 137, 0.50),
                        width: 1)),
                child: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(
                        text: 'Audio Lesson',
                      ),
                      Tab(
                        text: 'Video Lesson',
                      )
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: inactiveTabColor,
                    indicator: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    indicatorPadding: const EdgeInsets.symmetric(
                        horizontal: -40, vertical: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            // const AudioLesson()
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: lessonScreens,
            ))
          ],
        ),
      ),
    );
  }
}

class AudioLesson extends StatelessWidget {
  const AudioLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(clipBehavior: Clip.none, children: [
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400, minWidth: 150, maxHeight: 105),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('assets/lesson1.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
                      .withOpacity(0.25), // Adjust opacity as needed
                ),
              ),
            ),
            const Positioned(
                left: 24,
                top: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First Trip',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Here you will listen to\nconversations between tourists,\nand learn to speak together with\nthem!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    )
                  ],
                )),
            Positioned(
              bottom: -20,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/components/Playorange.svg'),
              ),
            )
          ]),
          const SizedBox(
            height: 48,
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400, minWidth: 150, maxHeight: 105),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('assets/lesson2.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
                      .withOpacity(0.25), // Adjust opacity as needed
                ),
              ),
            ),
            const Positioned(
                left: 24,
                top: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Freelance Work',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'After taking this classes, you will\nbe able to take orders from\nforeigners! ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    )
                  ],
                )),
            Positioned(
              bottom: -20,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/components/Playgray.svg'),
              ),
            )
          ]),
          const SizedBox(
            height: 48,
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400, minWidth: 150, maxHeight: 105),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('assets/lesson3.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
                      .withOpacity(0.25), // Adjust opacity as needed
                ),
              ),
            ),
            const Positioned(
                left: 24,
                top: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First Meeting',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'You will learn to communicate\nwith your colleagues and\nunderstand them!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    )
                  ],
                )),
            Positioned(
              bottom: -20,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/components/Playyellow.svg'),
              ),
            )
          ]),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                constraints: const BoxConstraints(
                    maxWidth: 400, minWidth: 150, maxHeight: 105),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/lesson4.png'),
                        fit: BoxFit.cover)),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                        .withOpacity(0.25), // Adjust opacity as needed
                  ),
                ),
              ),
              const Positioned(
                  left: 24,
                  top: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Meeting With Partners ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'You will learn to communicate\nwith your colleagues and\nunderstand them!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      )
                    ],
                  )),
              Positioned(
                bottom: -20,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/components/Playblack.svg'),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
