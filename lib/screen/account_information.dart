import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Account Information',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
            height: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(child: Text('Account Information Screen')),
    );
  }
}
