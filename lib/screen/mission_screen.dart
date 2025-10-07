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
      margin: const EdgeInsets.only(top: 420),

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
      height: 434,
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
