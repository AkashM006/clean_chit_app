import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDatesForm extends ConsumerStatefulWidget {
  const ChitDatesForm({super.key});

  @override
  ConsumerState<ChitDatesForm> createState() => _ChitDatesFormState();
}

class _ChitDatesFormState extends ConsumerState<ChitDatesForm> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Text("Screen 2"),
    );
  }
}
