import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/components/contact_me.dart';
import 'package:portfolio/core/components/experience.dart';
import 'package:portfolio/core/components/intro.dart';
import 'package:portfolio/core/components/nav_bar.dart';

import '../components/about_me.dart';
import '../components/footer.dart';
import '../components/tech_stack.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _experienceKey = GlobalKey();
  // final GlobalKey _projects = GlobalKey();
  final GlobalKey _contactMe = GlobalKey();
  final GlobalKey _skills = GlobalKey();
  final GlobalKey _aboutMe = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkBackgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: Column(
            children: [
              NavBar(
                aboutMe: _aboutMe,
                scrollController: _scrollController,
                contactMe: _contactMe,
                experienceKey: _experienceKey,
                // projects: _projects,
                skills: _skills,
              ),
              const Intro(),
              AboutMe(aboutMe: _aboutMe),
              TechStack(skills: _skills),
              Experience(experienceKey: _experienceKey),
              ContactMe(contactMe: _contactMe),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
