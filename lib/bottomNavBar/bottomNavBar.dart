// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speaksphere/constants/colors.dart';
import 'package:speaksphere/screens/navigationScreens/chatsScreen.dart';
import 'package:speaksphere/screens/navigationScreens/excerciseScreen.dart';
import 'package:speaksphere/screens/navigationScreens/gamesScreen.dart';
import 'package:speaksphere/screens/navigationScreens/homeScreen.dart';
import 'package:speaksphere/screens/navigationScreens/lessonScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: screens.length, vsync: this);
  int selectedTabIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    LessonScreen(),
    ExcerciseScreen(),
    GamesScreen(),
    ChatScreen()
  ];

  @override
  void initState() {
    super.initState();

    // _tabController = TabController(length: screens.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
  }

  // int screenIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
        bottomNavigationBar: Container(
          height: 65,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Material(
            color: backgroundColor,
            child: TabBar(
              isScrollable: false,
              controller: _tabController,
              indicator: TopIndicator(),
              labelColor: secondaryColor,
              labelStyle: GoogleFonts.josefinSans(
                  fontSize: 11, fontWeight: FontWeight.w500),
              tabs: <Widget>[
                Tab(
                  icon: SvgPicture.asset('assets/components/home.svg',
                      color: selectedTabIndex == 0
                          ? secondaryColor
                          : inactiveTabColor),
                  text: 'Home',
                ),
                Tab(
                    icon: SvgPicture.asset('assets/components/lesson.svg',
                        color: selectedTabIndex == 1
                            ? secondaryColor
                            : inactiveTabColor),
                    text: 'Lesson'),
                Tab(
                    icon: SvgPicture.asset('assets/components/excercise.svg',
                        color: selectedTabIndex == 2
                            ? secondaryColor
                            : inactiveTabColor),
                    text: 'Excercise'),
                Tab(
                    icon: SvgPicture.asset('assets/components/game.svg',
                        color: selectedTabIndex == 3
                            ? secondaryColor
                            : inactiveTabColor),
                    text: 'Games'),
                Tab(
                    icon: SvgPicture.asset('assets/components/chat.svg',
                        color: selectedTabIndex == 4
                            ? secondaryColor
                            : inactiveTabColor),
                    text: 'Chats'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = secondaryColor
      ..strokeWidth = 5
      ..isAntiAlias = true;

    double indicatorHeight = 5.0;
    double borderRadius = 10.0; // Adjust the radius as needed

    RRect rRect = RRect.fromRectAndCorners(
      Rect.fromPoints(
        Offset(offset.dx, 0),
        Offset(cfg.size!.width + offset.dx, indicatorHeight),
      ),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    canvas.drawRRect(rRect, paint);
  }
}
