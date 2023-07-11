import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/constants/responsive.dart';
import 'package:portfolio/utils/widgets/buttons.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey contactMe;
  final GlobalKey experienceKey;
  final GlobalKey projects;
  final GlobalKey skills;
  final GlobalKey aboutMe;
  const NavBar(
      {required this.scrollController,
      super.key,
      required this.contactMe,
      required this.experienceKey,
      required this.projects,
      required this.skills,
      required this.aboutMe});

  @override
  Widget build(BuildContext context) {
    final List pageScrollers = [
      {'title': 'About Me', 'scrollController': aboutMe},

      {'title': 'Skills', 'scrollController': skills},
      {'title': 'Projects', 'scrollController': projects},
      {'title': 'Experience', 'scrollController': experienceKey},
      {'title': 'Hire Me', 'scrollController': contactMe},
      // {'title': '', 'scrollController': },
    ];
    bool isDesktop = Responsive.isDesktop(context);

    // bool isTablet = Responsive.isTablet(context);
    return isDesktop
        ? Padding(
            // padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWidget(title: 'MOHIL BANSAL', size: 30),
                // FittedBox(
                //   child:
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...pageScrollers.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Scrollable.ensureVisible(
                              e['scrollController'].currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: FittedBox(
                            child: textWidget(
                                title: e['title'],
                                size: 20,
                                textColor: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
                socialMediaButton(
                    linkedIn, "https://www.linkedin.com/in/mohilbansal/"),
                socialMediaButton(
                    instagram, "https://www.instagram.com/mohil_bansal/"),
                socialMediaButton(gitHub, "https://github.com/luciferro01/"),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBackgroundColor,
                    elevation: 4,
                    shadowColor: headingTextColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: lineColor,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse('www.instagram.com/mohil_bansal/'));
                  },
                  child: FittedBox(
                    child: Row(
                      children: [
                        textWidget(
                            title: 'Contact Me',
                            size: 16,
                            textColor: whiteColor),
                        SvgPicture.asset(
                          mail,
                          width: 26,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // textWidget(title: 'MOHIL BANSAL', size: 30),
                const Text(
                  'MOHIL BANSAL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: headingTextColor,
                    overflow: TextOverflow.fade,
                  ),
                ),

                IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(
                    size: 38,
                    Icons.menu_rounded,
                    color: lightTextColor,
                  ),
                )
              ],
            ),
          );
  }
}
