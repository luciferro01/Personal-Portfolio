import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_constants.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return isDesktop
        ? Row(children: [
            Container(
              height: height * 0.5,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.06),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: ((context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightTextColor,
                    ),
                    child: SvgPicture.asset(
                      tech[index]['icon'],
                      fit: BoxFit.contain,
                    ),
                  );
                }),
              ),
            ),
            Container(
              height: height * 0.5,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.06),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tech.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1, crossAxisCount: 3),
                itemBuilder: ((context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightTextColor,
                    ),
                    child: SvgPicture.asset(
                      tech[index]['icon'],
                      fit: BoxFit.contain,
                    ),
                  );
                }),
              ),
            ),
          ])
        : Container();
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
