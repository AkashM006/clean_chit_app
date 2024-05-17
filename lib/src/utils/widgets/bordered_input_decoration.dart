import 'package:flutter/material.dart';

class BorderedInputDecoration extends InputDecoration {
  final Widget? labelWidget;
  final Widget? iconWidget;
  final Widget? suffixIconWidget;
  const BorderedInputDecoration({
    this.labelWidget,
    this.iconWidget,
    this.suffixIconWidget,
  }) : super(
          border: const OutlineInputBorder(),
          label: labelWidget,
          icon: iconWidget,
          suffixIcon: suffixIconWidget,
        );
}
