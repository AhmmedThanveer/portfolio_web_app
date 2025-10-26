import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';
import 'package:my_portfolio/Ui/View/About/about.dart';
import 'package:my_portfolio/Ui/View/Contact/contact.dart';
import 'package:my_portfolio/Ui/View/Experience/experience.dart';
import 'package:my_portfolio/Ui/View/Header/header.dart';
import 'package:my_portfolio/Ui/View/Navbar/portfolioNavBar.dart';
import 'package:my_portfolio/Ui/View/Services/services.dart';
import 'package:my_portfolio/Ui/View/Works/work.dart';
import 'package:my_portfolio/main.dart';

class DesktopLayout extends StatelessWidget {
  final ScrollController controller;
  final Function(GlobalKey) scrollTo;

  const DesktopLayout({
    super.key,
    required this.controller,
    required this.scrollTo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          const HeroHeader(),

          // 👇 NavBar comes here (only once, right after HeroHeader)
          PortfolioNavBar(
            onAboutTap: () => scrollTo(SectionKeys.about),
            onWorksTap: () => scrollTo(SectionKeys.works),
            onExperienceTap: () => scrollTo(SectionKeys.experience),
            onContactTap: () => scrollTo(SectionKeys.contact),
          ),

          AboutSection(key: SectionKeys.about),
          ServicesSection(key: SectionKeys.services),

          ExperienceSection(key: SectionKeys.experience),
          WorksSection(key: SectionKeys.works),
          ContactSection(key: SectionKeys.contact),
        ],
      ),
    );
  }
}
