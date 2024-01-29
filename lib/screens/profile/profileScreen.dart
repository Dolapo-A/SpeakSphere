import 'package:flutter/material.dart';
import 'package:speaksphere/constants/colors.dart';

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
        padding: const EdgeInsets.all(12.0),
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
            SizedBox(
              height: 20,
            ),
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        '15,728',
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
          ],
        ),
      ),
    );
  }
}
