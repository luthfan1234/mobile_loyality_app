import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: _isLoading ? _buildLoadingSkeleton() : _buildActualContent(),
    );
  }

  Widget _buildActualContent() {
    return Column(
      children: [
        const SizedBox(height: 90),
        _buildAppBar(context),
        const SizedBox(height: 24),
        Expanded(
          child: Stack(
            children: [const _Link_Group(), _Scrollable_Contain(context)],
          ),
        ),
      ],
    ).animate();
  }

  Widget _buildLoadingSkeleton() {
    return Column(
      children: [
        const SizedBox(height: 90),
        _buildAppBar(context),
        const SizedBox(height: 24),
        Expanded(
          child: Stack(
            children: [const _Link_Group(), _buildSkeletonScrollableContent()],
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonScrollableContent() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 100),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
        children: [
          _buildSkeletonListSection(),
          const SizedBox(height: 16),
          _buildSkeletonListSection(),
        ],
      ),
    );
  }

  Widget _buildSkeletonCard(double width, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildSkeletonListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkeletonCard(100, 16),
        const SizedBox(height: 16),
        _buildSkeletonCard(double.infinity, 50),
        const SizedBox(height: 8),
        _buildSkeletonCard(double.infinity, 50),
        const SizedBox(height: 8),
        _buildSkeletonCard(double.infinity, 50),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Scrollable_Contain(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 436),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
        children: [],
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
      height: 460,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/current_missions.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Current Missions (6)',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
                Spacer(),
                Text(
                  'History',
                  style: GoogleFonts.inter(
                    color: Color(0xFF7743DB),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    _buildMissionCard(0),
                    const SizedBox(width: 12),
                    _buildMissionCard(1),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildMissionCard(2),
                    const SizedBox(width: 12),
                    _buildMissionCard(3),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'See all',
              style: GoogleFonts.inter(
                color: Color(0xFF7743DB),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionCard(int index) {
    return Expanded(
      child: Container(
        height: 160,
        margin: EdgeInsets.zero,
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
            _buildPointsBadge(),
            _buildMissionTitle(index),
            _buildProgressSection(index),
            _buildCompletedSection(index),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBadge() {
    return Positioned(
      top: 16,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4E6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Get 500 points',
          style: GoogleFonts.inter(
            color: const Color(0xFFFCB351),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildMissionTitle(int index) {
    return Positioned(
      top: 50,
      left: 12,
      child: Text(
        index == 0 ? 'Weekly loyalty \nstreak' : 'Daily check-in',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProgressSection(int index) {
    return Positioned(
      bottom: 30,
      left: 12,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                  backgroundColor: const Color(0xFFE4D9F8),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF7743DB),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${1 + index} of 7',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedSection(int index) {
    return Positioned(
      bottom: 5,
      left: 12,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 6),
            Text(
              'Completed before 23/12/23',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF475467),
              ),
            ),
          ],
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Missions',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE4D9F8),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),

                    // Row 3: Expiring text
                    Text(
                      'Complete missions to get points',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFE4D9F8),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
