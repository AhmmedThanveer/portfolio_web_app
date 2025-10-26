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
          // 🔹 Top Row => about + Learn More
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 0
                  : isTablet
                  ? screenWidth *
                        0.05 // Tablet -> a bit of padding
                  : screenWidth * 0.1, // Desktop -> more center
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
                    fontWeight: FontWeight.w800, // ExtraBold
                    color: kAccent,
                    fontFamily: 'OpenSans',
                    letterSpacing: -4.5,
                    height: 1,
                  ),
                ),
                CustomOutlineButton(
                  text: "Learn More",
                  onPressed: () {
                    // 👉 Do something
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Right side description text
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 0
                  : isTablet
                  ? screenWidth *
                        0.05 // Tablet -> a bit of padding
                  : screenWidth * 0.1, // Desktop -> more center
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: isMobile
                    ? screenWidth * 0.9
                    : isTablet
                    ? screenWidth * 0.6
                    : screenWidth * 0.4,
                child: Text(
                  "Welcome to my world of visual storytelling. I am Hanz Schumacher, "
                  "a passionate photographer dedicated to freezing moments in time. "
                  "With a keen eye for detail and a love for authentic emotions.",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: isMobile ? 12 : 14,
                    color: kAccent.withOpacity(0.9),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          // 🔹 Camera + Arrows
          AboutImageBlock(screenWidth: screenWidth),
        ],
      ),
    );
  }
}
