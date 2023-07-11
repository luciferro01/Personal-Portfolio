import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/assets_path.dart';
import '../../constants/responsive.dart';

class TechStack extends StatelessWidget {
  const TechStack({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    List tech = [
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
      {'title': 'Flutter', 'icon': linkedIn},
    ];
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(
              title: 'Tech Stack ',
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
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        isDesktop
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio: 1.4,
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 30,
                            mainAxisExtent: 180,
                          ),
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: lightTextColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: darkBackgroundColor,
                                    spreadRadius: 10,
                                    blurStyle: BlurStyle.solid,
                                    blurRadius: 60,
                                    offset: Offset(6, 6),
                                  ),
                                  BoxShadow(
                                      color: headingTextColor,
                                      spreadRadius: 2,
                                      blurRadius: 80,
                                      offset: Offset(-4, -4),
                                      blurStyle: BlurStyle.inner),
                                ],
                              ),
                              child: SvgPicture.asset(
                                tech[index]['icon'],
                                fit: BoxFit.contain,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    // const Expanded(child: SizedBox()),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        margin: const EdgeInsets.only(right: 40),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio: 1.4,
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 30,
                            mainAxisExtent: 180,
                          ),
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: lightTextColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: darkBackgroundColor,
                                    spreadRadius: 10,
                                    blurStyle: BlurStyle.solid,
                                    blurRadius: 60,
                                    offset: Offset(6, 6),
                                  ),
                                  BoxShadow(
                                      color: headingTextColor,
                                      spreadRadius: 2,
                                      blurRadius: 80,
                                      offset: Offset(-4, -4),
                                      blurStyle: BlurStyle.inner),
                                ],
                              ),
                              child: SvgPicture.asset(
                                tech[index]['icon'],
                                fit: BoxFit.contain,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ])
            : Container(),
      ],
    );
    // : Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Flexible(
    //         child: ListView.builder(
    //           shrinkWrap: true,
    //           // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 4,
    //           ),
    //           itemBuilder: ((context, index) {
    //             return Container();
    //           }),
    //         ),
    //       ),
    //     ],
    //   );

//🥲🥲🥲🥲
    // return Container(
    //   width: MediaQuery.of(context).size.width * 1,
    //   height: MediaQuery.of(context).size.height * 0.5,
    //   margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
    //   child: GridView.builder(
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemCount: 10,
    //     gridDelegate: isMobile
    //         ? const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)
    //         : isTablet
    //             ? const SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 4)
    //             : const SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 8),
    //     itemBuilder: ((context, index) {
    //       return Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: lightTextColor,
    //         ),
    //         child: SvgPicture.asset(
    //           tech[index]['icon'],
    //           fit: BoxFit.contain,
    //         ),
    //       );
    //     }),
    //   ),
    // );
  }
}
