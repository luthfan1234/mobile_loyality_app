import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child.animate().fadeIn(duration: 600.ms);
          },
          transitionDuration: 600.ms,
        );
}
