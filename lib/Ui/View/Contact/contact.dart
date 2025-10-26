import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : (isTablet ? 70 : 100),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: isMobile ? 50 : (isTablet ? 70 : 100),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/contactbg.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Title
            Center(
              child: Text(
                'CONTACT ME',
                style: TextStyle(
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.w800,
                  color: kDark,
                  fontSize: isMobile ? 70 : (isTablet ? 120 : 160),
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Subtitle
            Text(
              "I'm Ahmmed Thanveer — I provide Web and App Server Solutions. "
              "Whether you have a project in mind or just want to collaborate, feel free to connect!",
              style: TextStyle(
                fontFamily: "OpenSans",
                color: kDark,
                fontSize: isMobile ? 15 : (isTablet ? 16 : 18),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            // 🔹 Contact Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.email, color: kDark, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'thanveeipk@gmail.com',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: kDark,
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.phone, color: kDark, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '+91 77368 34352',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: kDark,
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // 🔹 Social Media Icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.linkedin),
                  color: kDark,
                  iconSize: isMobile ? 22 : 28,
                  onPressed: () {
                    // TODO: Add your LinkedIn link
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.instagram),
                  color: kDark,
                  iconSize: isMobile ? 22 : 28,
                  onPressed: () {
                    // TODO: Add your Instagram link
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.facebook),
                  color: kDark,
                  iconSize: isMobile ? 22 : 28,
                  onPressed: () {
                    // TODO: Add your Facebook link
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.github),
                  color: kDark,
                  iconSize: isMobile ? 22 : 28,
                  onPressed: () {
                    // TODO: Add your GitHub link
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),

            // 🔹 Contact Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDark,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 30 : 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // TODO: Implement mailto or contact form
              },
              child: Text(
                'Get In Touch',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
