import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/responsive.dart';

class AboutMe extends StatefulWidget {
  final GlobalKey aboutMe;
  const AboutMe({super.key, required this.aboutMe});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final List aboutMe = [
    {
      'title': 'Experience',
      'description': [linkedIn, instagram],
      'footer': ['Years'],
    },
    {
      'title': 'Education',
      'description': [linkedIn, instagram],
      'footer': ['RTU Kota'],
    },
    {
      'title': 'Nationality',
      'description': [linkedIn],
      'footer': ['Indian'],
    },
    {
      'title': 'Language',
      'description': [linkedIn, instagram],
      'footer': ['Native', 'English'],
    },
    {
      'title': 'Hobbies',
      'description': [linkedIn, instagram, instagram, linkedIn],
      'footer': [''],
    },
  ];

  bool tablet = false;
  late Timer _timer;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(viewportFraction: !tablet ? 0.8 : 0.2);
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
    //   activePage++;
    //   print(activePage);
    // });

//  controller.animateToPage(
//           activePage,
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeIn,
//         );
//       }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (!controller.hasClients) {
    //     controller.animateToPage(
    //       activePage,
    //       duration: const Duration(milliseconds: 400),
    //       curve: Curves.easeIn,
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  int activePage = 0;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    tablet = isTablet;
    return Column(
      key: widget.aboutMe,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(
              title: 'About Me',
              size: isMobile
                  ? 30
                  : isTablet
                      ? 37
                      : 43,
            ),
            textWidget(
                title: '( )',
                size: isMobile
                    ? 30
                    : isTablet
                        ? 37
                        : 43,
                textColor: whiteColor),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 400,
          width: isMobile
              ? width
              : isTablet
                  ? width * 0.8
                  : width * 0.7,
          child: PageView.builder(
            allowImplicitScrolling: true,
            controller: controller,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                activePage = value;
                print(activePage % value);
              });
            },
            itemBuilder: ((context, index) {
              return exprienceContainer(
                aboutMe: aboutMe,
                index: index % aboutMe.length,
                isMobile: isMobile,
                isTablet: isTablet,
                isActivePage: activePage == index,
              );
            }),
            // itemCount: aboutMe.length,
          ),
        ),
      ],
    );
  }
}

Widget exprienceContainer(
    {required List aboutMe,
    required int index,
    required bool isMobile,
    required bool isTablet,
    required bool isActivePage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: double.infinity,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      shape: BoxShape.rectangle,
      border: Border.all(
        width: 1,
        color: !isActivePage ? headingTextColor : lineColor,
      ),
    ),
    margin: isActivePage ? const EdgeInsets.all(10) : const EdgeInsets.all(25),
    // padding: const EdgeInsets.all(6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(title: '<', size: 22, textColor: lineColor),
            textWidget(title: aboutMe[index]['title'], size: 30),
            textWidget(title: '/>', size: 22, textColor: lineColor),
          ],
        ),
        const SizedBox(height: 20),
        aboutMe[index]['description'].length > 2
            ? SizedBox(
                height: isMobile
                    ? 100
                    : isTablet
                        ? 150
                        : 200,
                width: isMobile
                    ? 100
                    : isTablet
                        ? 150
                        : 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: aboutMe[index]['description'].length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, e) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        aboutMe[index]['description'][e],
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...aboutMe[index]['description'].map(
                    (e) => SvgPicture.asset(
                      e,
                      width: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...aboutMe[index]['footer'].map(
              (e) => Text(
                e,
                style: const TextStyle(
                  color: lineColor,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
