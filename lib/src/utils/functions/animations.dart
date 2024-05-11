import 'package:flutter/material.dart';

typedef SlideTransitionBuilder = SlideTransition Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
);

const defaultAnimationDuration = Duration(milliseconds: 350);
const defaultAnimationDelay = Duration(milliseconds: 50);

PageRouteBuilder<T> customPageRouteBuilder<T>({
  required Widget page,
  required SlideTransitionBuilder transitionsBuilder,
  Duration duration = const Duration(milliseconds: 500),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: transitionsBuilder,
    transitionDuration: duration,
  );
}

SlideTransitionBuilder generateSlideTransition({required Offset begin}) {
  return (context, animation, secondaryAnimation, child) {
    var offset = Tween(begin: begin, end: Offset.zero).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.decelerate,
    ));
    return SlideTransition(position: offset, child: child);
  };
}

SlideTransitionBuilder leftToRightTransition() {
  return generateSlideTransition(begin: const Offset(1.0, 0.0));
}
