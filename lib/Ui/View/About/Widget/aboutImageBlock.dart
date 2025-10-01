import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';

/// 🔹 Camera block with arrows outside
class AboutImageBlock extends StatelessWidget {
  final double screenWidth;
  const AboutImageBlock({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    // Sizes responsive
    final double circleSize = isMobile
        ? 220
        : isTablet
        ? 300
        : 380;

    final double imageSize = isMobile
        ? 160
        : isTablet
        ? 220
        : 380;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left Arrow
        _circleArrowButton(Icons.arrow_back),

        SizedBox(
          width: isMobile
              ? 30
              : isTablet
              ? screenWidth *
                    0.08 // Tablet -> a bit of padding
              : screenWidth * 0.12, // Desktop -> more center 16),
        ),

        // Camera inside circular background
        Image.asset(
          "assets/images/about.PNG",
          width: imageSize,
          fit: BoxFit.cover,
        ),

        SizedBox(
          width: isMobile
              ? 30
              : isTablet
              ? screenWidth *
                    0.08 // Tablet -> a bit of padding
              : screenWidth * 0.12, // Desktop -> more center 16),
        ),
        // Right Arrow
        _circleArrowButton(Icons.arrow_forward),
      ],
    );
  }

  /// Circle arrow button widget
  Widget _circleArrowButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kAccent, width: 0.8),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: kAccent),
      ),
    );
  }
}
