import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(title: 'About Me', size: 30),
            textWidget(title: '( )', size: 30, textColor: whiteColor),
          ],
        ),
      ],
    );
  }
}
