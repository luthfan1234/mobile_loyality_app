import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Points',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading ? _buildLoadingSkeleton() : _buildActualContent(),
    );
  }

  Widget _buildActualContent() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/point.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: _buildPointsDisplay(context),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
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
                        indicatorColor: const Color(0xFF7743DB),
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: const Color(0xFF7743DB),
                        unselectedLabelColor: const Color(0xFF475467),
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
        ),
      ],
    );
  }

  Widget _buildLoadingSkeleton() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/point.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: _buildSkeletonPointsDisplay(),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
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
                        indicatorColor: const Color(0xFF7743DB),
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: const Color(0xFF7743DB),
                        unselectedLabelColor: const Color(0xFF475467),
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
                            _buildSkeletonRedeemPointsTab(),
                            _buildSkeletonEarnPointsTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonCard(double width, double height, {bool isCircle = false}) {
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

  Widget _buildSkeletonPointsDisplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkeletonCard(48, 48, isCircle: true),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSkeletonCard(100, 20),
                  const SizedBox(height: 4),
                  _buildSkeletonCard(150, 12),
                ],
              ),
            ],
          ),
          _buildSkeletonCard(80, 16),
        ],
      ),
    );
  }

  Widget _buildSkeletonEarnPointsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 169 / 166,
      ),
      itemBuilder: (context, index) => _buildSkeletonCard(169, 166),
    );
  }

  Widget _buildSkeletonRedeemPointsTab() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSkeletonCard(double.infinity, 238)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPointsDisplay(BuildContext context) {
    return Padding(
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
              ),
            ),
          ),
        ],
      ),
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
                // ignore: deprecated_member_use
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
                    color: const Color(0xFFFFF4E6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    points[index],
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFCB351),
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
                    'Join Mission',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7743DB),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: (150 * index).ms)
        .slideY(begin: 0.5, end: 0, curve: Curves.easeOutCubic);
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
                // ignore: deprecated_member_use
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
                    'assets/images/discount${(index % 3) + 1}.png',
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
                    const SizedBox(height: 8),
                    Container(
                      width: 143,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF7743DB),
                          width: 1,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(60),
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
        .fadeIn(duration: 500.ms, delay: (150 * index).ms)
        .slideY(begin: 0.5, end: 0, curve: Curves.easeOutCubic);
  }
}