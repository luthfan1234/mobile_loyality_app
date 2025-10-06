import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading like other screens
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true, // biar body naik sampai ke status bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparan
        elevation: 0,
        title: Text(
          'Membership Level',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: Colors.white, // supaya kelihatan di atas gambar
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _isLoading ? _buildLoadingSkeleton() : _buildContent(),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/membership.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const SizedBox(
              height: 114,
            ), // spasi biar konten tidak ketutupan gambar
            _buildDailyCheckinCard().animate().fadeIn(duration: 500.ms),
            const SizedBox(height: 32),
            Expanded(child: _buildTabBar()),
          ],
        ),
      ],
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
          Expanded(
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
      color: Colors.white,
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
                  Image.asset(
                    'assets/icons/membership1.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birthday Treat',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Receive a 10% discount code during your \nbirthday month.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 200.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),
          Row(
                children: [
                  Image.asset(
                    'assets/icons/membership2.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Standard Earning Rate',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Earn points for every purchase and activity.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 350.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),
          Row(
                children: [
                  Image.asset(
                    'assets/icons/membership3.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Community Access',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Join our community forum and connect with \nother members.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 500.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildGoldContent() {
    return Container(
      color: Colors.white,
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
                    Image.asset(
                      'assets/icons/membership1.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
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
                .fadeIn(duration: 500.ms, delay: 200.ms)
                .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
            const SizedBox(height: 24),
            Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/membership2.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
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
                .fadeIn(duration: 500.ms, delay: 350.ms)
                .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
            const SizedBox(height: 24),
            Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/membership3.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
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
                .fadeIn(duration: 500.ms, delay: 500.ms)
                .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildPlatinumContent() {
    return Container(
      color: Colors.white,
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
                  Image.asset(
                    'assets/icons/membership1.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Premium Birthday Gift',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Receive a special gift box and a 25% discount \ncode on your birthday.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 200.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),
          Row(
                children: [
                  Image.asset(
                    'assets/icons/membership2.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accelerated Earning Rate',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Earn 2x points on all purchases and get \nexclusive bonus challenges.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 350.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),
          Row(
                children: [
                  Image.asset(
                    'assets/icons/membership3.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dedicated Priority Support',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Get dedicated 24/7 priority support via chat \nand phone.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 500.ms)
              .slideX(begin: 0.5, end: 0, curve: Curves.easeOutCubic),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildDailyCheckinCard() {
    return Container(
      height: 180,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
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
    );
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
              // ignore: deprecated_member_use
              shadowColor: Colors.black.withOpacity(0.1),
              elevation: 4,
              minimumSize: const Size(110, 29),
            ),
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
            // ignore: deprecated_member_use
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

// Loading skeletons
Widget _buildLoadingSkeleton() {
  return Stack(
    children: [
      Image.asset(
        'assets/images/membership.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Column(
        children: [
          const SizedBox(height: 114),
          // skeleton card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildSkeletonCard(double.infinity, 180),
          ),
          const SizedBox(height: 32),
          // skeleton tab area
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                children: [
                  _buildSkeletonCard(150, 20),
                  const SizedBox(height: 16),
                  for (int i = 0; i < 3; i++) ...[
                    Row(
                      children: [
                        _buildSkeletonCard(48, 48, isCircle: true),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSkeletonCard(double.infinity, 48),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildSkeletonCard(
  double width,
  double height, {
  bool isCircle = false,
}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(12),
      ),
    ),
  );
}
