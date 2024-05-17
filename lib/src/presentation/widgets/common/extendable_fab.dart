import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExtendableFab extends StatefulWidget {
  const ExtendableFab({
    super.key,
    required this.onClickHandler,
    required this.text,
    required this.icon,
    required this.controller,
  });

  final Icon icon;
  final String text;
  final void Function() onClickHandler;
  final ScrollController controller;

  @override
  State<ExtendableFab> createState() => _ExtendableFabState();
}

class _ExtendableFabState extends State<ExtendableFab> {
  bool isFabExtended = true;

  void scrollHandler() {
    if (widget.controller.position.userScrollDirection ==
            ScrollDirection.reverse &&
        isFabExtended) {
      setState(() {
        isFabExtended = false;
      });
    } else if (widget.controller.position.userScrollDirection ==
            ScrollDirection.forward &&
        !isFabExtended) {
      setState(() {
        isFabExtended = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(scrollHandler);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      extendedIconLabelSpacing: isFabExtended ? 10 : 0,
      extendedPadding: isFabExtended ? null : const EdgeInsets.all(16),
      onPressed: widget.onClickHandler,
      label: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        child: isFabExtended ? Text(widget.text) : const SizedBox(),
      ),
      icon: widget.icon,
    );
  }
}
