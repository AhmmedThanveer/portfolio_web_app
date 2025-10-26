import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';
import 'package:my_portfolio/Ui/View/About/about.dart';
import 'package:my_portfolio/Ui/View/Contact/contact.dart';
import 'package:my_portfolio/Ui/View/Experience/experience.dart';
import 'package:my_portfolio/Ui/View/Header/header.dart';
import 'package:my_portfolio/Ui/View/Navbar/portfolioNavBar.dart';
import 'package:my_portfolio/Ui/View/Services/services.dart';
import 'package:my_portfolio/Ui/View/Works/work.dart';

class MobileLayout extends StatefulWidget {
  final Function(GlobalKey) onNavTap;
  final ScrollController controller;

  const MobileLayout({
    super.key,
    required this.onNavTap,
    required this.controller,
  });

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroHeader(),

          // 🔹 Navigation bar for mobile
          PortfolioNavBar(
            onAboutTap: () => _scrollTo(SectionKeys.about),
            onWorksTap: () => _scrollTo(SectionKeys.works),
            onExperienceTap: () => _scrollTo(SectionKeys.experience),
            onContactTap: () => _scrollTo(SectionKeys.contact),
          ),

          // 🔹 Section widgets
          AboutSection(key: SectionKeys.about),
          ServicesSection(key: SectionKeys.services),
          ExperienceSection(key: SectionKeys.experience),
          WorksSection(key: SectionKeys.works),
          ContactSection(key: SectionKeys.contact),

          const SizedBox(height: 60),

          // 🔹 Optional footer
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "© 2025 Ahmmed Thanveer PM — All rights reserved",
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
