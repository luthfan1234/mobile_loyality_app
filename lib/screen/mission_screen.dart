import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/join_mission.dart';
import 'package:flutter_application_2/screen/mission_detail.dart';
import 'package:flutter_application_2/utils/page_route_animation.dart';
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
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  // Centralized data for "Join Missions"
  final List<JoinMission> _joinMissions = const [
    JoinMission(
      id: 'customer_survey',
      title: "Social Media Engagement",
      points: "+500 points",
      description:
          "Help us understand your social media habits! Complete a short survey to earn points and help us improve our community engagement.",
    ),
    JoinMission(
      id: 'daily_streak',
      title: "Daily Streak",
      points: "+100 points",
    ),
    JoinMission(
      id: 'invite_friends',
      title: "Invite Friends",
      points: "+1000 points",
    ),
    JoinMission(
      id: 'complete_profile',
      title: "Complete Profile",
      points: "+200 points",
    ),
    JoinMission(
      id: 'first_purchase',
      title: "First Purchase",
      points: "+500 points",
    ),
    JoinMission(
      id: 'write_review',
      title: "Write a Review",
      points: "+150 points",
    ),
  ];

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _expandSheet() {
    _scrollController.animateTo(
      0.85, // maxChildSize
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
            children: [
              _CurrentMissionsSection(onSeeAllTap: _expandSheet),
              _buildJoinMissionSheet(),
            ],
          ),
        ),
      ],
    ).animate();
  }

  Widget _buildJoinMissionSheet() {
    return DraggableScrollableSheet(
      controller: _scrollController,
      initialChildSize: 0.25,
      minChildSize: 0.25,
      maxChildSize: 0.85,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Text(
                'Join Missions',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 169 / 166,
                ),
                itemCount: _joinMissions.length,
                itemBuilder: (context, index) {
                  return _buildJoinMissionCard(
                    _joinMissions[index],
                    index: index,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingSkeleton() {
    return Column(
      children: [
        const SizedBox(height: 90),
        _buildAppBar(context),
        const SizedBox(height: 24),
        Expanded(
          child: Stack(
            children: [
              _buildCurrentMissionsSkeleton(),
              _buildJoinMissionsSkeleton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentMissionsSkeleton() {
    return Container(
      width: double.infinity,
      height: 460,
      decoration: BoxDecoration(
        color: const Color(0xFF7743DB).withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.5),
        highlightColor: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 80,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJoinMissionsSkeleton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 120,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 169 / 166,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJoinMissionCard(JoinMission mission, {required int index}) {
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
                    color: const Color(0xFFFFF4E6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mission.points,
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
                  mission.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: MissionDetailScreen(mission: mission),
                      ),
                    );
                  },
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
}

class _CurrentMissionsSection extends StatelessWidget {
  final VoidCallback onSeeAllTap;
  const _CurrentMissionsSection({super.key, required this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 460,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/current_missions.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
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
                const Spacer(),
                Text(
                  'History',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF7743DB),
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
                    _buildCurrentMissionCard(0),
                    const SizedBox(width: 12),
                    _buildCurrentMissionCard(1),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildCurrentMissionCard(2),
                    const SizedBox(width: 12),
                    _buildCurrentMissionCard(3),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onSeeAllTap,
              child: Text(
                'See all',
                style: GoogleFonts.inter(
                  color: const Color(0xFF7743DB),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentMissionCard(int index) {
    return Expanded(
      child: Container(
        height: 160,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
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
                color: const Color(0xFF475467),
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
