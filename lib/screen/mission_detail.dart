import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/models/join_mission.dart';
import 'package:flutter_application_2/screen/customer_survey_screen.dart';
import 'package:flutter_application_2/utils/page_route_animation.dart';

class MissionDetailScreen extends StatelessWidget {
  final JoinMission mission;

  const MissionDetailScreen({super.key, required this.mission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mission Detail",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mission.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              mission.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF475467),
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mission.id == 'customer_survey'
                    ? const Color(0xFF7743DB)
                    : Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: mission.id == 'customer_survey'
                  ? () {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: const CustomerSurveyScreen()),
                      );
                    }
                  : null,
              child: Text(
                mission.id == 'customer_survey'
                    ? 'Start Mission'
                    : 'Not Available',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: mission.id == 'customer_survey'
                      ? const Color(0xFFE4D9F8)
                      : Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
