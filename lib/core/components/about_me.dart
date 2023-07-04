import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/responsive.dart';

class AboutMe extends StatefulWidget {
  AboutMe({super.key});

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
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      activePage++;
      print(activePage);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.hasClients) {
        controller.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
    });
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
    double height = MediaQuery.of(context).size.height;

    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    tablet = isTablet;
    return MouseRegion(
      onHover: (event) {
        Icons.abc;
      },
      cursor: SystemMouseCursors.zoomOut,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(title: 'About Me', size: 30),
              textWidget(title: '( )', size: 30, textColor: whiteColor),
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
      ),
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
        color: !isActivePage! ? headingTextColor : lineColor,
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









//Carousel Slider
// Container(
        // margin: isDesktop
        //     ? const EdgeInsets.symmetric(horizontal: 100.0)
        //     : isTablet
        //         ? const EdgeInsets.symmetric(horizontal: 70.0)
        //         : const EdgeInsets.all(30),
        //   child: CarouselSlider.builder(
        //     itemCount: isMobile
        //         ? aboutMe.length
        //         : isTablet
        //             ? 3
        //             : 2,
        //     carouselController: controller,
        //     itemBuilder: ((context, index, realIndex) {
        //       return isMobile
        //           ? exprienceContainer(
        //               aboutMe: aboutMe,
        //               index: index,
        //               isMobile: isMobile,
        //               isTablet: isTablet)
        //           : isTablet
        //               ? GridView(
        //                   gridDelegate:
        //                       const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                   ),
        //                   children: [
        //                     exprienceContainer(
        //                         aboutMe: aboutMe,
        //                         index: index + index,
        //                         isMobile: isMobile,
        //                         isTablet: isTablet),
        //                     exprienceContainer(
        //                         aboutMe: aboutMe,
        //                         index: index + 1,
        //                         isMobile: isMobile,
        //                         isTablet: isTablet),
        //                   ],
        //                 )
        //               : GridView.count(
        //                   crossAxisCount: 3,
        //                   children: [
        //                     if (index == 0) ...[
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: index,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: index + 1,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: index + 2,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                     ],
        //                     if (index == 1) ...[
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: index + 2,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: index + 3,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                       exprienceContainer(
        //                           aboutMe: aboutMe,
        //                           index: 0,
        //                           isMobile: isMobile,
        //                           isTablet: isTablet),
        //                     ],
        //                   ],
        //                 );
        //     }),
        //     options: CarouselOptions(
        //       onPageChanged: (index, reason) {
        //         print(index);
        //         return exprienceContainer(
        //             aboutMe: aboutMe,
        //             index: index,
        //             isMobile: isMobile,
        //             isTablet: isTablet,
        //             borderColor: lineColor);
        //       },
        //       enlargeFactor: 0.2,
        //       autoPlayInterval: const Duration(seconds: 4),
        //       autoPlayCurve: Curves.ease,
        //       animateToClosest: true,
        //       autoPlay: true,
        //       enlargeCenterPage: true,
        //       enableInfiniteScroll: true,
        //     ),
        //   ),
        // )