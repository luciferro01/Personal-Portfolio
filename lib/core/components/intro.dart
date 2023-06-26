import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/utils/widgets/buttons.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/responsive.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  Column aboutMe(
      BuildContext context, bool isTablet, bool isMobile, double size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textWidget(
          title: 'Hello, I\'m',
          size: size,
          textColor: whiteColor,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(
              title: '<',
              size: size + 20,
              textColor: lineColor,
            ),
            textWidget(
              title: 'MOHIL',
              size: size,
              textColor: headingTextColor,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isTablet
                ? MediaQuery.of(context).size.width * 0.24
                : isMobile
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width * 0.12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'BANSAL',
                    textStyle: TextStyle(
                      fontSize: size,
                      color: headingTextColor,
                    ),
                    speed: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeInOutCirc,
                  ),
                ],
              ),
              textWidget(
                title: '/>',
                size: size + 20,
                textColor: lineColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FittedBox(
          child: textWidget(
            title: 'Software Engineer',
            size: size,
            textColor: whiteColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        IntrinsicWidth(
          // width: 170,
          child: clickButton('Resume', download, lineColor, whiteColor, () {
            launchUrl(Uri.parse('url'));
          }),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  Stack picDisplay() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.fill,
        ),
        // Image.asset(
        //   "assets/images/mohil.png",
        //   fit: BoxFit.fitHeight,
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: !isDesktop
          ? const EdgeInsets.only(top: 40)
          : const EdgeInsets.only(top: 10, left: 20),
      child: isTablet || isMobile
          ? Column(
              children: [
                aboutMe(context, isTablet, isMobile, isMobile ? 30 : 40),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: picDisplay()),
                Container(
                  height: 6,
                  color: lineColor,
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: aboutMe(context, false, false, 50),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.42,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: picDisplay(),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 6,
                  color: lineColor,
                ),
              ],
            ),
    );
  }
}
