import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerSurveyScreen extends StatefulWidget {
  const CustomerSurveyScreen({super.key});

  @override
  State<CustomerSurveyScreen> createState() => _CustomerSurveyScreenState();
}

class _CustomerSurveyScreenState extends State<CustomerSurveyScreen> {
  final List<String> _questions = const [
    "How often do you use social media daily?",
    "Which social media platform is your favorite?",
    "Have you ever purchased a product you saw on social media?",
    "How likely are you to recommend our brand to a friend on social media?",
    "What kind of content would you like to see more from us?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Survey')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${index + 1}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7743DB),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _questions[index],
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Placeholder for answer input
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your answer here...',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
