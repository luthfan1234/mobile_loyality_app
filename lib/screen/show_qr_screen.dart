import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowQrScreen extends StatelessWidget {
  const ShowQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: [
            // Background image from assets
            Positioned.fill(
              child: Image.asset('assets/images/home.png', fit: BoxFit.cover),
            ),

            // Foreground content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Placeholder for a rendered QR/barcode. Replace with actual
                  // barcode widget or generated image as needed.
                  Text(
                    'Present your QR code \nfor scanning',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 46),
                  Container(
                    width: 316,
                    height: 316,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'QR/Barcode here',
                        style: GoogleFonts.inter(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom centered helper text inside a SafeArea
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Text(
                      'Tap anywhere to close',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
