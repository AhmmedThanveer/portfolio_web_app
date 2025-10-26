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

class TabletLayout extends StatefulWidget {
  final Function(GlobalKey) onNavTap;
  final ScrollController controller;

  const TabletLayout({
    super.key,
    required this.onNavTap,
    required this.controller,
  });

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Column(
        children: [
          const HeroHeader(),

          PortfolioNavBar(
            onAboutTap: () => _scrollTo(SectionKeys.about),
            onWorksTap: () => _scrollTo(SectionKeys.works),
            onExperienceTap: () => _scrollTo(SectionKeys.experience),
            onContactTap: () => _scrollTo(SectionKeys.contact),
          ),

          AboutSection(key: SectionKeys.about),
          ServicesSection(key: SectionKeys.services),

          ExperienceSection(key: SectionKeys.experience),
          WorksSection(key: SectionKeys.works),
          // GallerySection(),
          ContactSection(key: SectionKeys.contact),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
