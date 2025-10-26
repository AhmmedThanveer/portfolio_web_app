import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';

class RetroLoadingScreen extends StatelessWidget {
  final double progress; // 0.0 → 1.0
  final int totalBlocks; // number of blocks in bar

  const RetroLoadingScreen({
    super.key,
    required this.progress,
    this.totalBlocks = 10, // default 10 pieces
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Decide screen type
    bool isMobile = size.width < 600;
    bool isTablet = size.width >= 600 && size.width < 1100;

    // Responsive values
    double blockSize = isMobile ? 20 : (isTablet ? 28 : 36);
    double spacing = 4;
    double fontSize = isMobile ? 22 : (isTablet ? 28 : 36);

    // Calculate how many blocks should be filled
    int filledBlocks = (progress * totalBlocks).floor();

    return Scaffold(
      backgroundColor: kDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ---- Loading Bar with single outer border ----
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: kAccent, width: 2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(totalBlocks, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: spacing / 2),
                    width: blockSize,
                    height: blockSize,
                    color: index < filledBlocks ? kAccent : Colors.transparent,
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // ---- LOADING Text with retro shadows ----
            Text(
              "LOADING",
              style: TextStyle(
                fontSize: fontSize,
                color: kAccent,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                shadows: [
                  Shadow(offset: Offset(2, 2), color: Colors.redAccent),
                  Shadow(offset: Offset(-2, -2), color: Colors.blueAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
