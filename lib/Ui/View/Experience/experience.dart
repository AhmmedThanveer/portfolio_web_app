import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Ui/Widgets/outlineButton.dart';

class WorksSection extends StatelessWidget {
  final bool compact;
  const WorksSection({super.key, this.compact = false});

  Widget _workTile({
    required String year,
    required String title,
    required String description,
    bool isSelected = false,
    required bool isMobile,
    required bool isTablet,
    required double screenWidth,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: isSelected
            ? BorderRadius.circular(22)
            : BorderRadius.circular(0),
        border: Border(
          top: BorderSide(
            color: isSelected ? Colors.transparent : kAccent.withOpacity(0.12),
            width: 1,
          ),
          bottom: BorderSide(
            color: isSelected ? Colors.transparent : kAccent.withOpacity(0.12),
            width: 1,
          ),
        ),
        image: isSelected
            ? const DecorationImage(
                image: AssetImage("assets/images/expbuttonbg.JPG"),
                fit: BoxFit.cover,
              )
            : null,
        color: isSelected ? null : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Left Side (Year + Title + Description)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? Colors.black87
                        : kAccent.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.black : kAccent,
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: isMobile
                      ? screenWidth * 0.85
                      : isTablet
                      ? screenWidth * 0.6
                      : 400,
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: isSelected
                          ? Colors.black.withOpacity(0.85)
                          : kAccent.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // 🔹 Discover Button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Colors.black87 : Colors.transparent,
              side: BorderSide(
                color: isSelected
                    ? Colors.transparent
                    : kAccent.withOpacity(0.4),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            ),
            onPressed: () {},
            child: Text(
              "Discover",
              style: GoogleFonts.montserrat(color: kAccent, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    return Container(
      width: double.infinity,
      color: kDark,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header Row
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
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  "works",
                  style: GoogleFonts.openSans(
                    fontSize: isMobile ? 60 : (isTablet ? 80 : 110),
                    fontWeight: FontWeight.w800,
                    color: kAccent,
                    letterSpacing: -5,
                    height: 1,
                  ),
                ),
                if (!isMobile)
                  CustomOutlineButton(text: "View All", onPressed: () {}),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 🔹 Description
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 0
                  : isTablet
                  ? screenWidth * 0.05
                  : screenWidth * 0.1,
            ),
            child: Align(
              alignment: isMobile
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: SizedBox(
                width: isMobile
                    ? screenWidth * 0.9
                    : isTablet
                    ? 500
                    : 600,
                child: Text(
                  "Browse through a diverse works showcasing a blend of candid "
                  "moments, stunning landscapes, and captivating portraits. "
                  "The world through the eyes of a dedicated visual storyteller",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kAccent.withOpacity(0.8),
                    height: 1.6,
                  ),
                  textAlign: isMobile ? TextAlign.left : TextAlign.right,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // 🔹 Works List
          _workTile(
            year: "2024",
            title: "Unveiling Perspectives",
            description:
                "Experience the magic of the exhibition firsthand, mingle with fellow art enthusiasts, and engage in conversations with the artist",
            isMobile: isMobile,
            isTablet: isTablet,
            screenWidth: screenWidth,
          ),
          _workTile(
            year: "2023",
            title: "Real Me",
            description:
                "Gain a deeper understanding of the stories behind the images and the artistic choices that bring them to life",
            isMobile: isMobile,
            isTablet: isTablet,
            screenWidth: screenWidth,
          ),
          _workTile(
            year: "2023",
            title: "Emotion Power",
            description:
                "Witness the power of photography to evoke emotions and stir the soul. Each photograph is a visual poem",
            isSelected: true,
            isMobile: isMobile,
            isTablet: isTablet,
            screenWidth: screenWidth,
          ),
          _workTile(
            year: "2022",
            title: "Eye and eye",
            description:
                "Keen eye and unique perspective breathe life into each photograph, inviting viewers to see the world through a new, captivating lens",
            isMobile: isMobile,
            isTablet: isTablet,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }
}
