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
      appBar: AppBar(
        title: Text(mission.title),
        backgroundColor: const Color(0xFF7743DB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'About this Mission',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              mission.description,
              style: GoogleFonts.inter(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7743DB),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: mission.id == 'customer_survey'
                  ? () {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: const CustomerSurveyScreen(),
                        ),
                      );
                    }
                  : null, // Disable button for other missions for now
              child: Text(
                'Start Mission',
                style: GoogleFonts.inter(
                  fontSize: 16,
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