import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final ScrollController scrollController = ScrollController();

  PortfolioCubit() : super(PortfolioInitial());

  Future<void> initApp(BuildContext context) async {
    emit(PortfolioLoading());

    // 🔹 Preload your big assets here
    await precacheImage(
      const AssetImage("assets/images/hero_large.jpeg"),
      context,
    );
    await precacheImage(const AssetImage("assets/images/user.png"), context);
    await precacheImage(const AssetImage("assets/images/about.png"), context);

    // Small delay for smooth UX
    await Future.delayed(const Duration(milliseconds: 600));

    emit(PortfolioLoaded());
  }

  Future<void> scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }
}

/// ---------------- States ----------------

abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {}

/// ---------------- Main App ----------------
