// snap_master_portfolio_flutter.dart
// Single-file Flutter example to reproduce the "Snap Master" portfolio theme
// Responsive: mobile / tablet / desktop
// Dependencies (add to pubspec.yaml):
//   google_fonts: ^5.0.0
//   flutter_svg: ^2.0.7
// Assets: add your images to assets/images/ and declare in pubspec.yaml

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';
import 'package:my_portfolio/Ui/View/Header/header.dart';
import 'package:my_portfolio/Ui/View/Navbar/portfolioNavBar.dart';

void main() => runApp(SnapMasterApp());

class SnapMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thanveer Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF172412), // deep green background
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1100) {
            return DesktopLayout(
              scrollTo: _scrollTo,
              controller: _scrollController,
            );
          } else if (constraints.maxWidth >= 700) {
            return TabletLayout(
              onNavTap: _scrollTo,
              controller: _scrollController,
            );
          } else {
            return MobileLayout(
              onNavTap: _scrollTo,
              controller: _scrollController,
            );
          }
        },
      ),
    );
  }
}

// ---------------------- Shared widgets & constants ----------------------

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: kAccent,
        fontSize: 64,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
      ),
    );
  }
}

Widget roundedImage(String asset, {double size = 80}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      width: size,
      height: size,
      color: Colors.black26,
      child: Image.asset(asset, fit: BoxFit.cover),
    ),
  );
}

// ---------------------- About Section ----------------------
class AboutSection extends StatelessWidget {
  final bool isWide;
  const AboutSection({super.key, this.isWide = false}); // 👈 add super.key

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key, // 👈 ensures this widget is tied to the GlobalKey
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('about'),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Welcome to my world of visual storytelling. I am a passionate photographer dedicated to freezing moments in time — with a keen eye for detail and a love for authentic emotions.',
                  style: TextStyle(
                    color: kAccent.withOpacity(0.9),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),
              if (isWide) SizedBox(width: 24),
              if (isWide)
                Expanded(
                  child: Center(
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: kAccent.withOpacity(0.06),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/camera.png'),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------- Works List ----------------------
class WorksSection extends StatelessWidget {
  final bool compact;
  const WorksSection({super.key, this.compact = false}); // 👈 add super.key

  Widget _workTile(String year, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kAccent.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: TextStyle(
                  color: kAccent.withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              Text(title, style: TextStyle(color: kAccent.withOpacity(0.9))),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              side: BorderSide(color: kAccent.withOpacity(0.18)),
            ),
            onPressed: () {},
            child: Text('Discover', style: TextStyle(color: kAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key, // 👈 attach key for scroll
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('works'),
          SizedBox(height: 12),
          _workTile('2024', 'Unveiling Perspectives'),
          _workTile('2023', 'Real life'),
          _workTile('2023', 'Emotion Power'),
          _workTile('2022', 'Eye and eye'),
        ],
      ),
    );
  }
}

// ---------------------- Gallery ----------------------
class GallerySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('gallery'),
          SizedBox(height: 12),
          Container(
            height: 240,
            child: Center(
              child: Image.asset(
                'assets/images/hero_large.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roundedImage('assets/images/thumb1.jpg', size: 100),
              SizedBox(width: 14),
              roundedImage('assets/images/thumb2.jpg', size: 100),
              SizedBox(width: 14),
              roundedImage('assets/images/thumb3.jpg', size: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key}); // 👈 add super.key

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kAccent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTACT ME',
            style: TextStyle(
              color: kAccent,
              fontSize: 44,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Interested in working together? Drop a message and I will reply soon!',
            style: TextStyle(color: kAccent.withOpacity(0.9)),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('Send'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
          const HeroHeader(),

          PortfolioNavBar(
            onAboutTap: () => _scrollTo(SectionKeys.about),
            onWorksTap: () => _scrollTo(SectionKeys.works),
            onExperienceTap: () => _scrollTo(SectionKeys.experience),
            onContactTap: () => _scrollTo(SectionKeys.contact),
          ),

          AboutSection(isWide: false, key: SectionKeys.about),
          WorksSection(compact: true, key: SectionKeys.works),
          ExperienceSection(key: SectionKeys.experience),
          // GallerySection(),
          ContactSection(key: SectionKeys.contact),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

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

          AboutSection(isWide: true, key: SectionKeys.about),
          WorksSection(key: SectionKeys.works),
          ExperienceSection(key: SectionKeys.experience),
          GallerySection(),
          ContactSection(key: SectionKeys.contact),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

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
          WorksSection(key: SectionKeys.works),
          ExperienceSection(key: SectionKeys.experience),
          ContactSection(key: SectionKeys.contact),
        ],
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('experience'),
          const SizedBox(height: 12),
          Text(
            '3+ years of experience in Flutter & Web Development.\nWorked on mobile/web apps for startups and enterprises.',
            style: TextStyle(
              color: kAccent.withOpacity(0.9),
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
