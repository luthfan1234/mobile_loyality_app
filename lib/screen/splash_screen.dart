import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/onboarding_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_2/utils/page_route_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        CustomPageRoute(child: const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 1500.ms)
          .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
    );
  }
}
