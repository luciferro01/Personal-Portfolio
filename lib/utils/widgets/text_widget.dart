import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

Widget textWidget(
    {required String title,
    required double size,
    Color textColor = headingTextColor}) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      // vertical: 10,
    ),
    child: Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: size,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}
