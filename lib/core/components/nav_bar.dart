import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/constants/responsive.dart';
import 'package:portfolio/utils/widgets/buttons.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return isDesktop
        ? Padding(
            // padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: lightTextColor,
                  child: Text(
                    'M',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                          title: 'About', size: 20, textColor: whiteColor),
                      textWidget(
                          title: 'Skills', size: 20, textColor: whiteColor),
                      textWidget(
                          title: 'Projects', size: 20, textColor: whiteColor),
                      textWidget(
                          title: 'Experience', size: 20, textColor: whiteColor),
                      textWidget(
                          title: 'Contact Me', size: 20, textColor: whiteColor),
                    ],
                  ),
                ),
                socialMediaButton(
                    linkedIn, "https://www.linkedin.com/in/mohilbansal/"),
                socialMediaButton(
                    instagram, "https://www.instagram.com/mohil_bansal/"),
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
                  child: Row(
                    children: [
                      textWidget(
                          title: 'Contact Me', size: 16, textColor: whiteColor),
                      SvgPicture.asset(
                        instagram,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: lightTextColor,
                  child: Text(
                    'M',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      size: 30,
                      Icons.menu_rounded,
                      color: lightTextColor,
                    ))
              ],
            ),
          );
  }
}
