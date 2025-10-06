import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'show_qr_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final MobileScannerController _cameraController = MobileScannerController();
  bool _torchEnabled = false;

  @override
  void initState() {
    super.initState();
    // Make status bar icons light so they're visible over the camera preview
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  void _toggleTorch() async {
    await _cameraController.toggleTorch();
    // MobileScannerController does not expose a direct torchState getter
    // so we track it locally by toggling the boolean.
    if (mounted) {
      setState(() {
        _torchEnabled = !_torchEnabled;
      });
    }
  }

  void _onUploadPressed() {
    // Placeholder: show bottom sheet for media upload options
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.of(ctx).pop();
                final picked = await _pickImage(ImageSource.gallery);
                if (picked != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: ${picked.path}')),
                  );
                }
              },
            ),
            // 'Take a photo' option removed per request
          ],
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> _pickImage(ImageSource source) async {
    try {
      final XFile? file = await _picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      return file;
    } catch (e) {
      debugPrint('Image pick error: $e');
      return null;
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: _cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? code = barcodes.first.rawValue;
                debugPrint('Barcode found! $code');
                Navigator.pop(context, code);
              }
            },
          ),

          // Darken everything outside the scan area with a semi-transparent mask.
          // This is drawn above the camera preview but below the overlay icons/labels
          // so they remain visible and interactive.
          Positioned.fill(
            child: CustomPaint(
              painter: ScanMaskPainter(
                holeWidth: 250,
                holeHeight: 250,
                borderRadius: 12,
                overlayColor: const Color.fromRGBO(0, 0, 0, 0.2),
              ),
            ),
          ),

          // Top overlay with circular translucent icon backgrounds (no blur)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  // Back button with circular background
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                      splashRadius: 22,
                    ),
                  ),
                  const Spacer(),
                  // Flash button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        _torchEnabled
                            ? Icons.flashlight_on_rounded
                            : Icons.flashlight_off_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _toggleTorch,
                      splashRadius: 22,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Upload button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.image_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _onUploadPressed,
                      splashRadius: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Label above the scan area
          Positioned(
            top: MediaQuery.of(context).size.height * 0.26,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scan QR Code here',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Scan area with corner-only rounded outline
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: CustomPaint(
                painter: CornerOutlinePainter(
                  color: Colors.white,
                  strokeWidth: 4,
                  radius: 12,
                ),
              ),
            ),
          ),

          // Bottom full-width rounded rectangle (rounded top only) as a button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () async {
                // Navigate instantly (no transition) to ShowQrScreen
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ShowQrScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 72,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // biar row pas di tengah
                    children: [
                      Icon(Icons.qr_code, color: Color(0xFF7743DB), size: 24),
                      const SizedBox(width: 8), // jarak antara icon dan text
                      Text(
                        'Show my QR Code',
                        style: GoogleFonts.inter(
                          color: Color(0xFF7743DB),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CornerOutlinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final double tailLength;

  CornerOutlinePainter({
    required this.color,
    this.strokeWidth = 4,
    this.radius = 20,
    this.tailLength = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // ---- Top-left arc + ekor
    final tl = Rect.fromLTWH(0, 0, radius * 2, radius * 2);
    canvas.drawArc(tl, 3.14159, 1.5708, false, paint); // arc melengkung
    canvas.drawLine(Offset(0, radius), Offset(0, radius + tailLength), paint);
    canvas.drawLine(Offset(radius, 0), Offset(radius + tailLength, 0), paint);

    // ---- Top-right arc + ekor
    final tr = Rect.fromLTWH(
      size.width - radius * 2,
      0,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(tr, -1.5708, 1.5708, false, paint);
    canvas.drawLine(
      Offset(size.width, radius),
      Offset(size.width, radius + tailLength),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - radius, 0),
      Offset(size.width - radius - tailLength, 0),
      paint,
    );

    // ---- Bottom-right arc + ekor
    final br = Rect.fromLTWH(
      size.width - radius * 2,
      size.height - radius * 2,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(br, 0, 1.5708, false, paint);
    canvas.drawLine(
      Offset(size.width, size.height - radius),
      Offset(size.width, size.height - radius - tailLength),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - radius, size.height),
      Offset(size.width - radius - tailLength, size.height),
      paint,
    );

    // ---- Bottom-left arc + ekor
    final bl = Rect.fromLTWH(
      0,
      size.height - radius * 2,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(bl, 1.5708, 1.5708, false, paint);
    canvas.drawLine(
      Offset(0, size.height - radius),
      Offset(0, size.height - radius - tailLength),
      paint,
    );
    canvas.drawLine(
      Offset(radius, size.height),
      Offset(radius + tailLength, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CornerBox extends StatelessWidget {
  const CornerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CornerOutlinePainter(
          color: Colors.purple,
          radius: 20,
          tailLength: 30,
        ),
        child: const SizedBox(width: 200, height: 200),
      ),
    );
  }
}

// Paints a semi-transparent overlay that darkens the area outside a centered
// rounded rectangle 'hole'. The hole dimensions are specified in absolute
// pixels (holeWidth/holeHeight) and will be centered within the canvas.
class ScanMaskPainter extends CustomPainter {
  final double holeWidth;
  final double holeHeight;
  final double borderRadius;
  final Color overlayColor;

  ScanMaskPainter({
    required this.holeWidth,
    required this.holeHeight,
    this.borderRadius = 12,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.6),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = overlayColor;

    final outer = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final holeRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: holeWidth,
      height: holeHeight,
    );

    final hole = Path()
      ..addRRect(
        RRect.fromRectAndRadius(holeRect, Radius.circular(borderRadius)),
      );

    final mask = Path.combine(ui.PathOperation.difference, outer, hole);

    canvas.drawPath(mask, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
