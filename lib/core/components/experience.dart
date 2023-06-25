import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/responsive.dart';

class Experience extends StatelessWidget {
  Experience({super.key});
  final List expreince = [
    {
      'timing': 'May 2023',
      'company': 'The Intern Bay',
      'role': 'Software Engineer',
      'responsibilites': [
        'Development of Application',
        'Developing a Web Application',
        'Designining UI',
      ]
    },
    {
      'timing': 'May 2023',
      'company': 'The Intern Bay',
      'role': 'Software Engineer',
      'responsibilites': [
        'Development of Application',
        'Developing a Web Application',
        'Designining UI',
      ]
    },
    {
      'timing': 'May 2023',
      'company': 'The Intern Bay',
      'role': 'Software Engineer',
      'responsibilites': [
        'Development of Application',
        'Developing a Web Application',
        'Designining UI',
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double alternating(int index) {
      if (index % 2 == 0) {
        return width * 0.6;
      } else {
        return width * 0.1;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // textWidget(
            //     title: '(',
            //     size: isMobile
            //         ? 30
            //         : isTablet
            //             ? 37
            //             : 43,
            //     textColor: whiteColor),
            textWidget(
              title: 'Experience',
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
              textColor: whiteColor,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expreince.length,
            itemBuilder: ((context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: isDesktop ? width * 0.5 : 35.0,
                    child: Container(
                      height: double.infinity,
                      width: isMobile
                          ? 3.0
                          : isTablet
                              ? 4.0
                              : 4.0,
                      color: lineColor,
                    ),
                  ),
                  Positioned(
                    top: 100.0,
                    left: isDesktop
                        ? width * 0.487
                        : isTablet
                            ? 20
                            : 23.0,
                    child: Container(
                      height: isMobile
                          ? 26
                          : isTablet
                              ? 34
                              : 40.0,
                      width: isMobile
                          ? 26
                          : isTablet
                              ? 34
                              : 40.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        height: isMobile
                            ? 16
                            : isTablet
                                ? 24
                                : 30.0,
                        width: isMobile
                            ? 16
                            : isTablet
                                ? 24
                                : 30.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: isDesktop
                        ? EdgeInsets.only(left: alternating(index), bottom: 40)
                        : isTablet
                            ? const EdgeInsets.only(left: 150, bottom: 40)
                            : const EdgeInsets.only(left: 100, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            color: lightTextColor,
                            child: textWidget(
                              title: expreince[index]['timing'],
                              size: isMobile
                                  ? 26
                                  : isTablet
                                      ? 34
                                      : 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        textWidget(
                            title: expreince[index]['company'],
                            size: isMobile
                                ? 30
                                : isTablet
                                    ? 37
                                    : 43,
                            textColor: whiteColor),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            textWidget(
                                title: '(', size: 26, textColor: whiteColor),
                            textWidget(
                              title: expreince[index]['role'],
                              size: isMobile
                                  ? 16
                                  : isTablet
                                      ? 22
                                      : 28,
                            ),
                            textWidget(
                                title: ')', size: 26, textColor: whiteColor),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        textWidget(
                          title: 'Responsibilitites : ',
                          size: isMobile
                              ? 16
                              : isTablet
                                  ? 22
                                  : 28,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        ...expreince[index]['responsibilites'].map(
                          (e) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                ),
                                height: isMobile ? 6 : 8,
                                width: isMobile ? 6 : 8,
                              ),
                              FittedBox(
                                child: textWidget(
                                    title: e,
                                    size: isMobile
                                        ? 16
                                        : isTablet
                                            ? 22
                                            : 28,
                                    textColor: whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
