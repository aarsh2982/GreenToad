// Splash Screen with Lottie Animation
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Navigate to home screen after the animation is done
    _navigateToHome();
  }

  void _navigateToHome() async {
    // wait for 2.4 secs
    await Future.delayed(const Duration(milliseconds: 2400));

    // navigates to home view
    context.go("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF319155),
      body: Center(
        child: Lottie.asset(
          "assets/lottie/greenToad.json",
          repeat: false,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
