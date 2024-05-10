import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundListenerWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const BackgroundListenerWrapper({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BackgroundListenerWrapperState();
}

class _BackgroundListenerWrapperState
    extends ConsumerState<BackgroundListenerWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
