import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowQrScreen extends StatelessWidget {
  const ShowQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Background image from assets
          Positioned.fill(
            child: Image.asset('assets/images/home.png', fit: BoxFit.cover),
          ),

          // Dark overlay to ensure content is legible on top of the image
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),

          // Foreground content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Placeholder for a rendered QR/barcode. Replace with actual
                // barcode widget or generated image as needed.
                Container(
                  width: 220,
                  height: 220,
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
                const SizedBox(height: 24),
                Text(
                  'Show this code to be scanned',
                  style: GoogleFonts.inter(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
      // Keep the AppBar color as-is; the body image is visible behind it.
    );
  }
}
