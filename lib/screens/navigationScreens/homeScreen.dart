import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speaksphere/constants/colors.dart';
import 'package:speaksphere/screens/speaking/speakScreen.dart';
import 'package:speaksphere/screens/streaks/streakScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ProfileBar(),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black26,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Your\nLearning Sphere',
                    style: TextStyle(
                        fontSize: 32,
                        height: 1.1,
                        fontWeight: FontWeight.w700,
                        color: secondaryColor),
                  ),
                  SvgPicture.asset('assets/components/bricks.svg')
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 150,
                      crossAxisSpacing: 36,
                      mainAxisSpacing: 36,
                      childAspectRatio: 1),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return buildGridItem(index, context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StatusBar(),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {},
          child: Stack(children: [
            SvgPicture.asset('assets/components/memoji.svg'),
            Image.asset('assets/components/wink.png'),
          ]),
        )
      ],
    );
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 33,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.80,
      ),
      // width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: const Color.fromRGBO(144, 138, 137, 0.50), width: 1)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/components/kingdomflag.svg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StreakScreen();
                }));
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/components/fire.svg'),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '2',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/components/target.svg'),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  '17',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/components/bell.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGridItem(int index, BuildContext context) {
  // Customize each grid item based on the index
  Widget itemContent = Container();
  Widget headingText = const Text('');
  Widget subheadingText = const Text('');
  Widget progressBar = const LinearProgressIndicator();
  // Widget context;

  switch (index % 8) {
    case 0:
      itemContent = SvgPicture.asset('assets/components/openbook.svg');
      headingText = const Text(
        'Reading',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 50%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 5 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      break;
    case 1:
      itemContent = SvgPicture.asset('assets/components/headphone.svg');
      headingText = const Text(
        'Listening',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 50%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 5 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      break;
    case 2:
      itemContent = SvgPicture.asset('assets/components/writinghand.svg');
      headingText = const Text(
        'Writing',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 70%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 7 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      Colors.orange;
      break;
    case 3:
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const SpeakScreen();
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: secondaryColor50shade,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemContent =
                    SvgPicture.asset('assets/components/speaking.svg'),
                const SizedBox(
                  height: 4,
                ),
                headingText = const Text(
                  'Speaking',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 2,
                ),
                subheadingText = const Text(
                  'You completed 25%',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: inactiveTabColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                progressBar = const LinearProgressIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    minHeight: 6,
                    value: 2.5 / 10,
                    color: secondaryColor,
                    backgroundColor: progressBarBackgroundColor),
              ],
            ),
          ),
        ),
      );

    case 4:
      itemContent = SvgPicture.asset('assets/components/books.svg');
      headingText = const Text(
        'Books',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 80%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 8 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      Colors.purple;
      break;
    case 5:
      itemContent = SvgPicture.asset('assets/components/guess.svg');
      headingText = const Text(
        'Quizzes',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 40%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 4 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      Colors.purple;
      break;
    case 6:
      itemContent = SvgPicture.asset('assets/components/puzzlepiece.svg');
      headingText = const Text(
        'Games',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 90%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 9 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      Colors.purple;
      break;
    case 7:
      itemContent = SvgPicture.asset('assets/components/translate.svg');
      headingText = const Text(
        'Translation',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );
      subheadingText = const Text(
        'You completed 40%',
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: inactiveTabColor),
      );
      progressBar = const LinearProgressIndicator(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          minHeight: 6,
          value: 4 / 10,
          color: secondaryColor,
          backgroundColor: progressBarBackgroundColor);
      Colors.purple;
      break;
  }

  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: secondaryColor50shade,
        width: 1.0,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        itemContent,
        const SizedBox(
          height: 4,
        ),
        headingText,
        const SizedBox(
          height: 2,
        ),
        subheadingText,
        const SizedBox(
          height: 4,
        ),
        progressBar
      ]),
    ),
  );
}
