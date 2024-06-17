import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/chit_item.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class ChitList extends StatelessWidget {
  final List<ChitWithDates> chitsWithDates;
  const ChitList({
    super.key,
    required this.chitsWithDates,
  });

  @override
  Widget build(BuildContext context) {
    if (chitsWithDates.isEmpty) {
      return Center(
        child: SizedBox(
          width: SizeConfig.safeBlockHorizontal * 80,
          child: Text(
            'You have no Chits. Add one to view it here',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: chitsWithDates.length,
      itemBuilder: (context, index) => ChitItem(
        chitWithDates: chitsWithDates[index],
      ),
    );
  }
}
