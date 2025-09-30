import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_animate/flutter_animate.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Animate(
        effects: const [FadeEffect(), SlideEffect(curve: Curves.easeIn)],
        child: Container(
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
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70, bottom: 53),
                        child: Column(
                          children: [
                            _buildAppBar(context),
                            const SizedBox(height: 16),
                            _buildDailyCheckinCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.1, end: 0, curve: Curves.easeOut),
              _buildTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // Start with Gold tab selected
      child: Column(
        children: [
          Container(
            height: 40,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFFD69400), width: 3),
                insets: EdgeInsets.symmetric(horizontal: 20),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: const Color(0xFFD69400),
              unselectedLabelColor: const Color(0xFF475467),
              labelStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              unselectedLabelStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Silver'),
                Tab(text: 'Gold'),
                Tab(text: 'Platinum'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                _buildSilverContent(),
                _buildGoldContent(),
                _buildPlatinumContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSilverContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Member Benefits',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset('assets/icons/membership1.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Birthday Treat',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Receive a 10% discount code during your \nbirthday month.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2, curve: Curves.easeOut),
          const SizedBox(height: 24),
          Row(
            children: [
              Image.asset('assets/icons/membership2.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Standard Earning Rate',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Earn points for every purchase and activity.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.2, curve: Curves.easeOut),
          const SizedBox(height: 24),
          Row(
            children: [
              Image.asset('assets/icons/membership3.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Community Access',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Join our community forum and connect with \nother members.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.2, curve: Curves.easeOut),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildGoldContent() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Member Benefits',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ikon / badge
                Image.asset(
                  'assets/icons/membership1.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 16),

                // Text Gold dan Points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birthday Treat',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Receive a personalized 15% discount code or a \nfree gift during your birthday month.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            )
                .animate()
                .fadeIn(delay: 200.ms)
                .slideX(begin: 0.2, curve: Curves.easeOut),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ikon / badge
                Image.asset(
                  'assets/icons/membership2.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 16),

                // Text Gold dan Points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Increased Earning Rate',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Unlock bonus points challenges for additional \nlearning opportunities.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            )
                .animate()
                .fadeIn(delay: 300.ms)
                .slideX(begin: 0.2, curve: Curves.easeOut),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ikon / badge
                Image.asset(
                  'assets/icons/membership3.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 16),

                // Text Gold dan Points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tier Upgrade Bonus',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Enjoy priority email support with a guaranteed \nresponse within 24 hours.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            )
                .animate()
                .fadeIn(delay: 400.ms)
                .slideX(begin: 0.2, curve: Curves.easeOut),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildPlatinumContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Member Benefits',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset('assets/icons/membership1.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium Birthday Gift',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Receive a special gift box and a 25% discount \ncode on your birthday.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2, curve: Curves.easeOut),
          const SizedBox(height: 24),
          Row(
            children: [
              Image.asset('assets/icons/membership2.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Accelerated Earning Rate',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Earn 2x points on all purchases and get \nexclusive bonus challenges.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.2, curve: Curves.easeOut),
          const SizedBox(height: 24),
          Row(
            children: [
              Image.asset('assets/icons/membership3.png', width: 48, height: 48),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dedicated Priority Support',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Get dedicated 24/7 priority support via chat \nand phone.',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.2, curve: Curves.easeOut),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
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
          children: [
            _buildCardHeader(),
            const SizedBox(height: 10),
            _buildCardFooter(),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0, curve: Curves.easeOut);
  }

  Widget _buildCardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ikon / badge
          Image.asset(
            'assets/icons/tier_membership2.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12),

          // Text Gold dan Points
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gold',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      '1.200 Points',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Button
          ElevatedButton(
            onPressed: () {
              // Add your button action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDCA426),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              shadowColor: Colors.black.withOpacity(0.1),
              elevation: 4, // Tambahkan ini untuk mengatur shadow
              minimumSize: const Size(110, 29),
            ), // Tambahkan ini untuk mengatur ukuran button
            child: Text(
              'Redeem points',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: const Color(0xFFFFF3D1),
              ),
            ),
          ),
        ],
      ),
    );
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
                color: const Color(0xFFFFF3D1),
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
