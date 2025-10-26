import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    final bool isTablet = screenWidth >= 700 && screenWidth < 1100;
    final bool isDesktop = screenWidth >= 1100;

    return Container(
      key: SectionKeys.services,
      width: double.infinity,
      color: kDark,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 50 : 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Section Heading
          Text(
            'services',
            style: TextStyle(
              fontFamily: "BebasNeue",
              fontWeight: FontWeight.w800,
              fontSize: isMobile
                  ? 60
                  : isTablet
                  ? 90
                  : 120,
              color: kAccent,
              // letterSpacing: -1,
              height: 1,
            ),
          ),

          const SizedBox(height: 40),

          // 🔹 Section Title & Description
          SizedBox(
            width: isMobile
                ? double.infinity
                : isTablet
                ? screenWidth * 0.7
                : screenWidth * 0.55,
            child: Column(
              children: [
                Text(
                  "What I Offer.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: isMobile
                        ? 28
                        : isTablet
                        ? 38
                        : 48,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "Delivering creative digital solutions — from high-performance apps and websites to reliable DevOps infrastructure — crafted to make your ideas thrive.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: kAccent.withOpacity(0.9),
                    fontSize: isMobile ? 13 : 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          // 🔹 Services Grid
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = 280;
              double spacing = 24;
              double runSpacing = 24;

              if (isMobile) {
                cardWidth = double.infinity;
                spacing = 0;
                runSpacing = 20;
              } else if (isTablet) {
                cardWidth = (screenWidth / 2) - 60;
                spacing = 20;
                runSpacing = 20;
              } else if (isDesktop) {
                cardWidth = 320;
                spacing = 60; // 👈 wider gap between cards for desktop
                runSpacing = 40;
              }

              return Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                alignment: WrapAlignment.center,
                children: [
                  _buildServiceCard(
                    context,
                    title: 'App Development',
                    iconPath: 'assets/images/app_dev.png',
                    description:
                        'Building scalable and visually appealing mobile apps with top-tier performance.',
                    width: cardWidth,
                    offsetY: 0,
                  ),
                  _buildServiceCard(
                    context,
                    title: 'Web Development',
                    iconPath: 'assets/images/web_dev.png',
                    description:
                        'Designing responsive, modern, and lightning-fast web experiences.',
                    width: cardWidth,
                    offsetY: isDesktop ? 20 : 0, // 👈 only stagger in desktop
                  ),
                  _buildServiceCard(
                    context,
                    title: 'DevOps & Server Handling',
                    iconPath: 'assets/images/devops.png',
                    description:
                        'Managing CI/CD pipelines, deployments, and scalable cloud infrastructure.',
                    width: cardWidth,
                    offsetY: 0,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Service Card
  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String iconPath,
    required String description,
    required double width,
    required double offsetY,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;

    return Transform.translate(
      offset: Offset(0, offsetY),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          height: isMobile ? 220 : 240,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kAccent.withOpacity(0.6), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: kAccent.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 48, height: 48, color: kAccent),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: kAccent.withOpacity(0.9),
                  fontSize: isMobile ? 12.5 : 13.5,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
