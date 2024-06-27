// Custom Page Transitions class

import 'package:flutter/material.dart';

class PageTransitions {
  // Fade Page transition
  static FadeTransition fadePageTransition(
      Animation<double> opacity, Widget child) {
    return FadeTransition(
      opacity: opacity,
      child: child,
    );
  }

  // Slide up transition
  static SlideTransition slideUpTransition(
      Animation<double> animation, Widget child) {
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child,
    );
  }
}
