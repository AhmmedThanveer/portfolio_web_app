import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  // 🔗 Function to launch URL
  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double titleSize = screenWidth * 0.25;

    final bool isMobile = screenWidth < 700;
    final bool isTablet = screenWidth >= 700 && screenWidth < 1100;

    final double headerHeight = isMobile
        ? screenHeight * 0.50
        : isTablet
        ? screenHeight * 0.65
        : screenHeight * 0.70;

    final double userImageWidth = isMobile
        ? screenWidth * 0.5
        : isTablet
        ? screenWidth * 0.38
        : screenWidth * 0.25;

    final double userImageHeight = isMobile
        ? screenHeight * 0.30
        : isTablet
        ? screenHeight * 0.55
        : screenHeight * 0.55;

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
              // 📝 Large Title
              Positioned(
                top: isMobile
                    ? screenHeight * 0.22
                    : isTablet
                    ? screenHeight * 0.20
                    : screenHeight * 0.13,
                left: 0,
                right: 25,
                child: Text(
                  "PUB  DEV",
                  style: TextStyle(
                    color: const Color(0xFF172412),
                    fontSize: titleSize.clamp(60, 200),
                    fontWeight: FontWeight.w900,
                    fontFamily: "BebasNeue",
                    letterSpacing: isMobile ? 2.7 : 2,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // 🖼️ User Image
              Positioned(
                bottom: 0,
                left: isMobile ? 0 : 0,
                right: isMobile ? 30 : 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/me.png',
                    width: userImageWidth.clamp(120, 380),
                    height: userImageHeight.clamp(160, 480),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // 📜 Right-side Bio (Short)
              Positioned(
                right: 10,
                top: isMobile
                    ? screenHeight * 0.40
                    : isTablet
                    ? screenHeight * 0.55
                    : screenHeight * 0.40,
                width: bioWidthRight.clamp(100, 300),
                child: Text(
                  "What makes my work unique is a blend of technical expertise and personal creativity.",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (screenWidth * 0.012).clamp(10, 18),
                    height: 1.4,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),

              // 🤝 Left Bio + Social Media Icons
              Positioned(
                left: 40,
                top: isMobile
                    ? screenHeight * 0.05
                    : isTablet
                    ? screenHeight * 0.10
                    : screenHeight * 0.15,
                width: bioWidthLeft.clamp(100, 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Immerse yourself in the world of development where every project tells a story of innovation.",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: (screenWidth * 0.012).clamp(10, 18),
                        height: 1.4,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 🔗 Social Buttons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: kDark,
                          onPressed: () {
                            _openUrl(
                              "https://www.linkedin.com/in/thanveerahmmad?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app",
                            );
                          },
                        ),

                        IconButton(
                          icon: const Icon(FontAwesomeIcons.instagram),
                          color: kDark,
                          onPressed: () {
                            _openUrl(
                              "https://www.instagram.com/thanveer_?igsh=MTBncmRkZm5odHJrbg%3D%3D&utm_source=qr",
                            );
                          },
                        ),

                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: kDark,
                          onPressed: () {
                            _openUrl(
                              "https://www.facebook.com/share/1Ai1AVwC46/?mibextid=wwXIfr",
                            );
                          },
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
