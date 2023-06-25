import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

class Footer extends StatelessWidget {
  Footer({super.key});
  Widget textWidgetForFooter(
      {required String title,
      required double size,
      Color textColor = headingTextColor,
      FontWeight? fontWeight}) {
    return Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidgetForFooter(
                title: 'Created With ', size: 20, textColor: whiteColor),
            textWidgetForFooter(
              title: '💗 and ☕',
              size: 20,
            ),
            textWidgetForFooter(title: 'by ', size: 20),
            textWidgetForFooter(title: '< ', size: 26),
            textWidgetForFooter(
                title: 'MOHIL BANSAL',
                size: 26,
                textColor: lineColor,
                fontWeight: FontWeight.bold),
            textWidgetForFooter(title: ' />', size: 26),
          ],
        ),
      ),
    );
  }
}
