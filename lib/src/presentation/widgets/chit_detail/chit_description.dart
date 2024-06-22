import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

List<Widget> entriesToWidgets(
    List<MapEntry<String, String>> listOfMaps, BuildContext context) {
  final List<Widget> result = [];

  for (final entry in listOfMaps) {
    result.add(Text(
      entry.key,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
    ));
    result.add(SizedBox(
      height: SizeConfig.safeBlockVertical * 0.5,
    ));
    result.add(Text(
      entry.value,
      style: Theme.of(context).textTheme.titleMedium,
    ));
    result.add(SizedBox(
      height: SizeConfig.safeBlockVertical * 2,
    ));
  }
  return result;
}

class ChitDescription extends StatelessWidget {
  final ChitModel chit;
  const ChitDescription({
    super.key,
    required this.chit,
  });

  @override
  Widget build(BuildContext context) {
    final chitAsMap = ChitModel.asMap(chit);
    chitAsMap.remove('Name');
    chitAsMap.remove('Amount');

    List<MapEntry<String, String>> chitEntries = chitAsMap.entries.toList();
    int half = (chitEntries.length / 2).round();
    List<MapEntry<String, String>> entriesInTheLeft =
        chitEntries.take(half).toList();

    List<MapEntry<String, String>> entriesInTheRight =
        chitEntries.skip(half).toList();

    final List<Widget> leftColumnWidgets =
        entriesToWidgets(entriesInTheLeft, context);
    final List<Widget> rightColumnWidgets =
        entriesToWidgets(entriesInTheRight, context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: leftColumnWidgets,
          ),
        ),
        SizedBox(
          width: SizeConfig.safeBlockHorizontal * 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rightColumnWidgets,
          ),
        ),
      ],
    );
  }
}
