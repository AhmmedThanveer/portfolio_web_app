// snap_master_portfolio_flutter.dart
// Single-file Flutter example to reproduce the "Snap Master" portfolio theme
// Responsive: mobile / tablet / desktop
// Dependencies (add to pubspec.yaml):
//   google_fonts: ^5.0.0
//   flutter_svg: ^2.0.7
// Assets: add your images to assets/images/ and declare in pubspec.yaml

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';
import 'package:my_portfolio/Core/Utils/section_keys.dart';
import 'package:my_portfolio/State/Cubit/portfolio_cubit.dart';
import 'package:my_portfolio/Ui/Layout/desktop_layout.dart';
import 'package:my_portfolio/Ui/Layout/mobile_layout.dart';
import 'package:my_portfolio/Ui/Layout/tablet_layout.dart';
import 'package:my_portfolio/Ui/View/loading.dart';

void main() {
  runApp(BlocProvider(create: (_) => PortfolioCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thanveer Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: kDark,
        // textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PortfolioCubit>().initApp(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          // ---- Loading screen ----
          if (state is PortfolioLoading || state is PortfolioInitial) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              builder: (context, value, _) => RetroLoadingScreen(),
            );
          }

          // ---- Responsive Layout ----
          final cubit = context.read<PortfolioCubit>();

          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1100) {
                return DesktopLayout(
                  controller: cubit.scrollController,
                  scrollTo: cubit.scrollTo,
                );
              } else if (constraints.maxWidth >= 700) {
                return TabletLayout(
                  controller: cubit.scrollController,
                  onNavTap: cubit.scrollTo,
                );
              } else {
                return MobileLayout(
                  controller: cubit.scrollController,
                  onNavTap: cubit.scrollTo,
                );
              }
            },
          );
        },
      ),
    );
  }
}
