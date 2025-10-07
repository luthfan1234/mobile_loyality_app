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
      height: 111,
      decoration: const BoxDecoration(
        color: Color(0xFFE4D9F8),
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
                      children: [
                        Text(
                          'Gold',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Membership',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA0A4B0),
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
              Container(
                width: 2,
                height: 41,
                // ignore: deprecated_member_use
                color: const Color(0xFF475467).withOpacity(0.1),
              ),
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
                      children: [
                        Text(
                          '1.200',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Points',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA0A4B0),
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
