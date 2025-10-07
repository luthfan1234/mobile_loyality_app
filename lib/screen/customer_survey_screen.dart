import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Simple data class for a survey question
class SurveyQuestion {
  final String questionText;
  final List<String> options;

  SurveyQuestion({required this.questionText, required this.options});
}

class CustomerSurveyScreen extends StatefulWidget {
  const CustomerSurveyScreen({super.key});

  @override
  State<CustomerSurveyScreen> createState() => _CustomerSurveyScreenState();
}

class _CustomerSurveyScreenState extends State<CustomerSurveyScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  final Map<int, String> _answers = {};

  // Expanded list of 6 questions
  final List<SurveyQuestion> _questions = <SurveyQuestion>[
    SurveyQuestion(
      questionText: "How often do you buy our products in a month?",
      options: ["Never", "Just 1", "2 to 5 items", "More than 5 items"],
    ),
    SurveyQuestion(
      questionText: "How did you first hear about us?",
      options: ["Social Media", "Friend or Family", "Advertisement", "Other"],
    ),
    SurveyQuestion(
      questionText: "How would you rate the quality of our products?",
      options: ["Very Poor", "Poor", "Average", "Good", "Excellent"],
    ),
    SurveyQuestion(
      questionText: "How likely are you to recommend our brand to others?",
      options: [
        "Not at all likely",
        "Somewhat unlikely",
        "Neutral",
        "Somewhat likely",
        "Extremely likely"
      ],
    ),
    SurveyQuestion(
      questionText:
          "What is the most important factor for you when choosing a product?",
      options: ["Price", "Quality", "Brand Reputation", "Customer Service"],
    ),
    SurveyQuestion(
      questionText:
          "What new features or products would you like to see from us?",
      options: [
        "More variety",
        "Lower prices",
        "Better packaging",
        "More online content"
      ],
    ),
  ];

  void _nextQuestion() {
    if (_selectedAnswer != null) {
      setState(() {
        _answers[_currentQuestionIndex] = _selectedAnswer!;
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
          _selectedAnswer = null; // Reset for next question
        } else {
          // Finish survey
          Navigator.of(context).pop(); // Go back from survey
          Navigator.of(context).pop(); // Go back from detail
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final bool isLastQuestion = _currentQuestionIndex == _questions.length - 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Customer Survey',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress bar
                        Row(
                          children: List.generate(_questions.length, (index) {
                            return Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                height: 4,
                                decoration: BoxDecoration(
                                  color: index <= _currentQuestionIndex
                                      ? const Color(0xFF7743DB)
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 30),

                        // Question text
                        Text(
                          "Question ${_currentQuestionIndex + 1} of ${_questions.length}",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF7743DB),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentQuestion.questionText,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Options (radio)
                        Expanded(
                          child: ListView.builder(
                            itemCount: currentQuestion.options.length,
                            itemBuilder: (context, index) {
                              final option =
                                  currentQuestion.options[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _selectedAnswer == option
                                        ? const Color(0xFF7743DB)
                                        : Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: RadioListTile<String>(
                                  value: option,
                                  groupValue: _selectedAnswer,
                                  activeColor: const Color(0xFF7743DB),
                                  title: Text(
                                    option,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAnswer = value;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Bottom button is now outside the container
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedAnswer == null ? null : _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7743DB),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      disabledBackgroundColor: Colors.grey.shade300,
                    ),
                    child: Text(
                      isLastQuestion ? 'Finish' : 'Next',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}