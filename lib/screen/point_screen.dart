import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/screen/membership_screen.dart';
import 'package:flutter_application_2/screen/point_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/page_route_animation.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/point.png'),
            alignment: Alignment.topCenter,
          ),
        ),
        child:
            Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 53),
                  child: Column(
                    children: [
                      _buildAppBar(context),
                      const SizedBox(height: 24),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                              TabBar(
                                controller: _tabController,
                                tabs: const [
                                  Tab(text: 'Redeem Points'),
                                  Tab(text: 'Earn Points'),
                                ],
                                indicatorColor: const Color(
                                  0xFF7743DB,
                                ), // Warna indicator
                                indicatorWeight: 3.0, // Ketebalan indicator
                                indicatorSize:
                                    TabBarIndicatorSize.tab, // Ukuran indicator
                                labelColor: const Color(
                                  0xFF7743DB,
                                ), // Warna teks aktif
                                unselectedLabelColor: Color(
                                  0xFF475467,
                                ), // Warna teks tidak aktif
                                labelStyle: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                unselectedLabelStyle: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    _buildRedeemPointsTab(),
                                    _buildEarnPointsTab(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: 800.ms, delay: 300.ms)
                .slideY(begin: 0.1, end: 0, curve: Curves.easeOut),
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
            'My Points',
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

  Widget _buildEarnPointsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 169 / 166,
      ),
      itemBuilder: (context, index) => _buildMissionCard(index),
    );
  }

  Widget _buildMissionCard(int index) {
    final missions = [
      "Social Media Engagement",
      "Daily Streak",
      "Invite Friends",
      "Complete Profile",
      "First Purchase",
      "Write a Review",
    ];
    final points = [
      "+500 points",
      "+100 points",
      "+1000 points",
      "+200 points",
      "+500 points",
      "+150 points",
    ];

    return Container(
          width: 169,
          height: 166,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF4E6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    points[index],
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
                  missions[index],
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
                    side: const BorderSide(color: Color(0xFF7743DB), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(143, 32),
                  ),
                  child: Text(
                    "Join Mission",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF7743DB),
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
        .fadeIn(delay: (200 * (index + 1)).ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildRedeemPointsTab() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First row
              Row(
                children: [
                  Expanded(child: _buildDiscountCard(0)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDiscountCard(1)),
                ],
              ),
              const SizedBox(height: 16),
              // Second row
              Row(
                children: [
                  Expanded(child: _buildDiscountCard(2)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDiscountCard(3)),
                ],
              ),
              const SizedBox(height: 16),
              // Third row
              Row(
                children: [
                  Expanded(child: _buildDiscountCard(4)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDiscountCard(5)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountCard(int index) {
    final discounts = ['10%', '25%', '30%', '15%', '20%', '35%'];
    final points = ['1000', '2500', '3000', '1500', '2000', '3500'];

    return Container(
          height: 238,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 2,
                spreadRadius: 0,
                offset: const Offset(0, 2),
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
                    'assets/images/discount${(index % 2) + 1}.png',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${discounts[index]} discount \nvoucher',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${points[index]} points',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFCB351),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 160,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF7743DB),
                          width: 1,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Redeem Now',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7743DB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: (200 * (index + 1)).ms)
        .slideY(begin: 0.3, end: 0);
  }
}
