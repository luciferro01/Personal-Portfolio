import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/components/about_me.dart';
import 'package:portfolio/core/components/intro.dart';
import 'package:portfolio/core/components/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: darkBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            Intro(),
            AboutMe(),
          ],
        ),
      ),
    );
  }
}
