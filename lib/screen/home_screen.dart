import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog(context);
    });
  }

  void _showWelcomeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/popup.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            Column(
                  children: [
                    const _HeaderSection(),
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
                .fadeIn(duration: 800.ms, delay: 300.ms)
                .slideY(begin: 0.1, end: 0, curve: Curves.easeOut),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 100,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            selectedItemColor: const Color(0xFF7743DB),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            elevation: 8,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard_rounded),
                label: 'Reward',
              ),
              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_rounded),
                label: 'Mission',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF7743DB),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Scan',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Scrollable_Contain(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50),
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
              children: [
                Image.asset('assets/images/promo.png'),
                const SizedBox(height: 32),
                Text(
                  'Current Missions',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D1D1D),
                  ),
                ),
                const SizedBox(height: 12),
                // row mission
                Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: Container(
                        height: 134,
                        margin: EdgeInsets.only(
                          left: index == 0 ? 0 : 8,
                          right: index == 1 ? 0 : 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: const Offset(1, 0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 16,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFF4E6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Get 500 points',
                                  style: GoogleFonts.inter(
                                    color: Color(0xFFFCB351),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 12,
                              child: Text(
                                index == 0
                                    ? 'Weekly loyalty \nstreak'
                                    : 'Daily check-in',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 12,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        height: 12,
                                        width: 107,
                                        child: LinearProgressIndicator(
                                          value: 0.6,
                                          minHeight: 12,
                                          backgroundColor: const Color(
                                            0xFFE4D9F8,
                                          ),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                const Color(0xFF7743DB),
                                              ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    Text(
                                      '${1 + (index)} of 7',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Text(
                      'Redeem Your Points',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'See All',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7743DB),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 204,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      width: 132,
                      height: 196,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 0,
                        right: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 2,
                            spreadRadius: 0,
                            offset: const Offset(1, 0),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/images/discount${index + 1}.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 110,
                            left: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index == 0
                                      ? '10% discount \nvoucher'
                                      : index == 1
                                      ? '25% discount \nvoucher'
                                      : '30% discount \nvoucher',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  index == 0
                                      ? '1000 points'
                                      : index == 1
                                      ? '2500 points'
                                      : '3000 points',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFCB351),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (300 * (index + 1)).ms).slideX(),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Text(
                      'Join Challenge to Get Points',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'See All',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7743DB),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/join_challenge.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bagian kiri: Text + Button
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Text(
                                  "Complete\nMissions to \nGet Points",
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF7743DB),
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: 120,
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF7743DB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    "Learn More",
                                    style: GoogleFonts.inter(
                                      color: Color(0xFFE4D9F8),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Bagian kanan: List Card horizontal
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) =>
                                  Container(
                                        width: 167,
                                        height: 156,
                                        margin: EdgeInsets.only(
                                          left: index == 0 ? 0 : 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 6,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFF4E6),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  "+500 points",
                                                  style: GoogleFonts.inter(
                                                    color: Color(0xFFFCB351),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                index == 0
                                                    ? "Social Media Engagement"
                                                    : index == 1
                                                    ? "Daily Streak"
                                                    : "Invite Friends",
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                    color: Color(0xFF7743DB),
                                                    width: 1,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  minimumSize: const Size(
                                                    143,
                                                    32,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Join Mission",
                                                  style: GoogleFonts.inter(
                                                    color: const Color(
                                                      0xFF7743DB,
                                                    ),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .animate()
                                      .fadeIn(delay: (300 * (index + 1)).ms)
                                      .slideX(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //NAVBAR
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
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.12),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Gold section
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/icons/tier.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Gold',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: Colors.white, size: 20),
              ],
            ),

            // Vertical divider
            Container(
              width: 2,
              height: 20,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Coins section
            Row(
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset(
                    'assets/icons/point.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '1.200',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: Colors.white, size: 20),
              ],
            ),

            // Vertical divider
            Container(
              width: 2,
              height: 20,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Voucher section
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/icons/voucher.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '12 Vouchers',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: Colors.white, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget to prevent unnecessary rebuilds
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 87, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi, Marissa Edward',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE4D9F8),
            ),
          ),
          const Icon(Icons.notifications, color: Color(0xFFE4D9F8), size: 24),
        ],
      ),
    );
  }
}
