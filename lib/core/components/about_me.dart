import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/responsive.dart';

class AboutMe extends StatelessWidget {
  AboutMe({super.key});
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
      'footer': ['', '', '', ''],
      // 'footer': [instagram, linkedIn],
    },
  ];

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    return Column(
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
        Container(
          // margin: isDesktop
          //     ? const EdgeInsets.symmetric(horizontal: 100.0)
          //     : isTablet
          //         ? const EdgeInsets.symmetric(horizontal: 70.0)
          //         : const EdgeInsets.all(30),
          child: CarouselSlider.builder(
            itemCount: isMobile
                ? aboutMe.length
                : isTablet
                    ? 3
                    : 2,
            itemBuilder: ((context, index, realIndex) {
              return isMobile
                  ? exprienceContainer(
                      aboutMe: aboutMe,
                      index: index,
                      isMobile: isMobile,
                      isTablet: isTablet)
                  : isTablet
                      ? GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          children: [
                            exprienceContainer(
                                aboutMe: aboutMe,
                                index: index + index,
                                isMobile: isMobile,
                                isTablet: isTablet),
                            exprienceContainer(
                                aboutMe: aboutMe,
                                index: index + 1,
                                isMobile: isMobile,
                                isTablet: isTablet),
                          ],
                        )
                      : GridView.count(
                          crossAxisCount: 3,
                          children: [
                            if (index == 0) ...[
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: index,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: index + 1,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: index + 2,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                            ],
                            if (index == 1) ...[
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: index + 2,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: index + 3,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                              exprienceContainer(
                                  aboutMe: aboutMe,
                                  index: 0,
                                  isMobile: isMobile,
                                  isTablet: isTablet),
                            ],
                          ],
                        );
            }),
            options: CarouselOptions(
              enlargeFactor: 0.5,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayCurve: Curves.ease,
              animateToClosest: true,
              autoPlay: true,
            ),
          ),
        )
      ],
    );
  }
}

Widget exprienceContainer(
    {required List aboutMe,
    required int index,
    required bool isMobile,
    required bool isTablet}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      shape: BoxShape.rectangle,
      border: Border.all(
        width: 1,
        color: headingTextColor,
      ),
    ),
    margin: const EdgeInsets.all(20),
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
