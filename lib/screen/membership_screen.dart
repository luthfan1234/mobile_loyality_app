import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_animate/flutter_animate.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
                  children: [
                    Image.asset('assets/images/membership.png'),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70, bottom: 53),
                        child: Column(
                          children: [
                            _buildAppBar(context),
                            const SizedBox(height: 16),
                            _buildDailyCheckinCard(),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(begin: -0.1, end: 0, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
          color: Colors.white,
          onPressed: () => Navigator.pop(context), // Fixed navigation
        ),
        Expanded(
          child: Text(
            'Membership Level',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _buildDailyCheckinCard() {
    return Container(
          height: 180,
          width: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/card_membership.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [_buildCardFooter(), const SizedBox(height: 10)],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0, curve: Curves.easeOut);
  }

  Widget _buildCardFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Complete 8 missions to become Platinum member',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFF3D1),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(width: 4),
            Image.asset(
              'assets/icons/tier_membership.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 320,
          height: 6,
          child: LinearProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.white.withOpacity(0.2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'You’ve completed 4 missions',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
