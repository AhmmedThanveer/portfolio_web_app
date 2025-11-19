import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Ui/Widgets/outlineButton.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        color: kDark,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ---- Title + Button ----
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 30
                    : isTablet
                    ? screenWidth * 0.05
                    : screenWidth * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Title
                  Text(
                    "Projects",
                    style: const TextStyle(
                      fontFamily: "BebasNeue",
                      fontWeight: FontWeight.w800,
                      color: kAccent,
                      height: 1,
                    ).copyWith(fontSize: isMobile ? 60 : (isTablet ? 90 : 120)),
                  ),

                  if (!isMobile)
                    CustomOutlineButton(text: "View All", onPressed: () {}),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---- Description ----
            SizedBox(
              width: isMobile
                  ? screenWidth * 0.9
                  : isTablet
                  ? screenWidth * 0.6
                  : screenWidth * 0.4,
              child: Text(
                "A collection of my professional and personal projects built using Flutter, React, and WordPress. "
                "These projects highlight my ability to build modern, scalable and user-friendly applications.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: isMobile ? 13 : 15,
                  color: kAccent.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ---- Big Image ----
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(isMobile ? 0 : 20),
              child: Image.asset(
                "assets/images/Wrk4.jpg",
                width: isMobile
                    ? double.infinity
                    : isTablet
                    ? 400
                    : 1200,

                height: isMobile
                    ? 220
                    : isTablet
                    ? 400
                    : 600,
                fit: isMobile ? BoxFit.fill : BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),

            const SizedBox(height: 40),

            // ---- Project Cards ----
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _projectTile(
                      "assets/images/wrk5.jpg",
                      "SafeAgent — Real Estate Rentals",
                      "Real estate rental portal with maintenance service features & client dashboard.",
                      isMobile,
                      isTablet,
                    ),
                    const SizedBox(width: 20),
                    _projectTile(
                      "assets/images/wrk2.jpg",
                      "Quizo — Quiz Application",
                      "A Flutter-based quiz app with category selection, scoring & animations.",
                      isMobile,
                      isTablet,
                    ),
                    const SizedBox(width: 20),
                    _projectTile(
                      "assets/images/wrk3.jpg",
                      "The Growth Companion LMS",
                      "Learning Management System with video lessons, coaching modules & progress tracking.",
                      isMobile,
                      isTablet,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Arrows row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _circleArrowButton(Icons.arrow_back),
                    _circleArrowButton(Icons.arrow_forward),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- Project Tile -------------------
  Widget _projectTile(
    String path,
    String title,
    String subtitle,
    bool isMobile,
    bool isTablet,
  ) {
    final double size = isMobile ? 90.0 : (isTablet ? 140.0 : 180.0);

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            path,
            width: size,
            height: size,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: size + 20,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kAccent,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 11 : 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kAccent.withOpacity(0.7),
                  fontFamily: "Montserrat",
                  fontSize: isMobile ? 9 : 10,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // -------------------- Arrow Buttons --------------------
  Widget _circleArrowButton(IconData icon) {
    return SizedBox(
      width: 28,
      height: 28,
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          side: const BorderSide(color: kAccent, width: 1),
        ),
        onPressed: () {},
        icon: Icon(icon, color: kAccent, size: 16),
      ),
    );
  }
}
