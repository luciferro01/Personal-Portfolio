import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_constants.dart';
import '../widgets/text_widget.dart';

Widget socialMediaButton(String icon, String lauchUrl) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkBackgroundColor,
      elevation: 4,
      shadowColor: headingTextColor,
      padding: const EdgeInsets.all(17),
      shape: const CircleBorder(),
    ),
    onPressed: () {
      launchUrl(
        mode: LaunchMode.platformDefault,
        Uri.parse(lauchUrl),
      );
    },
    child: SvgPicture.asset(
      icon,
      width: 20,
    ),
  );
}

Widget clickButton(String title, String icon, Color backgroundColor,
    Color borderColor, String url) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      elevation: 4,
      shadowColor: headingTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    onPressed: () {
      launchUrl(Uri.parse(url));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 30,
        ),
        textWidget(title: title, size: 20, textColor: whiteColor),
      ],
    ),
  );
}
