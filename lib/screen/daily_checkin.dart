import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class DailyCheckin extends StatelessWidget {
  const DailyCheckin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/daily.png'),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                    right: 16,
                    left: 16,
                    bottom: 53,
                  ),
                  child: Column(
                    children: [
                      _buildAppBar(context),
                      const SizedBox(height: 16),
                      _buildDailyCheckinCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 24,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        ),
        Expanded(
          child: Text(
            'Daily Checkin',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 48),
      ],
    );
  }

  Widget _buildDailyCheckinCard() {
    return Container(
      height: 228,
      width: 360,
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
                      ? Color(0xFFD69400)
                      : Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _getDayContainerDecoration(bool isChecked, bool isToday) {
    Color containerColor;
    Color borderColor;

    if (isChecked) {
      containerColor = Color(0xFFFFE5C1);
      borderColor = Color(0xFFFFE5C1);
    } else if (isToday) {
      containerColor = Colors.white;
      borderColor = Colors.white;
    } else {
      // ignore: deprecated_member_use
      containerColor = Color(0xFFFFE5C1).withOpacity(0.5);
      // ignore: deprecated_member_use
      borderColor = Color(0xFFFFE5C1).withOpacity(0.5);
    }

    return BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor, width: 2),
    );
  }

  Widget _buildCheckinButton() {
    return Center(
      child: Container(
        width: 321,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Text(
            'Check-in Now',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFA800),
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
