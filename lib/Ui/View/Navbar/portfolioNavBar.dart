import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';

class PortfolioNavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onWorksTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const PortfolioNavBar({
    super.key,
    required this.onAboutTap,
    required this.onWorksTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive sizes
    double fontSize;
    double spacing;

    if (width >= 1100) {
      // Desktop
      fontSize = 15;
      spacing = 80;
    } else if (width >= 700) {
      // Tablet
      fontSize = 13;
      spacing = 40;
    } else {
      // Mobile
      fontSize = 12;
      spacing = 25;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navButton("About", onAboutTap, fontSize),
          SizedBox(width: spacing),
          _navButton("Works", onWorksTap, fontSize),
          SizedBox(width: spacing),
          _navButton("Experience", onExperienceTap, fontSize),
          SizedBox(width: spacing),
          _navButton("Contact", onContactTap, fontSize),
        ],
      ),
    );
  }

  Widget _navButton(String label, VoidCallback onTap, double fontSize) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          // fontWeight: FontWeight.w500,
          color: kAccent,
        ),
      ),
    );
  }
}
