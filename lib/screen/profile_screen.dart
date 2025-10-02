import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child:
          Column(
                children: [
                  const SizedBox(height: 90),
                  _buildAppBar(context),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Stack(
                      children: [
                        const _Link_Group(),
                        _Scrollable_Contain(context),
                      ],
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Scrollable_Contain(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const SizedBox(height: 20)],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _Link_Group extends StatelessWidget {
  const _Link_Group();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111,
      decoration: const BoxDecoration(
        color: Color(0xFFE4D9F8), // background ungu muda
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        child: Container(
          width: 369,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Bagian kiri (Gold Membership)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/tier_membership2.png',
                      width: 38,
                      height: 38,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Gold',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Membership',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA0A4B0),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFA0A4B0),
                      size: 20,
                    ),
                  ],
                ),
              ),

              // Garis pemisah
              Container(
                width: 2,
                height: 41,
                color: Color(0xFF475467).withOpacity(0.1),
              ),

              // Bagian kanan (Points)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/point.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '1.200',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Points',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA0A4B0),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFA0A4B0),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Icon + "1.200 Points"
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/point.png', width: 48, height: 48),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '1.200',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Points',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    // Row 3: Expiring text
                    Text(
                      '200 points expiring on 31/12/2023',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right: Link
            GestureDetector(
              onTap: () {},
              child: Text(
                'Point history',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
