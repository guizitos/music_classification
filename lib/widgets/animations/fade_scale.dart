import 'package:flutter/material.dart';

/// Animação de Fade + Scale usada nos cards
class FadeScaleAnimation extends StatelessWidget {
  final Widget child;
  final int index;

  const FadeScaleAnimation({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (_, value, __) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
    );
  }
}
