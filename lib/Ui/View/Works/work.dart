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
    final isDesktop = screenWidth >= 1100;

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
                    "works",
                    style: const TextStyle(
                      fontFamily: "BebasNeue",
                      // fontWeight: FontWeight.w800,
                      fontSize: 120,
                      fontWeight: FontWeight.w800,
                      color: kAccent,
                      // letterSpacing: -5,
                      height: 1,
                    ).copyWith(fontSize: isMobile ? 60 : (isTablet ? 90 : 120)),
                  ),

                  // Button
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
                "Explore a curated collection of images that traverse landscapes, emotions, and narratives. "
                "From the intimate to the grandiose, witness the power of photography to evoke emotions.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: isMobile ? 13 : 15,
                  color: kAccent.withOpacity(0.9),
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ---- Big Image ----
            ClipRRect(
              child: Image.asset(
                "assets/images/wrk2.JPG",
                width: double.infinity,
                height: isMobile
                    ? 220
                    : isTablet
                    ? 400
                    : 600,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low, // ✅ web performance optimized
              ),
            ),

            const SizedBox(height: 40),

            // ---- Thumbnails + Arrows ----
            Column(
              children: [
                // Thumbnails row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _roundedImage("assets/images/wrk1.JPG", isMobile, isTablet),
                    const SizedBox(width: 20),
                    _roundedImage("assets/images/wrk2.JPG", isMobile, isTablet),
                    const SizedBox(width: 20),
                    _roundedImage("assets/images/wrk3.JPG", isMobile, isTablet),
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

  Widget _roundedImage(String path, bool isMobile, bool isTablet) {
    final double size = isMobile
        ? 90.0
        : (isTablet ? 140.0 : 180.0); // 👈 added .0 to make it double

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.low, // ✅ improves web rendering
      ),
    );
  }

  /// Small circle arrow buttons
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
