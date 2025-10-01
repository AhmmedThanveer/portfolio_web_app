import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Sizes responsive to screen
    final double titleSize = screenWidth * 0.25; // "PUB DEV"

    // Different sizes for mobile vs larger screens
    final bool isMobile = screenWidth < 700;
    final bool isTablet = screenWidth >= 700 && screenWidth < 1100;
    // 🔹 Header height responsive
    final double headerHeight = isMobile
        ? screenHeight *
              0.50 // 👈 shorter for mobile
        : isTablet
        ? screenHeight *
              0.65 // 👈 medium for tablets
        : screenHeight * 0.70; // 👈 slightly taller for desktops

    // final bool isDesktop = screenWidth >= 1100;
    // 🖼️ User image sizes
    final double userImageWidth = isMobile
        ? screenWidth *
              0.5 // Bigger on mobile
        : isTablet
        ? screenWidth *
              0.38 // Medium size on tablets
        : screenWidth * 0.25; // Smaller on desktop

    final double userImageHeight = isMobile
        ? screenHeight *
              0.30 // 📱 mobile
        : isTablet
        ? screenHeight *
              0.55 // 📊 tablet (in-between)
        : screenHeight * 0.55; // 🖥️ desktop
    final double bioWidthLeft = screenWidth * 0.35;
    final double bioWidthRight = screenWidth * 0.2;
    return Center(
      key: SectionKeys.hero,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: headerHeight.clamp(380, 650),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/hero_large.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 📝 Big text ABOVE image
              // 📝 Big text ABOVE image
              Positioned(
                top: isMobile
                    ? screenHeight *
                          0.22 // 👈 less gap on mobile
                    : isTablet
                    ? screenHeight *
                          0.2 // Tablet → move a bit higher
                    : screenHeight * 0.08, // normal for larger screens
                // top: isMobile
                //     ? screenHeight *
                //           0.28 // 👈 less gap on mobile
                //     : screenHeight * 0.08, // normal for larger screens
                left: 0,
                right: 30,
                child: Text(
                  "PUB  DEV",
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                      color: const Color(0xFF172412),
                      fontSize: titleSize.clamp(60, 200),
                      fontWeight: FontWeight.w900,
                      letterSpacing: isMobile ? 2.7 : 2,
                      height: 1,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // 🖼️ User Image FIRST → goes behind
              Positioned(
                bottom: 0,
                left: isMobile ? 0 : 0, // 👈 shift right slightly in mobile
                right: isMobile ? 30 : 0, // 👈 shift right slightly in mobile
                child: Center(
                  child: Image.asset(
                    'assets/images/user.png',
                    width: userImageWidth.clamp(120, 380),
                    height: userImageHeight.clamp(160, 480),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // 📜 Left bio text
              Positioned(
                right: 10,
                top: isMobile
                    ? screenHeight *
                          0.4 // 👈 higher on mobile
                    : isTablet
                    ? screenHeight *
                          0.55 // Tablet → move a bit higher
                    : screenHeight * 0.40,
                // top: isMobile
                //     ? screenHeight *
                //           0.45 // 👈 higher on mobile
                //     : screenHeight * 0.40, // desktop/tablet
                width: bioWidthRight.clamp(100, 300),
                child: Text(
                  "What makes my work unique is a blend of technical expertise and personal creativity.",
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: (screenWidth * 0.012).clamp(10, 18),
                      height: 1.4,
                    ),
                  ),
                ),
              ),

              // Detect screen types

              // 🤝 Right bio + social icons
              Positioned(
                left: 40,
                top: isMobile
                    ? screenHeight *
                          0.05 // Mobile → very close to top
                    : isTablet
                    ? screenHeight *
                          0.10 // Tablet → move a bit higher
                    : screenHeight * 0.15, // Desktop → normal
                width: bioWidthLeft.clamp(100, 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Immerse yourself in the world of development where every project tells a story of innovation.",
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: (screenWidth * 0.012).clamp(10, 18),
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: kDark,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.instagram),
                          color: kDark,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: kDark,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
