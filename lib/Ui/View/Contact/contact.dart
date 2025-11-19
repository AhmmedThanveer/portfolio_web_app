import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // ✔ Mobile-friendly scaling (smaller and compact)
    final isMobile = width < 700;
    final baseFont = isMobile ? 13.0 : 16.0;
    final titleFont = isMobile ? 55.0 : 180.0;
    final iconSize = isMobile ? 20.0 : 28.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 50,
        vertical: isMobile ? 25 : 70,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 70,
          vertical: isMobile ? 30 : 80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/contactbg.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            // ---------- TITLE ----------
            Center(
              child: Text(
                'CONTACT ME',
                style: TextStyle(
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.w900,
                  color: kDark,
                  fontSize: titleFont,
                  height: 1,
                  letterSpacing: 1.0,
                ),
              ),
            ),

            SizedBox(height: isMobile ? 15 : 25),

            // ---------- SUBTITLE ----------
            Text(
              "I'm Ahmmed Thanveer — I build Web & App Server Solutions.\n"
              "Have a project or want to collaborate? Let's connect!",
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontFamily: "OpenSans",
                color: kDark,
                fontSize: baseFont,
                height: 1.4,
              ),
            ),

            SizedBox(height: isMobile ? 25 : 35),

            // ---------- CONTACT DETAILS ----------
            Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                _ContactRow(
                  icon: Icons.email,
                  text: 'thanveeipk@gmail.com',
                  iconSize: iconSize,
                  fontSize: baseFont,
                  isCentered: isMobile,
                ),
                const SizedBox(height: 10),
                _ContactRow(
                  icon: Icons.phone,
                  text: '+91 77368 34352',
                  iconSize: iconSize,
                  fontSize: baseFont,
                  isCentered: isMobile,
                ),
              ],
            ),

            SizedBox(height: isMobile ? 25 : 40),

            // ---------- SOCIAL MEDIA ----------
            Wrap(
              alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
              spacing: 18,
              children: [
                _socialIcon(
                  FontAwesomeIcons.linkedin,
                  'https://www.linkedin.com/in/ahmmedthanveer/',
                ),
                _socialIcon(
                  FontAwesomeIcons.instagram,
                  'https://www.instagram.com/ahmmed_thanveer/',
                ),
                _socialIcon(
                  FontAwesomeIcons.facebook,
                  'https://www.facebook.com/ahmmedthanveer',
                ),
                _socialIcon(
                  FontAwesomeIcons.github,
                  'https://github.com/AhmmedThanveer',
                ),
              ],
            ),

            SizedBox(height: isMobile ? 25 : 40),

            // ---------- DOWNLOAD CV ----------
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDark,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 28 : 45,
                    vertical: isMobile ? 12 : 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  const cvUrl =
                      'https://yourwebsite.com/assets/AhmmedThanveerCV.pdf';
                  if (await canLaunchUrl(Uri.parse(cvUrl))) {
                    await launchUrl(
                      Uri.parse(cvUrl),
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                child: Text(
                  'Download My CV',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: baseFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- CONTACT ROW ----------
  Widget _ContactRow({
    required IconData icon,
    required String text,
    required double iconSize,
    required double fontSize,
    bool isCentered = false,
  }) {
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: kDark, size: iconSize),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: kDark,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );

    return isCentered ? Center(child: row) : row;
  }

  // ---------- SOCIAL ICON ----------
  Widget _socialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: kDark),
      iconSize: 26,
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
