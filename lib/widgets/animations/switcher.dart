import 'package:flutter/material.dart';

/// AnimatedSwitcher customizado para troca de lista/grid
class CustomAnimatedSwitcher extends StatelessWidget {
  final Widget child;

  const CustomAnimatedSwitcher({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: child,
    );
  }
}
