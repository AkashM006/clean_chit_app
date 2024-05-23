import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  final String? text;
  const CustomLoaderWidget({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    widgets.add(
      const CircularProgressIndicator(),
    );
    if (text != null) {
      widgets.add(SizedBox(
        height: SizeConfig.safeBlockVertical * 3,
      ));
      widgets.add(
        Text(
          text!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
