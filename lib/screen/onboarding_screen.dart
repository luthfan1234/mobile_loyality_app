import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_2/utils/page_route_animation.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      CustomPageRoute(child: const HomeScreen()),
    );
  }

  void _continueAsGuest() {
    // Implement guest functionality
    debugPrint('Continue as guest tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 3),
                const _WelcomeSection()
                    .animate()
                    .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
                const SizedBox(height: 56),
                _ButtonSection(
                  onLoginPressed: _navigateToHome,
                  onGuestPressed: _continueAsGuest,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 400.ms)
                    .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFF2F4F7),
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            text:
                'Unlock a world of exclusive benefits and \ndiscover a world of perks at your fingertips with ',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: const Color(0xFFF2F4F7),
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: 'MyLoyalty',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: const Color(0xFFF2F4F7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonSection extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onGuestPressed;

  const _ButtonSection({
    required this.onLoginPressed,
    required this.onGuestPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            onPressed: onLoginPressed,
            child: Text(
              'Login to your account',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF7743DB),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 2, color: Color(0xFFF2F4F7)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            onPressed: onGuestPressed,
            child: Text(
              'Continue as a guest',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFFF2F4F7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
