import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DailyCheckin extends StatefulWidget {
  const DailyCheckin({super.key});

  @override
  State<DailyCheckin> createState() => _DailyCheckinState();
}

class _DailyCheckinState extends State<DailyCheckin> {
  bool _isCheckedIn = false;
  double _buttonScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Daily Checkin',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/daily.png'),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: _buildDailyCheckinCard(),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideY(
                          begin: -0.3,
                          end: 0,
                          curve: Curves.easeOutCubic,
                        ),
                  ],
                ),
              ],
            ),
            Expanded(child: _buildScrollableContent(context))
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyCheckinCard() {
    return Container(
      height: 250,
      width: 390,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEE8F0F), Color(0xFFFFB24A)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardHeader(),
            const SizedBox(height: 20),
            _buildWeeklyProgress(),
            const SizedBox(height: 20),
            _buildCheckinButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily check-in Progress',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decoration: TextDecoration.none,
            height: 1.5,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 8),
        Text(
          'You will get extra points in the seventh time you check in each week.',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildWeeklyProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) => _buildDayContainer(index)),
    );
  }

  Widget _buildDayContainer(int index) {
    bool isChecked = index < 4;
    bool isToday = index == 4;

    return Column(
          children: [
            Container(
              width: 42.42856979370117,
              height: 52,
              decoration: _getDayContainerDecoration(isChecked, isToday),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/check.png', width: 24, height: 24),
                  Text(
                    isToday ? 'Today' : 'Day ${index + 1}',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: isChecked || isToday
                          ? const Color(0xFFD69400)
                          : Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: (100 * index).ms)
        .slideY(begin: 0.5, end: 0, curve: Curves.easeOutCubic);
  }

  BoxDecoration _getDayContainerDecoration(bool isChecked, bool isToday) {
    Color containerColor;
    Color borderColor;

    if (isChecked) {
      containerColor = const Color(0xFFFFE5C1);
      borderColor = const Color(0xFFFFE5C1);
    } else if (isToday) {
      containerColor = Colors.white;
      borderColor = Colors.white;
    } else {
      // ignore: deprecated_member_use
      containerColor = const Color(0xFFFFE5C1).withOpacity(0.5);
      // ignore: deprecated_member_use
      borderColor = const Color(0xFFFFE5C1).withOpacity(0.5);
    }

    return BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor, width: 2),
    );
  }

  Widget _buildCheckinButton() {
    return Center(
      child: MouseRegion(
        onEnter: (event) => setState(() => _buttonScale = 1.05),
        onExit: (event) => setState(() => _buttonScale = 1.0),
        child: AnimatedScale(
          scale: _buttonScale,
          duration: const Duration(milliseconds: 200),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (!_isCheckedIn) {
                  setState(() {
                    _isCheckedIn = true;
                    _buttonScale = 1.1;
                  });
                  Future.delayed(const Duration(milliseconds: 200), () {
                    setState(() {
                      _buttonScale = 1.0;
                    });
                  });
                }
              },
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: 321,
                height: 32,
                decoration: BoxDecoration(
                  color: _isCheckedIn ? Colors.transparent : Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(scale: animation, child: child),
                      );
                    },
                    child: Text(
                      _isCheckedIn
                          ? "You've checked in today 🎉"
                          : 'Check-in Now',
                      key: ValueKey<bool>(_isCheckedIn),
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _isCheckedIn
                            ? Colors.white
                            : const Color(0xFFFFA800),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
                Row(
                  children: [
                    Text(
                      'Another Way to Get Points',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1D1D1D),
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
                const SizedBox(height: 12),
                Column(
                  children: [
                    Row(
                      children: List.generate(
                        2,
                        (index) =>
                            Expanded(
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
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
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
                                              color: const Color(0xFFFFF4E6),
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: SizedBox(
                                                    height: 12,
                                                    width: 107,
                                                    child: LinearProgressIndicator(
                                                      value: 0.6,
                                                      minHeight: 12,
                                                      backgroundColor:
                                                          const Color(
                                                            0xFFE4D9F8,
                                                          ),
                                                      valueColor:
                                                          const AlwaysStoppedAnimation<
                                                            Color
                                                          >(Color(0xFF7743DB)),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .animate()
                                .fadeIn(
                                  duration: 500.ms,
                                  delay: (150 * index).ms,
                                )
                                .slideX(
                                  begin: 0.5,
                                  end: 0,
                                  curve: Curves.easeOutCubic,
                                ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: List.generate(
                        2,
                        (index) =>
                            Expanded(
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
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
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
                                              color: const Color(0xFFFFF4E6),
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                        ),
                                        Positioned(
                                          top: 50,
                                          left: 12,
                                          child: Text(
                                            index + 2 == 2
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
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: SizedBox(
                                                    height: 12,
                                                    width: 107,
                                                    child: LinearProgressIndicator(
                                                      value: 0.6,
                                                      minHeight: 12,
                                                      backgroundColor:
                                                          const Color(
                                                            0xFFE4D9F8,
                                                          ),
                                                      valueColor:
                                                          const AlwaysStoppedAnimation<
                                                            Color
                                                          >(Color(0xFF7743DB)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${3 + index} of 7',
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
                                )
                                .animate()
                                .fadeIn(
                                  duration: 500.ms,
                                  delay: (150 * (index + 2)).ms,
                                )
                                .slideX(
                                  begin: 0.5,
                                  end: 0,
                                  curve: Curves.easeOutCubic,
                                ),
                      ),
                    ),
                  ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        Container(
                              width: 132,
                              height: 196,
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
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
                                        'assets/images/discount${index + 1}.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 110,
                                    left: 12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: (150 * index).ms)
                            .slideX(
                              begin: 0.5,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}