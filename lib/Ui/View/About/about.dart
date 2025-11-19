import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Ui/View/About/Widget/aboutImageBlock.dart';
import 'package:my_portfolio/Ui/Widgets/outlineButton.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    return Container(
      width: double.infinity,
      color: kDark,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Title Row (about + Learn More)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 0
                  : isTablet
                  ? screenWidth * 0.05
                  : screenWidth * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "about",
                  style: TextStyle(
                    fontSize: isMobile
                        ? 60
                        : isTablet
                        ? 90
                        : 120,
                    fontWeight: FontWeight.w800,
                    color: kAccent,
                    fontFamily: 'OpenSans',
                    letterSpacing: -4.5,
                    height: 1,
                  ),
                ),
                CustomOutlineButton(
                  text: "Learn More",
                  onPressed: () {
                    // 👉 Future routing or scroll action
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 About Description Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 0
                  : isTablet
                  ? screenWidth * 0.05
                  : screenWidth * 0.1,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: isMobile
                    ? screenWidth * 0.9
                    : isTablet
                    ? screenWidth * 0.6
                    : screenWidth * 0.4,
                child: RichText(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: isMobile ? 12 : 14,
                      color: kAccent.withOpacity(0.9),
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: "I’m "),
                      TextSpan(
                        text: "Ahmmed Thanveer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kAccent,
                        ),
                      ),
                      TextSpan(
                        text:
                            ", a professional software developer passionate about creating clean, functional, and high-performance digital experiences. With expertise in Flutter, React, and WordPress, I bring ideas to life with modern design and scalable code.\n\n",
                      ),
                      TextSpan(
                        text:
                            "I have over 3 years of hands-on experience in Flutter development, building seamless mobile apps with beautiful UI and reliable architecture. My workflow focuses on creativity, problem-solving, and delivering practical solutions that truly make an impact.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 🔹 Images + Camera Block
          AboutImageBlock(screenWidth: screenWidth),
        ],
      ),
    );
  }
}
