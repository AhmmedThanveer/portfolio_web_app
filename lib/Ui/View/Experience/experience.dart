import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/State/Cubit/experience_cubit.dart';
import 'package:my_portfolio/Ui/Widgets/outlineButton.dart';

class ExperienceSection extends StatelessWidget {
  final bool compact;
  const ExperienceSection({super.key, this.compact = false});

  Widget _experienceTile({
    required String logoPath,
    required String company,
    required String year,
    required String description,
    required bool isSelected,
    required bool isMobile,
    required bool isTablet,
    required double screenWidth,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 14),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: isSelected
              ? BorderRadius.circular(12)
              : BorderRadius.circular(0),
          border: Border(
            top: BorderSide(
              color: isSelected
                  ? Colors.transparent
                  : kAccent.withOpacity(0.12),
              width: 1,
            ),
            bottom: BorderSide(
              color: isSelected
                  ? Colors.transparent
                  : kAccent.withOpacity(0.12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Company Logo with selection highlight
            Container(
              width: isMobile ? 60 : 80,
              height: isMobile ? 60 : 80,
              decoration: BoxDecoration(
                color: isSelected ? kDark : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : kAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(logoPath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 24),

            // 🔹 Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: isMobile ? 20 : 22,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? Colors.black : kAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    year,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Colors.black.withOpacity(0.85)
                          : kAccent.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: isMobile
                          ? 12
                          : isTablet
                          ? 13
                          : 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: isSelected
                          ? Colors.black.withOpacity(0.85)
                          : kAccent.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    final experiences = [
      {
        "logo": "assets/images/amaekalogo.png",
        "company": "Amaeka",
        "year": "2024 – Present",
        "desc":
            "Collaborating with cross-functional teams to build high-performance mobile applications using Flutter, MVVM, and Clean Architecture. Integrated Firebase services, third-party SDKs, and deployed multiple apps to the Play Store.",
      },
      {
        "logo": "assets/images/edaptlogo.png",
        "company": "Edapt",
        "year": "2023 – 2024",
        "desc":
            "Contributed to developing cross-platform Android and iOS applications using Flutter and Firebase. Focused on building scalable, real-time solutions with clean, testable code following best practices.",
      },
      {
        "logo": "assets/images/datacubelogo.png",
        "company": "Datacube",
        "year": "2022 – 2023",
        "desc":
            "Collaborated within a dynamic team to design and implement intuitive, user-friendly interfaces for web and mobile applications. Focused on UI/UX design, problem-solving, and team-driven development to enhance usability and overall product quality.",
      },
    ];

    return BlocProvider(
      create: (_) => ExperienceCubit(),
      child: BlocBuilder<ExperienceCubit, int>(
        builder: (context, selectedIndex) {
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
                // 🔹 Header
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
                      if (!isMobile)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomOutlineButton(
                              text: "View All",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      Text(
                        "Experience",
                        style: TextStyle(
                          fontFamily: "BebasNeue",
                          fontSize: isMobile ? 60 : (isTablet ? 80 : 110),
                          color: kAccent,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 🔹 Experience List
                for (int i = 0; i < experiences.length; i++)
                  _experienceTile(
                    logoPath: experiences[i]["logo"]!,
                    company: experiences[i]["company"]!,
                    year: experiences[i]["year"]!,
                    description: experiences[i]["desc"]!,
                    isSelected: selectedIndex == i,
                    isMobile: isMobile,
                    isTablet: isTablet,
                    screenWidth: screenWidth,
                    onTap: () =>
                        context.read<ExperienceCubit>().selectExperience(i),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
