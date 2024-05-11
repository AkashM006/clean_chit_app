import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(),
    );
  }
}
