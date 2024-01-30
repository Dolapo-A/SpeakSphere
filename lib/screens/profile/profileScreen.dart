import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speaksphere/constants/colors.dart';
import 'package:speaksphere/screens/navigationScreens/homeScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'profileHero',
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(children: [
                    Image.asset(
                      'assets/Memoji.png',
                    ),
                    const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ]),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Dolapo Araoye',
                style: TextStyle(
                    fontSize: 32, height: 0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 4,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 14,
                    color: Color(0xFF616161),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Joined since 29 Jan 2024',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF616161),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '1107',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'followers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      // width: 10,
                      thickness: 1,
                      color: Color(0xFF616161),
                    ),
                    Column(
                      children: [
                        Text(
                          '333',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'following',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      // width: 10,
                      thickness: 1,
                      color: Color(0xFF616161),
                    ),
                    Column(
                      children: [
                        Text(
                          '128',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'lifetime XP',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  minimumSize: const MaterialStatePropertyAll(Size(120, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 20,
                      // FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.bar_chart,
                    color: secondaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 80,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 28,
                      childAspectRatio: 1),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return buildGridItems(index, context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGridItems(int index, BuildContext context) {
  // Customize each grid item based on the index
  Widget itemContent = Container();
  Widget headingText = const Text('');
  Widget subheadingText = const Text('');
  // Widget context;

  switch (index % 6) {
    case 0:
      itemContent = SvgPicture.asset(
        'assets/components/target.svg',
        height: 28,
        width: 28,
      );
      headingText = const Text(
        '17',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Challenges',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      break;
    case 1:
      itemContent = SvgPicture.asset(
        'assets/components/lesson.svg',
        height: 28,
        width: 28,
        color: Colors.black,
      );
      headingText = const Text(
        '17',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Lessons Passed',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      break;
    case 2:
      itemContent = const Icon(
        Icons.diamond,
        size: 28,
        color: Colors.blue,
      );
      headingText = const Text(
        '05',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Diamonds Earned',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      break;
    case 3:
      itemContent = SvgPicture.asset(
        'assets/components/thunderbolt.svg',
        height: 28,
        width: 28,
        color: Colors.amber[600],
      );
      headingText = const Text(
        '11,417',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Total LifeTime XP',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      Colors.purple;
      break;
    case 4:
      itemContent = SvgPicture.asset(
        'assets/components/fire.svg',
        height: 28,
        width: 28,
      );
      headingText = const Text(
        '02',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Streaks',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      break;
    case 5:
      itemContent = const FaIcon(
        FontAwesomeIcons.award,
        size: 28,
        color: secondaryColor,
      );
      headingText = const Text(
        '36',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'Top 20% global',
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );

      break;
  }

  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24.0),
      border: Border.all(
        color: secondaryColor50shade,
        width: 1.0,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IntrinsicHeight(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  itemContent,
                  const SizedBox(
                    height: 16,
                  ),
                ]),
          ),
          const SizedBox(
            width: 8,
          ),
          IntrinsicHeight(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              headingText,
              const SizedBox(
                height: 2,
              ),
              subheadingText,
            ]),
          ),
        ],
      ),
    ),
  );
}
