import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String title, description;
  const DetailItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 0.5,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
