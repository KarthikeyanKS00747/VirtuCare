import 'package:flutter/material.dart';
class CircularBlinkingAnimationWidget extends StatelessWidget {
  final AnimationController controller;
  final double delay;
  final double size;

  const CircularBlinkingAnimationWidget({required this.controller, required this.delay, required this.size});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(delay, 1.0, curve: Curves.easeInOut),
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );
  }
}